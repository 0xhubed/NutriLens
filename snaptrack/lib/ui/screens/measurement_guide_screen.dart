import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/theme/app_theme.dart';
import '../../data/models/measurement_guide.dart';
import '../../data/models/measurement_unit.dart';
import '../../data/providers/measurement_guide_providers.dart';
import '../widgets/measurement_guide_widget.dart';

class MeasurementGuideScreen extends ConsumerStatefulWidget {
  final String? initialUnitId;
  final MeasurementCategory? initialCategory;
  
  const MeasurementGuideScreen({
    super.key,
    this.initialUnitId,
    this.initialCategory,
  });

  @override
  ConsumerState<MeasurementGuideScreen> createState() => _MeasurementGuideScreenState();
}

class _MeasurementGuideScreenState extends ConsumerState<MeasurementGuideScreen>
    with TickerProviderStateMixin, SingleTickerProviderStateMixin {
  late TabController _tabController;
  final _searchController = TextEditingController();
  
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    
    // Set initial tab based on category
    if (widget.initialCategory != null) {
      final categoryIndex = _getCategoryTabIndex(widget.initialCategory!);
      if (categoryIndex != -1) {
        _tabController.index = categoryIndex;
      }
    }
  }
  
  @override
  void dispose() {
    _tabController.dispose();
    _searchController.dispose();
    super.dispose();
  }
  
  int _getCategoryTabIndex(MeasurementCategory category) {
    switch (category) {
      case MeasurementCategory.liquid:
        return 1;
      case MeasurementCategory.powder:
        return 2;
      case MeasurementCategory.solid:
        return 3;
      case MeasurementCategory.bulk:
        return 4;
      default:
        return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 120,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('Measurement Guide'),
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      colorScheme.primary.withOpacity(0.1),
                      colorScheme.secondary.withOpacity(0.1),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),
            ),
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: colorScheme.onSurface,
              ),
              style: IconButton.styleFrom(
                backgroundColor: colorScheme.surface.withOpacity(0.8),
                foregroundColor: colorScheme.onSurface,
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.settings),
                style: IconButton.styleFrom(
                  backgroundColor: colorScheme.surface.withOpacity(0.8),
                  foregroundColor: colorScheme.onSurface,
                ),
                onPressed: () => _showSettings(),
              ),
            ],
            bottom: TabBar(
              controller: _tabController,
              tabs: const [
                Tab(text: 'All', icon: Icon(Icons.apps)),
                Tab(text: 'Volume', icon: Icon(Icons.local_drink)),
                Tab(text: 'Weight', icon: Icon(Icons.scale)),
                Tab(text: 'Pieces', icon: Icon(Icons.circle)),
              ],
              labelColor: colorScheme.primary,
              unselectedLabelColor: colorScheme.onSurfaceVariant,
              indicatorColor: colorScheme.primary,
            ),
          ),
          
          SliverPadding(
            padding: const EdgeInsets.all(AppSpacing.md),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                // Quick search
                _SearchBar(controller: _searchController),
                SizedBox(height: AppSpacing.md),
                
                // Quick reference section
                _QuickReferenceSection(),
                SizedBox(height: AppSpacing.lg),
                
                // Main content
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      // All guides
                      widget.initialUnitId != null
                          ? MeasurementGuideWidget(
                              unitId: widget.initialUnitId,
                              showSearch: false,
                            )
                          : const MeasurementGuideWidget(showSearch: false),
                      
                      // Liquid guides
                      const MeasurementGuideWidget(
                        category: MeasurementCategory.liquid,
                        showSearch: false,
                      ),
                      
                      // Powder guides
                      const MeasurementGuideWidget(
                        category: MeasurementCategory.powder,
                        showSearch: false,
                      ),
                      
                      // Solid guides
                      const MeasurementGuideWidget(
                        category: MeasurementCategory.solid,
                        showSearch: false,
                      ),
                      
                      // Bulk guides
                      const MeasurementGuideWidget(
                        category: MeasurementCategory.bulk,
                        showSearch: false,
                      ),
                    ],
                  ),
                ),
              ]),
            ),
          ),
        ],
      ),
      
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showInteractiveGuide(),
        icon: const Icon(Icons.play_arrow),
        label: const Text('Interactive Guide'),
      ),
    );
  }
  
  Widget _SearchBar({required TextEditingController controller}) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    return TextField(
      controller: controller,
      onChanged: (value) {
        ref.read(guideSearchProvider.notifier).state = value;
      },
      decoration: InputDecoration(
        hintText: 'Search measurement guides...',
        prefixIcon: const Icon(Icons.search),
        suffixIcon: controller.text.isNotEmpty
            ? IconButton(
                icon: const Icon(Icons.clear),
                onPressed: () {
                  controller.clear();
                  ref.read(guideSearchProvider.notifier).state = '';
                },
              )
            : null,
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
  
  void _showSettings() {
    showModalBottomSheet(
      context: context,
      builder: (context) => const _GuideSettingsSheet(),
    );
  }
  
  void _showInteractiveGuide() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const _InteractiveGuideScreen(),
      ),
    );
  }
}

class _QuickReferenceSection extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final quickGuidesAsync = ref.watch(quickReferenceGuidesProvider);
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              Icons.flash_on,
              color: colorScheme.secondary,
              size: 20,
            ),
            SizedBox(width: AppSpacing.sm),
            Text(
              'Quick Reference',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: colorScheme.onSurface,
              ),
            ),
            const Spacer(),
            TextButton(
              onPressed: () {
                // Navigate to favorites
              },
              child: const Text('View All'),
            ),
          ],
        ),
        SizedBox(height: AppSpacing.sm),
        
        SizedBox(
          height: 120,
          child: quickGuidesAsync.when(
            data: (guides) => ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: guides.length,
              itemBuilder: (context, index) {
                final guide = guides[index];
                return Container(
                  width: 200,
                  margin: EdgeInsets.only(right: AppSpacing.sm),
                  child: _QuickReferenceCard(guide: guide),
                );
              },
            ),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, stack) => Center(
              child: Text('Error: $error'),
            ),
          ),
        ),
      ],
    );
  }
}

class _QuickReferenceCard extends StatelessWidget {
  final MeasurementGuide guide;
  
  const _QuickReferenceCard({required this.guide});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.md),
        side: BorderSide(
          color: colorScheme.outline.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => MeasurementGuideScreen(
                initialUnitId: guide.unitId,
              ),
            ),
          );
        },
        borderRadius: BorderRadius.circular(AppRadius.md),
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: colorScheme.onPrimaryContainer,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 14,
                    color: colorScheme.onSurfaceVariant,
                  ),
                ],
              ),
              SizedBox(height: AppSpacing.sm),
              
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      guide.title,
                      style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: AppSpacing.xs),
                    
                    Text(
                      guide.primaryVisualComparison,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _GuideSettingsSheet extends ConsumerWidget {
  const _GuideSettingsSheet();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final preferences = ref.watch(guidePreferencesProvider);
    
    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Guide Settings',
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: AppSpacing.md),
          
          SwitchListTile(
            title: const Text('Show Visual References'),
            subtitle: const Text('Display hand and object comparisons'),
            value: preferences.showVisualReferences,
            onChanged: (value) {
              ref.read(guidePreferencesProvider.notifier)
                  .setShowVisualReferences(value);
            },
          ),
          
          SwitchListTile(
            title: const Text('Show Measurement Tips'),
            subtitle: const Text('Display how-to tips and common mistakes'),
            value: preferences.showMeasurementTips,
            onChanged: (value) {
              ref.read(guidePreferencesProvider.notifier)
                  .setShowMeasurementTips(value);
            },
          ),
          
          SwitchListTile(
            title: const Text('Show Approximate Weights'),
            subtitle: const Text('Display estimated gram weights'),
            value: preferences.showApproximateWeights,
            onChanged: (value) {
              ref.read(guidePreferencesProvider.notifier)
                  .setShowApproximateWeights(value);
            },
          ),
          
          SwitchListTile(
            title: const Text('Compact Mode'),
            subtitle: const Text('Show condensed view'),
            value: preferences.compactMode,
            onChanged: (value) {
              ref.read(guidePreferencesProvider.notifier)
                  .setCompactMode(value);
            },
          ),
          
          SizedBox(height: AppSpacing.md),
          
          ListTile(
            title: const Text('Preferred Reference Type'),
            subtitle: Text(preferences.preferredReferenceType),
            trailing: const Icon(Icons.arrow_drop_down),
            onTap: () => _showReferenceTypeDialog(context, ref),
          ),
        ],
      ),
    );
  }
  
  void _showReferenceTypeDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Preferred Reference Type'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            'all',
            'hand',
            'object',
          ].map((type) => RadioListTile<String>(
            title: Text(type.toUpperCase()),
            value: type,
            groupValue: ref.read(guidePreferencesProvider).preferredReferenceType,
            onChanged: (value) {
              if (value != null) {
                ref.read(guidePreferencesProvider.notifier)
                    .setPreferredReferenceType(value);
                Navigator.of(context).pop();
              }
            },
          )).toList(),
        ),
      ),
    );
  }
}

class _InteractiveGuideScreen extends ConsumerWidget {
  const _InteractiveGuideScreen();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final guideState = ref.watch(interactiveGuideProvider);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Interactive Guide'),
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          children: [
            if (guideState.isActive) ...[
              LinearProgressIndicator(
                value: guideState.progress,
                backgroundColor: colorScheme.surfaceVariant,
                valueColor: AlwaysStoppedAnimation<Color>(colorScheme.primary),
              ),
              SizedBox(height: AppSpacing.md),
              
              Text(
                'Step ${guideState.currentStep + 1} of ${guideState.totalSteps}',
                style: theme.textTheme.titleMedium,
              ),
              SizedBox(height: AppSpacing.lg),
              
              Expanded(
                child: _InteractiveStep(step: guideState.currentStep),
              ),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: guideState.isFirstStep
                        ? null
                        : () => ref.read(interactiveGuideProvider.notifier).previousStep(),
                    child: const Text('Previous'),
                  ),
                  
                  ElevatedButton(
                    onPressed: () {
                      if (guideState.isLastStep) {
                        ref.read(interactiveGuideProvider.notifier).completeGuide();
                      } else {
                        ref.read(interactiveGuideProvider.notifier).nextStep();
                      }
                    },
                    child: Text(guideState.isLastStep ? 'Complete' : 'Next'),
                  ),
                ],
              ),
            ] else ...[
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.school,
                      size: 80,
                      color: colorScheme.primary,
                    ),
                    SizedBox(height: AppSpacing.lg),
                    
                    Text(
                      'Learn Measurement Basics',
                      style: theme.textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: AppSpacing.md),
                    
                    Text(
                      'Take an interactive tour to learn about different measurement units and how to use them accurately.',
                      style: theme.textTheme.bodyLarge?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: AppSpacing.xl),
                    
                    ElevatedButton.icon(
                      onPressed: () => ref.read(interactiveGuideProvider.notifier)
                          .startGuide('interactive_basics'),
                      icon: const Icon(Icons.play_arrow),
                      label: const Text('Start Interactive Guide'),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _InteractiveStep extends StatelessWidget {
  final int step;
  
  const _InteractiveStep({required this.step});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    switch (step) {
      case 0:
        return _buildWelcomeStep(theme);
      case 1:
        return _buildVolumeStep(theme);
      case 2:
        return _buildWeightStep(theme);
      case 3:
        return _buildHandStep(theme);
      case 4:
        return _buildTipsStep(theme);
      default:
        return Container();
    }
  }
  
  Widget _buildWelcomeStep(ThemeData theme) {
    return Column(
      children: [
        Text(
          'Welcome to Measurement Basics',
          style: theme.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: AppSpacing.lg),
        
        Text(
          'In this guide, you\'ll learn about different types of measurements and how to use them accurately for food tracking.',
          style: theme.textTheme.bodyLarge,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: AppSpacing.xl),
        
        const Icon(
          Icons.straighten,
          size: 100,
          color: Colors.blue,
        ),
      ],
    );
  }
  
  Widget _buildVolumeStep(ThemeData theme) {
    return Column(
      children: [
        Text(
          'Volume Measurements',
          style: theme.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: AppSpacing.lg),
        
        const MeasurementGuideWidget(
          category: MeasurementCategory.liquid,
          showSearch: false,
          compact: true,
        ),
      ],
    );
  }
  
  Widget _buildWeightStep(ThemeData theme) {
    return Column(
      children: [
        Text(
          'Weight Measurements',
          style: theme.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: AppSpacing.lg),
        
        const MeasurementGuideWidget(
          category: MeasurementCategory.powder,
          showSearch: false,
          compact: true,
        ),
      ],
    );
  }
  
  Widget _buildHandStep(ThemeData theme) {
    return Column(
      children: [
        Text(
          'Hand Measurements',
          style: theme.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: AppSpacing.lg),
        
        Text(
          'Your hands are convenient measuring tools! Here are some common hand-based measurements:',
          style: theme.textTheme.bodyLarge,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: AppSpacing.xl),
        
        const MeasurementGuideWidget(
          unitId: 'handful',
          showSearch: false,
          compact: true,
        ),
      ],
    );
  }
  
  Widget _buildTipsStep(ThemeData theme) {
    return Column(
      children: [
        Text(
          'Measurement Tips',
          style: theme.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: AppSpacing.lg),
        
        Text(
          'Here are some essential tips for accurate measurements:',
          style: theme.textTheme.bodyLarge,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: AppSpacing.xl),
        
        _buildTipsList(theme),
      ],
    );
  }
  
  Widget _buildTipsList(ThemeData theme) {
    final tips = [
      'Use level measurements for dry ingredients',
      'Measure liquids at eye level',
      'Use a kitchen scale for the most accuracy',
      'Keep measuring tools clean and dry',
      'Use the right tool for the right ingredient',
    ];
    
    return Column(
      children: tips.map((tip) => Padding(
        padding: EdgeInsets.only(bottom: AppSpacing.sm),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(Icons.check_circle, color: Colors.green, size: 20),
            SizedBox(width: AppSpacing.sm),
            Expanded(
              child: Text(
                tip,
                style: theme.textTheme.bodyMedium,
              ),
            ),
          ],
        ),
      )).toList(),
    );
  }
}