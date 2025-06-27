import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/theme/app_theme.dart';
import '../../data/models/measurement_unit.dart';
import '../widgets/natural_language_input_widget.dart';
import '../widgets/bulk_ingredient_input_widget.dart';
import '../widgets/multi_unit_input_widget.dart';

class IngredientParserDemoScreen extends ConsumerStatefulWidget {
  const IngredientParserDemoScreen({super.key});

  @override
  ConsumerState<IngredientParserDemoScreen> createState() => _IngredientParserDemoScreenState();
}

class _IngredientParserDemoScreenState extends ConsumerState<IngredientParserDemoScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<FoodPortion> _portions = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        title: const Text('Measurement Input Demo'),
        backgroundColor: colorScheme.surface,
        elevation: 0,
        scrolledUnderElevation: 0,
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(
              icon: Icon(Icons.chat_bubble_outline_rounded),
              text: 'Natural Language',
            ),
            Tab(
              icon: Icon(Icons.list_alt_rounded),
              text: 'Bulk Input',
            ),
            Tab(
              icon: Icon(Icons.tune_rounded),
              text: 'Manual Entry',
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildNaturalLanguageTab(),
                _buildBulkInputTab(),
                _buildManualEntryTab(),
              ],
            ),
          ),
          if (_portions.isNotEmpty) _buildPortionsList(colorScheme),
        ],
      ),
    );
  }

  Widget _buildNaturalLanguageTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Natural Language Input',
            style: AppTextStyles.headlineMedium.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            'Enter food descriptions in plain English and watch them get parsed automatically.',
            style: AppTextStyles.bodyLarge.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          NaturalLanguageInputWidget(
            onPortionParsed: _addPortion,
          ),
          const SizedBox(height: AppSpacing.lg),
          _buildParsingExamples(),
        ],
      ),
    );
  }

  Widget _buildBulkInputTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Bulk Ingredient Input',
            style: AppTextStyles.headlineMedium.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            'Enter multiple ingredients at once, one per line. Perfect for recipes or meal prep.',
            style: AppTextStyles.bodyLarge.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          BulkIngredientInputWidget(
            onPortionsParsed: _addPortions,
          ),
        ],
      ),
    );
  }

  Widget _buildManualEntryTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Manual Portion Entry',
            style: AppTextStyles.headlineMedium.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            'Traditional manual entry with dropdowns and precise control.',
            style: AppTextStyles.bodyLarge.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          MultiUnitInputWidget(
            foodName: 'Mixed Food',
            portions: _portions,
            onPortionsChanged: (portions) {
              setState(() {
                _portions = portions;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildParsingExamples() {
    final examples = [
      {
        'category': 'Fractions',
        'examples': ['1/2 cup rice', '3 1/4 cups flour', '2/3 cup milk'],
      },
      {
        'category': 'Decimals', 
        'examples': ['2.5 tablespoons oil', '1.25 cups water', '0.5 teaspoons salt'],
      },
      {
        'category': 'Word Numbers',
        'examples': ['two cups sugar', 'half cup butter', 'a dozen eggs'],
      },
      {
        'category': 'Size Descriptors',
        'examples': ['3 medium apples', '2 large potatoes', '5 small carrots'],
      },
      {
        'category': 'Complex Items',
        'examples': ['6 oz chicken breast', '1 lb ground beef', '2 slices whole wheat bread'],
      },
    ];

    return Card(
      elevation: 0,
      color: Theme.of(context).colorScheme.surfaceVariant.withOpacity(0.3),
      shape: RoundedRectangleBorder(
        borderRadius: AppRadius.large,
        side: BorderSide(
          color: Theme.of(context).colorScheme.outline.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Supported Formats',
              style: AppTextStyles.titleLarge.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            ...examples.map((category) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  category['category'] as String,
                  style: AppTextStyles.titleMedium.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: AppSpacing.xs),
                ...(category['examples'] as List<String>).map((example) => 
                  Padding(
                    padding: const EdgeInsets.only(left: AppSpacing.md, bottom: AppSpacing.xs),
                    child: Text(
                      '• $example',
                      style: AppTextStyles.bodyMedium.copyWith(
                        fontFamily: 'monospace',
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: AppSpacing.sm),
              ],
            )),
          ],
        ),
      ),
    );
  }

  Widget _buildPortionsList(ColorScheme colorScheme) {
    final totalWeight = _portions.fold(0.0, (sum, p) => sum + p.effectiveGrams);
    
    return Container(
      decoration: BoxDecoration(
        color: colorScheme.surface,
        border: Border(
          top: BorderSide(
            color: colorScheme.outline.withOpacity(0.2),
            width: 1,
          ),
        ),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Added Portions (${_portions.length})',
                  style: AppTextStyles.titleMedium.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      'Total: ${totalWeight.toStringAsFixed(0)}g',
                      style: AppTextStyles.titleMedium.copyWith(
                        color: colorScheme.primary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(width: AppSpacing.sm),
                    IconButton(
                      onPressed: _clearPortions,
                      icon: Icon(
                        Icons.clear_all_rounded,
                        color: colorScheme.error,
                      ),
                      visualDensity: VisualDensity.compact,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: 120,
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
              itemCount: _portions.length,
              itemBuilder: (context, index) {
                final portion = _portions[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: AppSpacing.xs),
                  child: ListTile(
                    dense: true,
                    title: Text(
                      portion.foodName,
                      style: AppTextStyles.bodyMedium.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    subtitle: Text(
                      '${portion.formattedQuantity} (~${portion.effectiveGrams.toStringAsFixed(0)}g)',
                      style: AppTextStyles.bodySmall,
                    ),
                    trailing: IconButton(
                      onPressed: () => _removePortion(index),
                      icon: Icon(
                        Icons.remove_circle_outline_rounded,
                        color: colorScheme.error,
                        size: 20,
                      ),
                      visualDensity: VisualDensity.compact,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _addPortion(FoodPortion portion) {
    setState(() {
      _portions.add(portion);
    });
  }

  void _addPortions(List<FoodPortion> portions) {
    setState(() {
      _portions.addAll(portions);
    });
  }

  void _removePortion(int index) {
    setState(() {
      _portions.removeAt(index);
    });
  }

  void _clearPortions() {
    setState(() {
      _portions.clear();
    });
  }
}