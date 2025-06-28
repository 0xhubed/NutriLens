import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../data/models/food_entry.dart';
import '../../data/models/measurement_unit.dart';
import '../../data/services/ai_provider.dart';
import '../../data/services/database_service.dart';
import '../../data/providers/analysis_providers.dart';
import '../../data/services/analytics_service.dart';
import '../../data/providers/nutrition_providers.dart';
import '../common/date_time_picker_widget.dart';
import '../widgets/natural_language_input_widget.dart';

class TextFoodEntryScreen extends ConsumerStatefulWidget {
  const TextFoodEntryScreen({super.key});

  @override
  ConsumerState<TextFoodEntryScreen> createState() => _TextFoodEntryScreenState();
}

class _TextFoodEntryScreenState extends ConsumerState<TextFoodEntryScreen> {
  final _textController = TextEditingController();
  bool _isAnalyzing = false;
  bool _usePortionInput = true; // New: toggle between simple text and portion input
  List<FoodSuggestion> _suggestions = [];
  FoodSuggestion? _selectedSuggestion;
  late DateTime _selectedDateTime;
  List<FoodPortion> _specifiedPortions = []; // Store user-specified portions

  void _invalidateAnalyticsProviders(DateTime affectedDate) {
    // Always invalidate global providers
    ref.invalidate(foodEntriesProvider);
    ref.invalidate(todayNutritionProvider);
    
    // Invalidate date-specific providers
    ref.invalidate(foodEntriesByDateProvider(affectedDate));
    ref.invalidate(dailyProgressProvider(affectedDate));
    ref.invalidate(dailyProgressProvider(null)); // Today's progress
    
    // Invalidate weekly stats for the affected week
    final weekStart = _getWeekStart(affectedDate);
    ref.invalidate(weeklyStatsProvider(weekStart));
    
    // Invalidate current week if different
    final currentWeekStart = _getWeekStart(DateTime.now());
    if (weekStart != currentWeekStart) {
      ref.invalidate(weeklyStatsProvider(currentWeekStart));
    }
  }

  DateTime _getWeekStart(DateTime date) {
    final daysFromMonday = date.weekday - 1;
    return DateTime(date.year, date.month, date.day - daysFromMonday);
  }

  @override
  void initState() {
    super.initState();
    _selectedDateTime = DateTime.now();
  }

  @override
  void dispose() {
    _textController.dispose();
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
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Describe your food',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                Switch(
                  value: _usePortionInput,
                  onChanged: (value) {
                    setState(() {
                      _usePortionInput = value;
                      _textController.clear();
                      _specifiedPortions.clear();
                      _suggestions.clear();
                      _selectedSuggestion = null;
                    });
                  },
                ),
                Text(
                  'Portions',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              _usePortionInput 
                  ? 'Examples: "2 cups rice", "1 tbsp olive oil", "3 medium apples"'
                  : 'Examples: "Grilled chicken breast with rice", "Large apple", "oatmeal with banana"',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 16),
            
            // Text input or Portion input
            _usePortionInput ? _buildPortionInput() : _buildTextInput(),
            const SizedBox(height: 24),
            
            // Date and Time Selection
            DateTimePickerWidget(
              initialDateTime: _selectedDateTime,
              onDateTimeChanged: (newDateTime) {
                setState(() {
                  _selectedDateTime = newDateTime;
                });
              },
              label: 'When did you eat this?',
            ),
            
            const SizedBox(height: 24),
            
            // Analyze button
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: (_usePortionInput && _specifiedPortions.isEmpty) ||
                    (!_usePortionInput && _textController.text.trim().isEmpty) ||
                    _isAnalyzing
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
                            if (suggestion.portionDescription.isNotEmpty)
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                  color: Theme.of(context).colorScheme.primaryContainer,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Text(
                                  suggestion.portionDescription,
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Theme.of(context).colorScheme.primary,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            if (suggestion.description != null)
                              Text(
                                suggestion.description!,
                                style: TextStyle(
                                  fontSize: 11,
                                  color: Colors.grey[600],
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
    setState(() {
      _isAnalyzing = true;
      _suggestions.clear();
      _selectedSuggestion = null;
    });

    try {
      final aiManager = ref.read(aiProviderManagerProvider);
      String fullDescription;
      
      if (_usePortionInput && _specifiedPortions.isNotEmpty) {
        // Build description from specified portions
        fullDescription = _specifiedPortions.map((p) => 
            '${p.formattedQuantity} of ${p.foodName}').join(', ');
      } else {
        // Use simple text description
        final description = _textController.text.trim();
        if (description.isEmpty) return;
        fullDescription = description;
      }
      
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
      
      // Use nutrition values as provided by AI (already portion-adjusted)
      const double weightMultiplier = 1.0; // No additional weight scaling needed
      
      final entry = FoodEntry()
        ..name = suggestion.name
        ..imageBase64 = '' // No image for text entries
        ..calories = suggestion.calories * weightMultiplier
        ..protein = suggestion.protein * weightMultiplier
        ..carbs = suggestion.carbs * weightMultiplier
        ..fat = suggestion.fat * weightMultiplier
        ..timestamp = _selectedDateTime
        ..mealType = FoodEntry.suggestMealTypeByTime(_selectedDateTime)
        ..estimatedWeight = suggestion.estimatedWeight
        ..aiProvider = ref.read(aiProviderManagerProvider).activeProvider?.providerId
        ..notes = _usePortionInput && _specifiedPortions.isNotEmpty
            ? 'Added with portions: ${_specifiedPortions.map((p) => p.formattedQuantity).join(", ")}'
            : 'Added via text: "${_textController.text.trim()}"';
      
      // Add portion information - prefer user-specified portions over AI suggestions
      if (_usePortionInput && _specifiedPortions.isNotEmpty) {
        entry.usePortions = true;
        entry.portions = _specifiedPortions.map((portion) => 
          FoodPortion.create(
            foodName: portion.foodName,
            quantity: portion.quantity,
            unitId: portion.unitId,
            unitDisplayName: portion.unitDisplayName,
            estimatedGrams: portion.estimatedGrams,
            calories: suggestion.calories * (portion.effectiveGrams / (suggestion.estimatedWeight ?? 100)),
            protein: suggestion.protein * (portion.effectiveGrams / (suggestion.estimatedWeight ?? 100)),
            carbs: suggestion.carbs * (portion.effectiveGrams / (suggestion.estimatedWeight ?? 100)),
            fat: suggestion.fat * (portion.effectiveGrams / (suggestion.estimatedWeight ?? 100)),
          )
        ).toList();
      } else if (suggestion.quantity != null && suggestion.unitId != null && suggestion.unitDisplayName != null) {
        entry.usePortions = true;
        entry.portions = [
          FoodPortion.create(
            foodName: suggestion.name,
            quantity: suggestion.quantity!,
            unitId: suggestion.unitId!,
            unitDisplayName: suggestion.unitDisplayName!,
            estimatedGrams: suggestion.estimatedWeight,
            calories: suggestion.calories,
            protein: suggestion.protein,
            carbs: suggestion.carbs,
            fat: suggestion.fat,
          ),
        ];
      }

      final dbService = ref.read(databaseServiceProvider);
      await dbService.saveFoodEntry(entry);

      // Invalidate analytics providers to refresh all statistics
      _invalidateAnalyticsProviders(_selectedDateTime);

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

  Widget _buildPortionInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        NaturalLanguageInputWidget(
          onPortionParsed: (portion) {
            setState(() {
              _specifiedPortions.add(portion);
            });
          },
          hintText: 'e.g., "2 cups rice" or "1 tbsp olive oil"',
          showExamples: false,
        ),
        const SizedBox(height: 16),
        if (_specifiedPortions.isNotEmpty) ...[
          Text(
            'Specified Portions:',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          ...(_specifiedPortions.map((portion) => Card(
            child: ListTile(
              leading: const Icon(Icons.restaurant),
              title: Text(portion.foodName),
              subtitle: Text(portion.formattedQuantity),
              trailing: IconButton(
                icon: const Icon(Icons.remove_circle),
                onPressed: () {
                  setState(() {
                    _specifiedPortions.remove(portion);
                  });
                },
              ),
            ),
          ))),
          const SizedBox(height: 16),
        ],
      ],
    );
  }

  Widget _buildTextInput() {
    return TextField(
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
    );
  }
}

