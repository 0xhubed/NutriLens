import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/theme/app_theme.dart';
import '../../data/models/activity_entry.dart';
import '../../data/providers/activity_providers.dart';
import '../../data/services/activity_service.dart';

class ActivityLoggerScreen extends ConsumerStatefulWidget {
  const ActivityLoggerScreen({super.key});

  @override
  ConsumerState<ActivityLoggerScreen> createState() => _ActivityLoggerScreenState();
}

class _ActivityLoggerScreenState extends ConsumerState<ActivityLoggerScreen> {
  final _searchController = TextEditingController();
  
  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      ref.read(activitySearchProvider.notifier).state = _searchController.text;
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.background,
      body: CustomScrollView(
        slivers: [
          _buildAppBar(context, colorScheme),
          SliverPadding(
            padding: const EdgeInsets.all(AppSpacing.md),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                _buildSearchBar(colorScheme),
                const SizedBox(height: AppSpacing.lg),
                _buildQuickActions(colorScheme),
                const SizedBox(height: AppSpacing.lg),
                _buildCategoryFilter(colorScheme),
                const SizedBox(height: AppSpacing.lg),
                _buildActivityList(),
                const SizedBox(height: AppSpacing.xxxl),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppBar(BuildContext context, ColorScheme colorScheme) {
    return SliverAppBar(
      expandedHeight: 120,
      floating: true,
      snap: true,
      backgroundColor: colorScheme.surface,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.arrow_back_rounded, color: colorScheme.onSurface),
        onPressed: () => context.pop(),
      ),
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsets.only(
          left: AppSpacing.md + 40, // Account for back button
          bottom: AppSpacing.md,
        ),
        title: Text(
          'Log Activity',
          style: AppTextStyles.headlineLarge.copyWith(
            color: colorScheme.onSurface,
            fontWeight: FontWeight.w800,
          ),
        ),
        background: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                colorScheme.primary.withOpacity(0.05),
                colorScheme.secondary.withOpacity(0.05),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSearchBar(ColorScheme colorScheme) {
    return Container(
      decoration: BoxDecoration(
        color: colorScheme.surfaceVariant.withOpacity(0.5),
        borderRadius: AppRadius.large,
        border: Border.all(
          color: colorScheme.outline.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: TextField(
        controller: _searchController,
        decoration: InputDecoration(
          hintText: 'Search activities...',
          prefixIcon: Icon(
            Icons.search_rounded,
            color: colorScheme.onSurfaceVariant,
          ),
          suffixIcon: _searchController.text.isNotEmpty
              ? IconButton(
                  icon: Icon(
                    Icons.clear_rounded,
                    color: colorScheme.onSurfaceVariant,
                  ),
                  onPressed: () {
                    _searchController.clear();
                    ref.read(activitySearchProvider.notifier).state = '';
                  },
                )
              : null,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.all(AppSpacing.md),
          hintStyle: AppTextStyles.bodyMedium.copyWith(
            color: colorScheme.onSurfaceVariant.withOpacity(0.7),
          ),
        ),
        style: AppTextStyles.bodyMedium.copyWith(
          color: colorScheme.onSurface,
        ),
      ),
    );
  }

  Widget _buildQuickActions(ColorScheme colorScheme) {
    final recentActivities = ref.watch(recentActivitiesProvider);
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Quick Add',
          style: AppTextStyles.headlineMedium.copyWith(
            color: colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        recentActivities.when(
          data: (activities) {
            if (activities.isEmpty) {
              return _buildPopularActivities(colorScheme);
            }
            return _buildRecentActivities(activities, colorScheme);
          },
          loading: () => _buildPopularActivities(colorScheme),
          error: (_, __) => _buildPopularActivities(colorScheme),
        ),
      ],
    );
  }

  Widget _buildRecentActivities(List<ActivityEntry> activities, ColorScheme colorScheme) {
    final uniqueActivities = activities
        .map((a) => a.activityName)
        .toSet()
        .take(4)
        .toList();

    return SizedBox(
      height: 80,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: uniqueActivities.length,
        itemBuilder: (context, index) {
          final activityName = uniqueActivities[index];
          return Container(
            width: 120,
            margin: EdgeInsets.only(
              right: index < uniqueActivities.length - 1 ? AppSpacing.sm : 0,
            ),
            child: _buildQuickActivityCard(
              activityName,
              Icons.history_rounded,
              colorScheme.tertiary,
              () => _selectActivity(activityName),
            ),
          );
        },
      ),
    );
  }

  Widget _buildPopularActivities(ColorScheme colorScheme) {
    final popularActivities = ref.watch(popularActivitiesProvider);
    
    return SizedBox(
      height: 80,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: popularActivities.length,
        itemBuilder: (context, index) {
          final activity = popularActivities[index];
          return Container(
            width: 120,
            margin: EdgeInsets.only(
              right: index < popularActivities.length - 1 ? AppSpacing.sm : 0,
            ),
            child: _buildQuickActivityCard(
              activity.name,
              _getCategoryIcon(activity.category),
              _getCategoryColor(activity.category),
              () => _selectActivity(activity.name),
            ),
          );
        },
      ),
    );
  }

  Widget _buildQuickActivityCard(
    String name,
    IconData icon,
    Color color,
    VoidCallback onTap,
  ) {
    return InkWell(
      onTap: onTap,
      borderRadius: AppRadius.medium,
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.sm),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: AppRadius.medium,
          border: Border.all(
            color: color.withOpacity(0.2),
            width: 1,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: color,
              size: 24,
            ),
            const SizedBox(height: AppSpacing.xs),
            Text(
              name,
              style: AppTextStyles.labelMedium.copyWith(
                color: color,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryFilter(ColorScheme colorScheme) {
    final selectedCategory = ref.watch(selectedActivityCategoryProvider);
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Categories',
          style: AppTextStyles.headlineMedium.copyWith(
            color: colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        SizedBox(
          height: 50,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: ActivityCategory.values.length + 1, // +1 for "All"
            itemBuilder: (context, index) {
              if (index == 0) {
                return _buildCategoryChip(
                  'All',
                  Icons.apps_rounded,
                  selectedCategory == null,
                  () => ref.read(selectedActivityCategoryProvider.notifier).state = null,
                  colorScheme,
                );
              }
              
              final category = ActivityCategory.values[index - 1];
              return _buildCategoryChip(
                _getCategoryName(category),
                _getCategoryIcon(category),
                selectedCategory == category,
                () => ref.read(selectedActivityCategoryProvider.notifier).state = category,
                colorScheme,
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildCategoryChip(
    String label,
    IconData icon,
    bool isSelected,
    VoidCallback onTap,
    ColorScheme colorScheme,
  ) {
    final color = isSelected ? colorScheme.primary : colorScheme.onSurfaceVariant;
    
    return Container(
      margin: const EdgeInsets.only(right: AppSpacing.sm),
      child: InkWell(
        onTap: onTap,
        borderRadius: AppRadius.extraLarge,
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.md,
            vertical: AppSpacing.sm,
          ),
          decoration: BoxDecoration(
            color: isSelected
                ? colorScheme.primary.withOpacity(0.1)
                : colorScheme.surfaceVariant.withOpacity(0.5),
            borderRadius: AppRadius.extraLarge,
            border: Border.all(
              color: isSelected
                  ? colorScheme.primary.withOpacity(0.3)
                  : colorScheme.outline.withOpacity(0.2),
              width: 1,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                size: 18,
                color: color,
              ),
              const SizedBox(width: AppSpacing.xs),
              Text(
                label,
                style: AppTextStyles.labelMedium.copyWith(
                  color: color,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActivityList() {
    final activities = ref.watch(filteredActivitiesByCategoryProvider);
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Activities (${activities.length})',
          style: AppTextStyles.headlineMedium.copyWith(
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: activities.length,
          itemBuilder: (context, index) {
            final activity = activities[index];
            return _buildActivityTile(activity);
          },
        ),
      ],
    );
  }

  Widget _buildActivityTile(Activity activity) {
    final colorScheme = Theme.of(context).colorScheme;
    final categoryColor = _getCategoryColor(activity.category);
    
    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.sm),
      child: InkWell(
        onTap: () => _selectActivity(activity.name),
        borderRadius: AppRadius.medium,
        child: Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(
            color: colorScheme.surface,
            borderRadius: AppRadius.medium,
            border: Border.all(
              color: colorScheme.outline.withOpacity(0.2),
              width: 1,
            ),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(AppSpacing.sm),
                decoration: BoxDecoration(
                  color: categoryColor.withOpacity(0.1),
                  borderRadius: AppRadius.small,
                ),
                child: Icon(
                  _getCategoryIcon(activity.category),
                  color: categoryColor,
                  size: 24,
                ),
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      activity.name,
                      style: AppTextStyles.titleMedium.copyWith(
                        color: colorScheme.onSurface,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.xs),
                    Text(
                      activity.description,
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: AppSpacing.sm),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.sm,
                      vertical: AppSpacing.xs,
                    ),
                    decoration: BoxDecoration(
                      color: categoryColor.withOpacity(0.1),
                      borderRadius: AppRadius.small,
                    ),
                    child: Text(
                      '${activity.baseMET} MET',
                      style: AppTextStyles.labelSmall.copyWith(
                        color: categoryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(height: AppSpacing.xs),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 16,
                    color: colorScheme.onSurfaceVariant,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _selectActivity(String activityName) {
    // Navigate to activity details/form screen
    context.push('/activity/log/$activityName');
  }

  IconData _getCategoryIcon(ActivityCategory category) {
    switch (category) {
      case ActivityCategory.cardio:
        return Icons.directions_run_rounded;
      case ActivityCategory.strength:
        return Icons.fitness_center_rounded;
      case ActivityCategory.sports:
        return Icons.sports_basketball_rounded;
      case ActivityCategory.flexibility:
        return Icons.self_improvement_rounded;
      case ActivityCategory.water:
        return Icons.pool_rounded;
      case ActivityCategory.other:
        return Icons.more_horiz_rounded;
    }
  }

  Color _getCategoryColor(ActivityCategory category) {
    switch (category) {
      case ActivityCategory.cardio:
        return AppColors.secondaryOrange;
      case ActivityCategory.strength:
        return AppColors.proteinPurple;
      case ActivityCategory.sports:
        return AppColors.carbsBlue;
      case ActivityCategory.flexibility:
        return AppColors.primaryGreen;
      case ActivityCategory.water:
        return AppColors.carbsBlue;
      case ActivityCategory.other:
        return Theme.of(context).colorScheme.tertiary;
    }
  }

  String _getCategoryName(ActivityCategory category) {
    switch (category) {
      case ActivityCategory.cardio:
        return 'Cardio';
      case ActivityCategory.strength:
        return 'Strength';
      case ActivityCategory.sports:
        return 'Sports';
      case ActivityCategory.flexibility:
        return 'Flexibility';
      case ActivityCategory.water:
        return 'Water';
      case ActivityCategory.other:
        return 'Other';
    }
  }
}