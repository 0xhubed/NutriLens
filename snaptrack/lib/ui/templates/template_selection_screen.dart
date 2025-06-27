import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/theme/app_theme.dart';
import '../../data/models/meal_template.dart';
import '../../data/models/food_entry.dart';
import '../../data/services/template_service.dart';
import '../../data/services/database_service.dart';
import '../../data/providers/nutrition_providers.dart';
import '../common/date_time_picker_widget.dart';

class TemplateSelectionScreen extends ConsumerStatefulWidget {
  const TemplateSelectionScreen({super.key});

  @override
  ConsumerState<TemplateSelectionScreen> createState() => _TemplateSelectionScreenState();
}

class _TemplateSelectionScreenState extends ConsumerState<TemplateSelectionScreen> {
  String _searchQuery = '';
  MealType? _selectedMealType;
  late DateTime _selectedDateTime;
  
  List<MealTemplate> _allTemplates = [];
  List<MealTemplate> _filteredTemplates = [];

  @override
  void initState() {
    super.initState();
    _selectedDateTime = DateTime.now();
    _loadTemplates();
  }

  TemplateService get _templateService {
    final nutritionRepo = ref.read(nutritionRepositoryProvider);
    return TemplateService(nutritionRepo.databaseService.isar);
  }

  Future<void> _loadTemplates() async {
    final templates = await _templateService.getAllTemplates();
    setState(() {
      _allTemplates = templates;
      _applyFilters();
    });
  }

  void _applyFilters() {
    _filteredTemplates = _allTemplates.where((template) {
      final matchesSearch = _searchQuery.isEmpty || 
          template.name.toLowerCase().contains(_searchQuery.toLowerCase());
      final matchesMealType = _selectedMealType == null || 
          template.mealType == _selectedMealType;
      return matchesSearch && matchesMealType;
    }).toList();
  }

  Future<void> _useTemplate(MealTemplate template) async {
    try {
      // Use the template service to create a food entry
      final foodEntry = await _templateService.useTemplate(template, timestamp: _selectedDateTime);
      
      // Save the food entry to database
      final dbService = ref.read(databaseServiceProvider);
      await dbService.saveFoodEntry(foodEntry);

      // Invalidate providers to refresh UI
      _invalidateAnalyticsProviders(_selectedDateTime);

      if (mounted) {
        // Show success message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              children: [
                const Icon(Icons.check_circle, color: Colors.white),
                const SizedBox(width: 8),
                Expanded(
                  child: Text('Added "${template.name}" to your meals'),
                ),
              ],
            ),
            backgroundColor: AppColors.success,
            action: SnackBarAction(
              label: 'View',
              textColor: Colors.white,
              onPressed: () => context.go('/'),
            ),
          ),
        );

        // Navigate back to home
        context.go('/');
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error adding template: $e'),
            backgroundColor: AppColors.error,
          ),
        );
      }
    }
  }

  void _invalidateAnalyticsProviders(DateTime affectedDate) {
    // Always invalidate global providers
    ref.invalidate(foodEntriesProvider);
    ref.invalidate(todayNutritionProvider);
    
    // Invalidate date-specific providers (assuming these exist)
    // This follows the same pattern as in history_screen.dart
    try {
      ref.invalidate(foodEntriesByDateProvider(affectedDate));
    } catch (e) {
      // Provider might not exist, ignore
    }
  }


  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose Template'),
        backgroundColor: colorScheme.surface,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => context.pop(),
        ),
      ),
      body: Column(
        children: [
          // Search and filter section
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: colorScheme.surface,
              boxShadow: [
                BoxShadow(
                  color: colorScheme.outline.withOpacity(0.1),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              children: [
                // Search bar
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Search templates...',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: colorScheme.surfaceContainerHighest.withOpacity(0.3),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _searchQuery = value;
                      _applyFilters();
                    });
                  },
                ),
                const SizedBox(height: 12),
                
                // Meal type filter
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _buildMealTypeChip('All', null, colorScheme),
                      const SizedBox(width: 8),
                      ...MealType.values.map((type) => 
                        Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: _buildMealTypeChip(
                            type.name.toUpperCase(), 
                            type, 
                            colorScheme
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          
          // Date and Time Selection
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: colorScheme.surfaceVariant.withOpacity(0.1),
              border: Border(
                top: BorderSide(
                  color: colorScheme.outline.withOpacity(0.1),
                  width: 1,
                ),
              ),
            ),
            child: DateTimePickerWidget(
              initialDateTime: _selectedDateTime,
              onDateTimeChanged: (newDateTime) {
                setState(() {
                  _selectedDateTime = newDateTime;
                });
              },
              label: 'When did you eat this?',
            ),
          ),
          
          // Templates list
          Expanded(
            child: _filteredTemplates.isEmpty
                ? _buildEmptyState()
                : ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: _filteredTemplates.length,
                    itemBuilder: (context, index) {
                      final template = _filteredTemplates[index];
                      return _buildTemplateCard(template, colorScheme);
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildMealTypeChip(String label, MealType? type, ColorScheme colorScheme) {
    final isSelected = _selectedMealType == type;
    return FilterChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (selected) {
        setState(() {
          _selectedMealType = selected ? type : null;
          _applyFilters();
        });
      },
      backgroundColor: colorScheme.surface,
      selectedColor: colorScheme.primaryContainer,
      checkmarkColor: colorScheme.onPrimaryContainer,
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.library_books_outlined,
            size: 64,
            color: Theme.of(context).colorScheme.outline,
          ),
          const SizedBox(height: 16),
          Text(
            _searchQuery.isNotEmpty || _selectedMealType != null
                ? 'No templates match your filters'
                : 'No templates saved yet',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            _searchQuery.isNotEmpty || _selectedMealType != null
                ? 'Try adjusting your search or filters'
                : 'Create templates from your food entries\nto quickly add them later',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTemplateCard(MealTemplate template, ColorScheme colorScheme) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: () => _useTemplate(template),
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header with name and meal type
              Row(
                children: [
                  Expanded(
                    child: Text(
                      template.name,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: _getMealTypeColor(template.mealType).withOpacity(0.2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      template.mealType.name.toUpperCase(),
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: _getMealTypeColor(template.mealType),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              
              if (template.description.isNotEmpty) ...[
                const SizedBox(height: 8),
                Text(
                  template.description,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
              
              const SizedBox(height: 12),
              
              // Nutrition info
              Row(
                children: [
                  _buildNutritionBadge(
                    '${template.calories.toStringAsFixed(0)} kcal',
                    AppColors.secondaryOrange,
                    Icons.local_fire_department,
                  ),
                  const SizedBox(width: 12),
                  _buildNutritionBadge(
                    'P: ${template.protein.toStringAsFixed(1)}g',
                    AppColors.proteinPurple,
                    Icons.fitness_center,
                  ),
                  const SizedBox(width: 12),
                  _buildNutritionBadge(
                    'C: ${template.carbs.toStringAsFixed(1)}g',
                    AppColors.carbsBlue,
                    Icons.grain,
                  ),
                  const SizedBox(width: 12),
                  _buildNutritionBadge(
                    'F: ${template.fat.toStringAsFixed(1)}g',
                    AppColors.fatsYellow,
                    Icons.opacity,
                  ),
                ],
              ),
              
              const SizedBox(height: 12),
              
              // Action button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () => _useTemplate(template),
                  icon: const Icon(Icons.add),
                  label: const Text('Add to Meals'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colorScheme.primary,
                    foregroundColor: colorScheme.onPrimary,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNutritionBadge(String text, Color color, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: color),
          const SizedBox(width: 4),
          Text(
            text,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ],
      ),
    );
  }

  Color _getMealTypeColor(MealType mealType) {
    switch (mealType) {
      case MealType.breakfast:
        return Colors.orange;
      case MealType.lunch:
        return Colors.green;
      case MealType.dinner:
        return Colors.blue;
      case MealType.snack:
        return Colors.purple;
    }
  }
}