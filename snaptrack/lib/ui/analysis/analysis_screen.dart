import 'dart:io';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../data/models/food_entry.dart';
import '../../data/providers/analysis_providers.dart';
import '../../data/services/database_service.dart';
import '../../data/services/ai_provider.dart';

class AnalysisScreen extends ConsumerStatefulWidget {
  final File imageFile;
  
  const AnalysisScreen({
    super.key,
    required this.imageFile,
  });

  @override
  ConsumerState<AnalysisScreen> createState() => _AnalysisScreenState();
}

class _AnalysisScreenState extends ConsumerState<AnalysisScreen> {
  final _nameController = TextEditingController();
  final _caloriesController = TextEditingController();
  final _proteinController = TextEditingController();
  final _carbsController = TextEditingController();
  final _fatController = TextEditingController();
  
  bool _showAlternatives = false;
  bool _userConfirmedCorrect = false;
  
  @override
  void dispose() {
    _nameController.dispose();
    _caloriesController.dispose();
    _proteinController.dispose();
    _carbsController.dispose();
    _fatController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final analysisState = ref.watch(foodAnalysisProvider);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Food Analysis'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Image preview
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.file(
                widget.imageFile,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 24),
            
            // Analysis result or loading
            analysisState.when(
              data: (result) => _buildAnalysisForm(result),
              loading: () => _buildLoadingState(),
              error: (error, stack) => _buildErrorState(error),
            ),
          ],
        ),
      ),
    );
  }
  
  Widget _buildLoadingState() {
    return Column(
      children: [
        const CircularProgressIndicator(),
        const SizedBox(height: 16),
        Text(
          'Analyzing your food...',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 8),
        const Text(
          'This may take a few seconds',
          style: TextStyle(color: Colors.grey),
        ),
      ],
    );
  }
  
  Widget _buildErrorState(Object error) {
    return Column(
      children: [
        const Icon(
          Icons.error_outline,
          size: 64,
          color: Colors.red,
        ),
        const SizedBox(height: 16),
        Text(
          'Analysis Failed',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 8),
        Text(
          error.toString(),
          style: const TextStyle(color: Colors.grey),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 24),
        Row(
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: () => _enterManually(),
                child: const Text('Enter Manually'),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: FilledButton(
                onPressed: () => _retryAnalysis(),
                child: const Text('Retry'),
              ),
            ),
          ],
        ),
      ],
    );
  }
  
  Widget _buildAnalysisForm(FoodAnalysis? result) {
    // Pre-fill form if we have analysis results
    if (result != null && _nameController.text.isEmpty) {
      _nameController.text = result.name;
      _caloriesController.text = result.calories.toString();
      _proteinController.text = result.protein.toString();
      _carbsController.text = result.carbs.toString();
      _fatController.text = result.fat.toString();
    }
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          result != null ? 'AI Analysis Results' : 'Enter Food Details',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 16),
        
        // AI Confidence Check
        if (result != null && !_userConfirmedCorrect) ...[
          _buildAIConfirmationCard(result),
          const SizedBox(height: 16),
        ],
        
        TextFormField(
          controller: _nameController,
          decoration: const InputDecoration(
            labelText: 'Food Name',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 16),
        
        TextFormField(
          controller: _caloriesController,
          decoration: const InputDecoration(
            labelText: 'Calories',
            border: OutlineInputBorder(),
            suffixText: 'kcal',
          ),
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: 16),
        
        Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: _proteinController,
                decoration: const InputDecoration(
                  labelText: 'Protein',
                  border: OutlineInputBorder(),
                  suffixText: 'g',
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: TextFormField(
                controller: _carbsController,
                decoration: const InputDecoration(
                  labelText: 'Carbs',
                  border: OutlineInputBorder(),
                  suffixText: 'g',
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: TextFormField(
                controller: _fatController,
                decoration: const InputDecoration(
                  labelText: 'Fat',
                  border: OutlineInputBorder(),
                  suffixText: 'g',
                ),
                keyboardType: TextInputType.number,
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        
        FilledButton(
          onPressed: _saveFoodEntry,
          child: const Text('Save Food Entry'),
        ),
        
        if (result == null) ...[
          const SizedBox(height: 16),
          OutlinedButton(
            onPressed: () => _startAnalysis(),
            child: const Text('Analyze with AI'),
          ),
        ],
      ],
    );
  }
  
  void _startAnalysis() {
    ref.read(foodAnalysisProvider.notifier).analyzeImage(widget.imageFile);
  }
  
  void _retryAnalysis() {
    _startAnalysis();
  }
  
  void _enterManually() {
    // Clear any error state and show the form
    ref.invalidate(foodAnalysisProvider);
  }
  
  Future<void> _saveFoodEntry() async {
    try {
      // Convert image to base64
      final bytes = await widget.imageFile.readAsBytes();
      final base64Image = base64Encode(bytes);
      
      final analysisResult = ref.read(foodAnalysisProvider).value;
      
      final entry = FoodEntry()
        ..name = _nameController.text
        ..imageBase64 = base64Image
        ..calories = double.tryParse(_caloriesController.text) ?? 0
        ..protein = double.tryParse(_proteinController.text) ?? 0
        ..carbs = double.tryParse(_carbsController.text) ?? 0
        ..fat = double.tryParse(_fatController.text) ?? 0
        ..timestamp = DateTime.now()
        ..mealType = analysisResult?.suggestedMealType ?? FoodEntry.suggestMealTypeByTime(DateTime.now())
        ..foodGroups = analysisResult?.suggestedFoodGroups ?? []
        ..cuisine = analysisResult?.suggestedCuisine ?? CuisineType.other
        ..dietaryTags = analysisResult?.suggestedDietaryTags ?? []
        ..portionSize = analysisResult?.portionSize
        ..cookingMethod = analysisResult?.cookingMethod
        ..detectedItems = analysisResult?.detectedItems?.map((item) => 
          DetectedFoodItem.fromFoodItem(item)
        ).toList() ?? []
        ..aiProvider = ref.read(aiProviderManagerProvider).activeProvider?.providerId;
      
      final dbService = ref.read(databaseServiceProvider);
      await dbService.saveFoodEntry(entry);
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Food entry saved!')),
        );
        context.go('/');
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error saving entry: $e')),
        );
      }
    }
  }

  Widget _buildAIConfirmationCard(FoodAnalysis result) {
    return Card(
      color: Theme.of(context).colorScheme.surfaceVariant,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.smart_toy,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: 8),
                Text(
                  'AI Detection: ${result.name}',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            const Text(
              'Is this correct?',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {
                      setState(() {
                        _showAlternatives = true;
                      });
                    },
                    icon: const Icon(Icons.close),
                    label: const Text('Not Correct'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.orange,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: FilledButton.icon(
                    onPressed: () {
                      setState(() {
                        _userConfirmedCorrect = true;
                      });
                    },
                    icon: const Icon(Icons.check),
                    label: const Text('Looks Good'),
                  ),
                ),
              ],
            ),
            if (_showAlternatives) ...[
              const SizedBox(height: 16),
              _buildAlternativeSuggestions(),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildAlternativeSuggestions() {
    // Generate alternative food suggestions based on the image
    final alternatives = _generateAlternatives();
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Select the correct food:',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        ...alternatives.map((alternative) => _buildAlternativeOption(alternative)),
        const SizedBox(height: 8),
        OutlinedButton.icon(
          onPressed: () {
            setState(() {
              _nameController.clear();
              _caloriesController.clear();
              _proteinController.clear();
              _carbsController.clear();
              _fatController.clear();
              _userConfirmedCorrect = true;
              _showAlternatives = false;
            });
          },
          icon: const Icon(Icons.edit),
          label: const Text('Enter Manually'),
        ),
      ],
    );
  }

  Widget _buildAlternativeOption(AlternativeFood alternative) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 8),
        title: Text(alternative.name),
        subtitle: Text('${alternative.calories} cal'),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {
          _selectAlternative(alternative);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(color: Colors.grey.shade300),
        ),
      ),
    );
  }

  void _selectAlternative(AlternativeFood alternative) {
    setState(() {
      _nameController.text = alternative.name;
      _caloriesController.text = alternative.calories.toString();
      _proteinController.text = alternative.protein.toString();
      _carbsController.text = alternative.carbs.toString();
      _fatController.text = alternative.fat.toString();
      _userConfirmedCorrect = true;
      _showAlternatives = false;
    });
  }

  List<AlternativeFood> _generateAlternatives() {
    final analysisResult = ref.read(foodAnalysisProvider).value;
    final detectedName = analysisResult?.name.toLowerCase() ?? '';
    
    // Generate contextual alternatives based on the AI's guess
    if (detectedName.contains('quinoa') || detectedName.contains('bowl')) {
      // If AI detected quinoa bowl, suggest pasta alternatives
      return [
        AlternativeFood('Pasta with Tomato Sauce', 350, 12, 58, 8),
        AlternativeFood('Spaghetti Marinara', 320, 11, 55, 6),
        AlternativeFood('Penne Arrabbiata', 380, 13, 62, 9),
        AlternativeFood('Pasta Bolognese', 420, 18, 55, 12),
        AlternativeFood('Linguine with Red Sauce', 340, 12, 57, 7),
      ];
    } else if (detectedName.contains('pasta') || detectedName.contains('spaghetti')) {
      // If AI detected pasta, suggest other pasta types and similar dishes
      return [
        AlternativeFood('Rice with Tomato Sauce', 280, 6, 45, 8),
        AlternativeFood('Risotto with Tomatoes', 320, 8, 52, 10),
        AlternativeFood('Pasta Salad', 290, 9, 48, 7),
        AlternativeFood('Couscous with Vegetables', 240, 8, 42, 5),
        AlternativeFood('Orzo with Marinara', 310, 10, 50, 8),
      ];
    } else if (detectedName.contains('chicken')) {
      // If AI detected chicken, suggest other protein dishes
      return [
        AlternativeFood('Turkey Breast', 165, 30, 0, 3),
        AlternativeFood('Salmon Fillet', 280, 25, 0, 18),
        AlternativeFood('Pork Tenderloin', 190, 26, 0, 8),
        AlternativeFood('Beef Sirloin', 220, 24, 0, 12),
        AlternativeFood('Tofu Stir-fry', 150, 12, 8, 8),
      ];
    } else {
      // Default common alternatives for unclear detections
      return [
        AlternativeFood('Mixed Salad', 120, 5, 15, 6),
        AlternativeFood('Sandwich', 320, 15, 35, 12),
        AlternativeFood('Soup', 180, 8, 20, 8),
        AlternativeFood('Stir-fry Vegetables', 160, 6, 18, 8),
        AlternativeFood('Rice Bowl', 280, 8, 45, 6),
      ];
    }
  }
}

class AlternativeFood {
  final String name;
  final double calories;
  final double protein;
  final double carbs;
  final double fat;

  AlternativeFood(this.name, this.calories, this.protein, this.carbs, this.fat);
}