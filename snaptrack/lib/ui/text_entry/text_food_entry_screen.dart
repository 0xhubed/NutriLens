import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../data/models/food_entry.dart';
import '../../data/services/ai_provider.dart';
import '../../data/services/database_service.dart';
import '../../data/providers/analysis_providers.dart';

class TextFoodEntryScreen extends ConsumerStatefulWidget {
  const TextFoodEntryScreen({super.key});

  @override
  ConsumerState<TextFoodEntryScreen> createState() => _TextFoodEntryScreenState();
}

class _TextFoodEntryScreenState extends ConsumerState<TextFoodEntryScreen> {
  final _textController = TextEditingController();
  final _weightController = TextEditingController();
  bool _isAnalyzing = false;
  bool _includeWeight = false;
  List<FoodSuggestion> _suggestions = [];
  FoodSuggestion? _selectedSuggestion;

  @override
  void dispose() {
    _textController.dispose();
    _weightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Food by Text'),
        actions: [
          if (_selectedSuggestion != null)
            TextButton(
              onPressed: _saveFoodEntry,
              child: const Text('Save'),
            ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Describe your food',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Text(
              'Examples: "Grilled chicken breast with rice", "Large apple", "1 cup oatmeal with banana"',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 16),
            
            // Text input
            TextField(
              controller: _textController,
              decoration: const InputDecoration(
                labelText: 'Food description',
                hintText: 'e.g., Grilled salmon with vegetables',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.restaurant),
              ),
              maxLines: 3,
              onChanged: (value) {
                setState(() {
                  _suggestions.clear();
                  _selectedSuggestion = null;
                });
              },
            ),
            const SizedBox(height: 16),
            
            // Weight section
            Row(
              children: [
                Checkbox(
                  value: _includeWeight,
                  onChanged: (value) {
                    setState(() {
                      _includeWeight = value ?? false;
                      if (!_includeWeight) {
                        _weightController.clear();
                      }
                    });
                  },
                ),
                Expanded(
                  child: Text(
                    'Include weight for better accuracy',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ],
            ),
            if (_includeWeight) ...[
              const SizedBox(height: 8),
              TextField(
                controller: _weightController,
                decoration: const InputDecoration(
                  labelText: 'Weight (grams)',
                  hintText: 'e.g., 150',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.scale),
                  suffixText: 'g',
                ),
                keyboardType: TextInputType.number,
              ),
            ],
            const SizedBox(height: 24),
            
            // Analyze button
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: _textController.text.trim().isEmpty || _isAnalyzing
                    ? null
                    : _analyzeText,
                child: _isAnalyzing
                    ? const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          ),
                          SizedBox(width: 12),
                          Text('Analyzing...'),
                        ],
                      )
                    : const Text('Get Nutrition Info'),
              ),
            ),
            const SizedBox(height: 24),
            
            // Suggestions
            if (_suggestions.isNotEmpty) ...[
              Text(
                'AI Suggestions',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 12),
              Expanded(
                child: ListView.builder(
                  itemCount: _suggestions.length,
                  itemBuilder: (context, index) {
                    final suggestion = _suggestions[index];
                    final isSelected = _selectedSuggestion == suggestion;
                    return Card(
                      elevation: isSelected ? 8 : 2,
                      color: isSelected 
                          ? Theme.of(context).colorScheme.primaryContainer 
                          : null,
                      child: ListTile(
                        title: Text(
                          suggestion.name,
                          style: TextStyle(
                            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                          ),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('${suggestion.calories.toStringAsFixed(0)} kcal'),
                            Text(
                              'P: ${suggestion.protein.toStringAsFixed(1)}g • '
                              'C: ${suggestion.carbs.toStringAsFixed(1)}g • '
                              'F: ${suggestion.fat.toStringAsFixed(1)}g',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[600],
                              ),
                            ),
                            if (suggestion.estimatedWeight != null)
                              Text(
                                'Estimated weight: ${suggestion.estimatedWeight!.toStringAsFixed(0)}g',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.blue[600],
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                          ],
                        ),
                        trailing: isSelected
                            ? Icon(
                                Icons.check_circle,
                                color: Theme.of(context).colorScheme.primary,
                              )
                            : null,
                        onTap: () {
                          setState(() {
                            _selectedSuggestion = isSelected ? null : suggestion;
                          });
                        },
                      ),
                    );
                  },
                ),
              ),
            ] else if (_isAnalyzing) ...[
              const Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(),
                      SizedBox(height: 16),
                      Text('AI is analyzing your food description...'),
                    ],
                  ),
                ),
              ),
            ] else ...[
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.description,
                        size: 64,
                        color: Colors.grey[400],
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Enter a food description to get started',
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Future<void> _analyzeText() async {
    final description = _textController.text.trim();
    if (description.isEmpty) return;

    setState(() {
      _isAnalyzing = true;
      _suggestions.clear();
      _selectedSuggestion = null;
    });

    try {
      final aiManager = ref.read(aiProviderManagerProvider);
      final weightHint = _includeWeight && _weightController.text.isNotEmpty
          ? ' (weight: ${_weightController.text}g)'
          : '';
      
      final fullDescription = description + weightHint;
      
      // Call AI provider to analyze text description
      final result = await aiManager.analyzeTextDescription(fullDescription);
      
      setState(() {
        _suggestions = result.suggestions;
      });
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Analysis failed: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      setState(() {
        _isAnalyzing = false;
      });
    }
  }

  Future<void> _saveFoodEntry() async {
    if (_selectedSuggestion == null) return;

    try {
      final suggestion = _selectedSuggestion!;
      
      // Create food entry with weight consideration
      final userWeight = _includeWeight && _weightController.text.isNotEmpty
          ? double.tryParse(_weightController.text)
          : null;
      
      // Calculate weight-adjusted nutrition
      final baseWeight = suggestion.estimatedWeight ?? 100.0; // default to 100g
      final actualWeight = userWeight ?? baseWeight;
      final weightMultiplier = actualWeight / baseWeight;
      
      final entry = FoodEntry()
        ..name = suggestion.name
        ..imageBase64 = '' // No image for text entries
        ..calories = suggestion.calories * weightMultiplier
        ..protein = suggestion.protein * weightMultiplier
        ..carbs = suggestion.carbs * weightMultiplier
        ..fat = suggestion.fat * weightMultiplier
        ..timestamp = DateTime.now()
        ..mealType = FoodEntry.suggestMealTypeByTime(DateTime.now())
        ..estimatedWeight = suggestion.estimatedWeight
        ..userWeight = userWeight
        ..aiProvider = ref.read(aiProviderManagerProvider).activeProvider?.providerId
        ..notes = 'Added via text: "${_textController.text.trim()}"';

      final dbService = ref.read(databaseServiceProvider);
      await dbService.saveFoodEntry(entry);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Food entry saved successfully!'),
            backgroundColor: Colors.green,
          ),
        );
        
        // Navigate back to home
        context.pop();
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to save entry: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }
}

