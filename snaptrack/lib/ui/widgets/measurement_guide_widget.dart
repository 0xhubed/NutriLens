import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/theme/app_theme.dart';
import '../../data/models/measurement_guide.dart';
import '../../data/models/measurement_unit.dart';
import '../../data/providers/measurement_guide_providers.dart';

class MeasurementGuideWidget extends ConsumerWidget {
  final String? unitId;
  final MeasurementCategory? category;
  final bool showSearch;
  final bool compact;
  
  const MeasurementGuideWidget({
    super.key,
    this.unitId,
    this.category,
    this.showSearch = true,
    this.compact = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.lg),
        side: BorderSide(
          color: colorScheme.outline.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(compact ? AppSpacing.md : AppSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (!compact) ...[
              Row(
                children: [
                  Icon(
                    Icons.straighten,
                    color: colorScheme.primary,
                    size: 24,
                  ),
                  SizedBox(width: AppSpacing.sm),
                  Text(
                    'Measurement Guide',
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: colorScheme.onSurface,
                    ),
                  ),
                ],
              ),
              SizedBox(height: AppSpacing.md),
            ],
            
            if (showSearch && !compact) ...[
              _SearchBar(ref: ref),
              SizedBox(height: AppSpacing.md),
            ],
            
            if (unitId != null)
              _SingleGuideView(unitId: unitId!, compact: compact)
            else if (category != null)
              _CategoryGuideView(category: category!, compact: compact)
            else
              _AllGuidesView(compact: compact),
          ],
        ),
      ),
    );
  }
}

class _SearchBar extends StatefulWidget {
  final WidgetRef ref;
  
  const _SearchBar({required this.ref});

  @override
  State<_SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<_SearchBar> {
  final _controller = TextEditingController();
  
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    return TextField(
      controller: _controller,
      onChanged: (value) {
        widget.ref.read(guideSearchProvider.notifier).state = value;
      },
      decoration: InputDecoration(
        hintText: 'Search measurement guides...',
        prefixIcon: const Icon(Icons.search),
        filled: true,
        fillColor: colorScheme.surfaceVariant.withOpacity(0.3),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.md),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.all(AppSpacing.md),
      ),
    );
  }
}

class _SingleGuideView extends ConsumerWidget {
  final String unitId;
  final bool compact;
  
  const _SingleGuideView({
    required this.unitId,
    required this.compact,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final guideAsync = ref.watch(guideForUnitProvider(unitId));
    
    return guideAsync.when(
      data: (guide) {
        if (guide == null) {
          return _NoGuideAvailable(unitId: unitId);
        }
        return _GuideCard(guide: guide, compact: compact);
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => _ErrorCard(error: error.toString()),
    );
  }
}

class _CategoryGuideView extends ConsumerWidget {
  final MeasurementCategory category;
  final bool compact;
  
  const _CategoryGuideView({
    required this.category,
    required this.compact,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final guidesAsync = ref.watch(guidesByCategoryProvider(category));
    
    return guidesAsync.when(
      data: (guides) {
        if (guides.isEmpty) {
          return _NoGuidesForCategory(category: category);
        }
        
        return Column(
          children: guides.map((guide) => Padding(
            padding: EdgeInsets.only(bottom: AppSpacing.sm),
            child: _GuideCard(guide: guide, compact: compact),
          )).toList(),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => _ErrorCard(error: error.toString()),
    );
  }
}

class _AllGuidesView extends ConsumerWidget {
  final bool compact;
  
  const _AllGuidesView({required this.compact});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchQuery = ref.watch(guideSearchProvider);
    final guidesAsync = searchQuery.isEmpty
        ? ref.watch(allGuidesProvider)
        : ref.watch(searchGuidesProvider(searchQuery));
    
    return guidesAsync.when(
      data: (guides) {
        if (guides.isEmpty) {
          return _NoGuidesFound(searchQuery: searchQuery);
        }
        
        // Group by category
        final groupedGuides = <MeasurementCategory, List<MeasurementGuide>>{};
        for (final guide in guides) {
          groupedGuides.putIfAbsent(guide.category, () => []).add(guide);
        }
        
        return Column(
          children: groupedGuides.entries.map((entry) {
            return _CategorySection(
              category: entry.key,
              guides: entry.value,
              compact: compact,
            );
          }).toList(),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => _ErrorCard(error: error.toString()),
    );
  }
}

class _CategorySection extends StatelessWidget {
  final MeasurementCategory category;
  final List<MeasurementGuide> guides;
  final bool compact;
  
  const _CategorySection({
    required this.category,
    required this.guides,
    required this.compact,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: AppSpacing.sm),
          child: Text(
            category.displayName,
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: colorScheme.primary,
            ),
          ),
        ),
        ...guides.map((guide) => Padding(
          padding: EdgeInsets.only(bottom: AppSpacing.sm),
          child: _GuideCard(guide: guide, compact: compact),
        )),
        SizedBox(height: AppSpacing.md),
      ],
    );
  }
}

class _GuideCard extends StatelessWidget {
  final MeasurementGuide guide;
  final bool compact;
  
  const _GuideCard({
    required this.guide,
    required this.compact,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.md),
        side: BorderSide(
          color: colorScheme.outline.withOpacity(0.1),
          width: 1,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(compact ? AppSpacing.sm : AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.sm,
                    vertical: AppSpacing.xs,
                  ),
                  decoration: BoxDecoration(
                    color: colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(AppRadius.sm),
                  ),
                  child: Text(
                    guide.unitDisplayName,
                    style: theme.textTheme.labelMedium?.copyWith(
                      color: colorScheme.onPrimaryContainer,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(width: AppSpacing.sm),
                Expanded(
                  child: Text(
                    guide.title,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            
            if (!compact) ...[
              SizedBox(height: AppSpacing.sm),
              Text(
                guide.description,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            ],
            
            SizedBox(height: AppSpacing.sm),
            
            // Visual comparison
            _VisualComparisonSection(guide: guide, compact: compact),
            
            if (!compact && guide.hasVisualReferences) ...[
              SizedBox(height: AppSpacing.sm),
              _VisualReferencesSection(guide: guide),
            ],
            
            if (!compact && guide.examples.isNotEmpty) ...[
              SizedBox(height: AppSpacing.sm),
              _ExamplesSection(guide: guide),
            ],
            
            if (!compact && guide.hasMeasurementTips) ...[
              SizedBox(height: AppSpacing.sm),
              _MeasurementTipsSection(guide: guide),
            ],
            
            if (!compact && guide.approximateGrams != null) ...[
              SizedBox(height: AppSpacing.sm),
              _ApproximateWeightSection(guide: guide),
            ],
          ],
        ),
      ),
    );
  }
}

class _VisualComparisonSection extends StatelessWidget {
  final MeasurementGuide guide;
  final bool compact;
  
  const _VisualComparisonSection({
    required this.guide,
    required this.compact,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    return Container(
      padding: const EdgeInsets.all(AppSpacing.sm),
      decoration: BoxDecoration(
        color: colorScheme.secondaryContainer.withOpacity(0.3),
        borderRadius: BorderRadius.circular(AppRadius.sm),
      ),
      child: Row(
        children: [
          Icon(
            Icons.visibility,
            color: colorScheme.secondary,
            size: compact ? 18 : 20,
          ),
          SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Text(
              guide.primaryVisualComparison,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSecondaryContainer,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _VisualReferencesSection extends StatelessWidget {
  final MeasurementGuide guide;
  
  const _VisualReferencesSection({required this.guide});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Visual References',
          style: theme.textTheme.labelLarge?.copyWith(
            color: colorScheme.primary,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: AppSpacing.xs),
        
        if (guide.handComparisons.isNotEmpty) ...[
          _ReferenceItem(
            icon: Icons.back_hand,
            title: 'Hand size',
            items: guide.handComparisons,
          ),
          SizedBox(height: AppSpacing.xs),
        ],
        
        if (guide.commonObjects.isNotEmpty) ...[
          _ReferenceItem(
            icon: Icons.circle,
            title: 'Common objects',
            items: guide.commonObjects,
          ),
        ],
      ],
    );
  }
}

class _ReferenceItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final List<String> items;
  
  const _ReferenceItem({
    required this.icon,
    required this.title,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          icon,
          color: colorScheme.onSurfaceVariant,
          size: 16,
        ),
        SizedBox(width: AppSpacing.xs),
        Expanded(
          child: Text(
            '$title: ${items.join(', ')}',
            style: theme.textTheme.bodySmall?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
        ),
      ],
    );
  }
}

class _ExamplesSection extends StatelessWidget {
  final MeasurementGuide guide;
  
  const _ExamplesSection({required this.guide});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Examples',
          style: theme.textTheme.labelLarge?.copyWith(
            color: colorScheme.primary,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: AppSpacing.xs),
        Wrap(
          spacing: AppSpacing.xs,
          runSpacing: AppSpacing.xs,
          children: guide.examples.map((example) => Chip(
            label: Text(
              example,
              style: theme.textTheme.bodySmall,
            ),
            backgroundColor: colorScheme.surfaceVariant.withOpacity(0.5),
            side: BorderSide.none,
          )).toList(),
        ),
      ],
    );
  }
}

class _MeasurementTipsSection extends StatelessWidget {
  final MeasurementGuide guide;
  
  const _MeasurementTipsSection({required this.guide});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Measurement Tips',
          style: theme.textTheme.labelLarge?.copyWith(
            color: colorScheme.primary,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: AppSpacing.xs),
        
        if (guide.howToMeasure != null) ...[
          _TipItem(
            icon: Icons.info,
            color: colorScheme.tertiary,
            text: guide.howToMeasure!,
          ),
          SizedBox(height: AppSpacing.xs),
        ],
        
        if (guide.commonMistakes != null) ...[
          _TipItem(
            icon: Icons.warning,
            color: colorScheme.error,
            text: 'Common mistakes: ${guide.commonMistakes!}',
          ),
          SizedBox(height: AppSpacing.xs),
        ],
        
        if (guide.accuracyTips != null) ...[
          _TipItem(
            icon: Icons.lightbulb,
            color: colorScheme.secondary,
            text: 'Tip: ${guide.accuracyTips!}',
          ),
        ],
      ],
    );
  }
}

class _TipItem extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String text;
  
  const _TipItem({
    required this.icon,
    required this.color,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          icon,
          color: color,
          size: 16,
        ),
        SizedBox(width: AppSpacing.xs),
        Expanded(
          child: Text(
            text,
            style: theme.textTheme.bodySmall?.copyWith(
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}

class _ApproximateWeightSection extends StatelessWidget {
  final MeasurementGuide guide;
  
  const _ApproximateWeightSection({required this.guide});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    return Container(
      padding: const EdgeInsets.all(AppSpacing.sm),
      decoration: BoxDecoration(
        color: colorScheme.primaryContainer.withOpacity(0.3),
        borderRadius: BorderRadius.circular(AppRadius.sm),
      ),
      child: Row(
        children: [
          Icon(
            Icons.scale,
            color: colorScheme.primary,
            size: 16,
          ),
          SizedBox(width: AppSpacing.sm),
          Text(
            'Approximate weight: ${guide.approximateGrams!.toStringAsFixed(0)}g',
            style: theme.textTheme.bodySmall?.copyWith(
              color: colorScheme.onPrimaryContainer,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

// Error and empty states
class _NoGuideAvailable extends StatelessWidget {
  final String unitId;
  
  const _NoGuideAvailable({required this.unitId});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Column(
        children: [
          Icon(
            Icons.help_outline,
            color: colorScheme.onSurfaceVariant,
            size: 48,
          ),
          SizedBox(height: AppSpacing.md),
          Text(
            'No guide available',
            style: theme.textTheme.titleMedium?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
          SizedBox(height: AppSpacing.sm),
          Text(
            'No measurement guide is available for "$unitId" yet.',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class _NoGuidesForCategory extends StatelessWidget {
  final MeasurementCategory category;
  
  const _NoGuidesForCategory({required this.category});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Column(
        children: [
          Icon(
            Icons.category,
            color: colorScheme.onSurfaceVariant,
            size: 48,
          ),
          SizedBox(height: AppSpacing.md),
          Text(
            'No guides for ${category.displayName}',
            style: theme.textTheme.titleMedium?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}

class _NoGuidesFound extends StatelessWidget {
  final String searchQuery;
  
  const _NoGuidesFound({required this.searchQuery});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Column(
        children: [
          Icon(
            Icons.search_off,
            color: colorScheme.onSurfaceVariant,
            size: 48,
          ),
          SizedBox(height: AppSpacing.md),
          Text(
            searchQuery.isEmpty ? 'No guides available' : 'No guides found',
            style: theme.textTheme.titleMedium?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
          if (searchQuery.isNotEmpty) ...[
            SizedBox(height: AppSpacing.sm),
            Text(
              'Try a different search term.',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _ErrorCard extends StatelessWidget {
  final String error;
  
  const _ErrorCard({required this.error});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Column(
        children: [
          Icon(
            Icons.error_outline,
            color: colorScheme.error,
            size: 48,
          ),
          SizedBox(height: AppSpacing.md),
          Text(
            'Error loading guides',
            style: theme.textTheme.titleMedium?.copyWith(
              color: colorScheme.error,
            ),
          ),
          SizedBox(height: AppSpacing.sm),
          Text(
            error,
            style: theme.textTheme.bodySmall?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}