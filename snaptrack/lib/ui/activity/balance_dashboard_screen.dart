import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/theme/app_theme.dart';
import '../../data/providers/activity_providers.dart';
import '../../data/providers/goal_providers.dart';
import '../../data/providers/metrics_providers.dart';
import '../../data/providers/nutrition_providers.dart';

class BalanceDashboardScreen extends ConsumerWidget {
  const BalanceDashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                _buildDailyBalance(ref, colorScheme),
                const SizedBox(height: AppSpacing.lg),
                _buildBalanceMeter(ref, colorScheme),
                const SizedBox(height: AppSpacing.lg),
                _buildGoalProgress(ref, colorScheme),
                const SizedBox(height: AppSpacing.lg),
                _buildActivitySummary(ref, colorScheme),
                const SizedBox(height: AppSpacing.lg),
                _buildNutritionSummary(ref, colorScheme),
                const SizedBox(height: AppSpacing.lg),
                _buildHealthMetrics(ref, colorScheme),
                const SizedBox(height: AppSpacing.lg),
                _buildQuickActions(context, colorScheme),
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
          left: AppSpacing.md + 40,
          bottom: AppSpacing.md,
        ),
        title: Text(
          'Energy Balance',
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
                AppColors.secondaryOrange.withOpacity(0.1),
                AppColors.primaryGreen.withOpacity(0.1),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDailyBalance(WidgetRef ref, ColorScheme colorScheme) {
    final balanceAsync = ref.watch(dailyCalorieBalanceProvider);
    final todayNutrition = ref.watch(todayNutritionProvider);
    final todayActivityStats = ref.watch(todayActivityStatsProvider);

    return Card(
      elevation: 0,
      color: colorScheme.surface,
      shape: RoundedRectangleBorder(
        borderRadius: AppRadius.large,
        side: BorderSide(
          color: colorScheme.outline.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Today\'s Balance',
                  style: AppTextStyles.headlineMedium.copyWith(
                    color: colorScheme.onSurface,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.sm,
                    vertical: AppSpacing.xs,
                  ),
                  decoration: BoxDecoration(
                    color: colorScheme.primary.withOpacity(0.1),
                    borderRadius: AppRadius.extraLarge,
                  ),
                  child: Text(
                    DateTime.now().day.toString(),
                    style: AppTextStyles.labelMedium.copyWith(
                      color: colorScheme.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.lg),
            _buildBalanceBreakdown(todayNutrition, todayActivityStats, colorScheme),
          ],
        ),
      ),
    );
  }

  Widget _buildBalanceBreakdown(
    AsyncValue todayNutrition,
    AsyncValue todayActivityStats,
    ColorScheme colorScheme,
  ) {
    return todayNutrition.when(
      data: (nutrition) {
        return todayActivityStats.when(
          data: (activityStats) {
            final foodCalories = nutrition?.totalCalories ?? 0.0;
            final activityBurn = activityStats.totalCalories;
            final estimatedBMR = 1800.0; // TODO: Calculate from user metrics
            final netBalance = foodCalories - activityBurn - estimatedBMR;

            return Column(
              children: [
                _buildBalanceRow(
                  'Food Intake',
                  '+${foodCalories.toStringAsFixed(0)} cal',
                  Icons.restaurant_rounded,
                  AppColors.primaryGreen,
                  true,
                ),
                const SizedBox(height: AppSpacing.md),
                _buildBalanceRow(
                  'Exercise Burn',
                  '-${activityBurn.toStringAsFixed(0)} cal',
                  Icons.fitness_center_rounded,
                  AppColors.proteinPurple,
                  false,
                ),
                const SizedBox(height: AppSpacing.md),
                _buildBalanceRow(
                  'Base Metabolic',
                  '-${estimatedBMR.toStringAsFixed(0)} cal',
                  Icons.favorite_rounded,
                  AppColors.carbsBlue,
                  false,
                ),
                const SizedBox(height: AppSpacing.lg),
                Divider(color: colorScheme.outline.withOpacity(0.2)),
                const SizedBox(height: AppSpacing.lg),
                _buildNetBalanceRow(netBalance, colorScheme),
              ],
            );
          },
          loading: () => _buildLoadingState(),
          error: (_, __) => _buildErrorState(),
        );
      },
      loading: () => _buildLoadingState(),
      error: (_, __) => _buildErrorState(),
    );
  }

  Widget _buildBalanceRow(
    String label,
    String value,
    IconData icon,
    Color color,
    bool isPositive,
  ) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(AppSpacing.sm),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: AppRadius.small,
          ),
          child: Icon(
            icon,
            color: color,
            size: 20,
          ),
        ),
        const SizedBox(width: AppSpacing.md),
        Expanded(
          child: Text(
            label,
            style: AppTextStyles.bodyLarge.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ),
        Text(
          value,
          style: AppTextStyles.titleLarge.copyWith(
            color: color,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }

  Widget _buildNetBalanceRow(double netBalance, ColorScheme colorScheme) {
    final isDeficit = netBalance < 0;
    final isBalanced = netBalance.abs() < 50;
    final color = isBalanced
        ? AppColors.primaryGreen
        : isDeficit
            ? AppColors.carbsBlue
            : AppColors.secondaryOrange;
    
    final label = isBalanced
        ? 'Balanced'
        : isDeficit
            ? 'Deficit'
            : 'Surplus';
    
    final icon = isBalanced
        ? Icons.balance_rounded
        : isDeficit
            ? Icons.trending_down_rounded
            : Icons.trending_up_rounded;

    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: AppRadius.medium,
        border: Border.all(
          color: color.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(AppSpacing.sm),
            decoration: BoxDecoration(
              color: color.withOpacity(0.15),
              borderRadius: AppRadius.small,
            ),
            child: Icon(
              icon,
              color: color,
              size: 24,
            ),
          ),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Net Balance',
                  style: AppTextStyles.labelLarge.copyWith(
                    color: color,
                  ),
                ),
                Text(
                  label,
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: color.withOpacity(0.8),
                  ),
                ),
              ],
            ),
          ),
          Text(
            '${netBalance >= 0 ? '+' : ''}${netBalance.toStringAsFixed(0)} cal',
            style: AppTextStyles.displaySmall.copyWith(
              color: color,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBalanceMeter(WidgetRef ref, ColorScheme colorScheme) {
    final balanceAsync = ref.watch(dailyCalorieBalanceProvider);
    
    return Card(
      elevation: 0,
      color: colorScheme.surface,
      shape: RoundedRectangleBorder(
        borderRadius: AppRadius.large,
        side: BorderSide(
          color: colorScheme.outline.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Balance Meter',
              style: AppTextStyles.headlineMedium.copyWith(
                color: colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
            balanceAsync.when(
              data: (balance) => _buildBalanceVisualization(balance, colorScheme),
              loading: () => _buildLoadingState(),
              error: (_, __) => _buildErrorState(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBalanceVisualization(CalorieBalance balance, ColorScheme colorScheme) {
    final normalizedBalance = (balance.netCalories / 1000).clamp(-1.0, 1.0);
    final meterPosition = (normalizedBalance + 1) / 2; // Convert to 0-1 range
    
    return Column(
      children: [
        // Balance meter
        Container(
          height: 60,
          child: Stack(
            children: [
              // Background track
              Positioned(
                top: 25,
                left: 0,
                right: 0,
                child: Container(
                  height: 10,
                  decoration: BoxDecoration(
                    borderRadius: AppRadius.small,
                    gradient: LinearGradient(
                      colors: [
                        AppColors.carbsBlue,
                        AppColors.primaryGreen,
                        AppColors.secondaryOrange,
                      ],
                      stops: const [0.0, 0.5, 1.0],
                    ),
                  ),
                ),
              ),
              // Position indicator
              Positioned(
                left: meterPosition * (MediaQuery.of(context).size.width - 100) - 20,
                top: 10,
                child: Column(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: colorScheme.surface,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: colorScheme.primary,
                          width: 3,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: colorScheme.shadow.withOpacity(0.2),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.my_location_rounded,
                        color: colorScheme.primary,
                        size: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        // Labels
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Deficit',
              style: AppTextStyles.labelMedium.copyWith(
                color: AppColors.carbsBlue,
              ),
            ),
            Text(
              'Balanced',
              style: AppTextStyles.labelMedium.copyWith(
                color: AppColors.primaryGreen,
              ),
            ),
            Text(
              'Surplus',
              style: AppTextStyles.labelMedium.copyWith(
                color: AppColors.secondaryOrange,
              ),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.md),
        Text(
          balance.formattedBalance,
          style: AppTextStyles.displayMedium.copyWith(
            color: colorScheme.onSurface,
            fontWeight: FontWeight.w800,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildGoalProgress(WidgetRef ref, ColorScheme colorScheme) {
    // Use demo goal for now
    final demoGoal = ref.watch(demoGoalProvider);
    ref.read(currentGoalProvider.notifier).state = demoGoal;
    
    final progressAsync = ref.watch(goalProgressProvider);
    final suggestionsAsync = ref.watch(goalSuggestionsProvider);
    
    return Card(
      elevation: 0,
      color: colorScheme.surface,
      shape: RoundedRectangleBorder(
        borderRadius: AppRadius.large,
        side: BorderSide(
          color: colorScheme.outline.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Goal Progress',
                  style: AppTextStyles.headlineMedium.copyWith(
                    color: colorScheme.onSurface,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // TODO: Navigate to goal settings
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Goal settings coming soon!'),
                      ),
                    );
                  },
                  child: Text(
                    'Set Goal',
                    style: AppTextStyles.labelLarge.copyWith(
                      color: colorScheme.primary,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.md),
            progressAsync.when(
              data: (progress) {
                if (progress == null) {
                  return _buildNoGoalState(colorScheme);
                }
                return Column(
                  children: [
                    _buildGoalProgressContent(progress, colorScheme),
                    const SizedBox(height: AppSpacing.md),
                    suggestionsAsync.when(
                      data: (suggestions) => _buildSuggestions(suggestions, colorScheme),
                      loading: () => const SizedBox.shrink(),
                      error: (_, __) => const SizedBox.shrink(),
                    ),
                  ],
                );
              },
              loading: () => _buildLoadingState(),
              error: (_, __) => _buildErrorState(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGoalProgressContent(GoalProgress progress, ColorScheme colorScheme) {
    final color = progress.onTrack ? AppColors.primaryGreen : AppColors.secondaryOrange;
    
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: AppRadius.medium,
        border: Border.all(
          color: color.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                progress.goal.name,
                style: AppTextStyles.titleLarge.copyWith(
                  color: color,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.sm,
                  vertical: AppSpacing.xs,
                ),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.15),
                  borderRadius: AppRadius.small,
                ),
                child: Text(
                  progress.status,
                  style: AppTextStyles.labelMedium.copyWith(
                    color: color,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            progress.goal.description,
            style: AppTextStyles.bodyMedium.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          // Progress bar
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 8,
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.2),
                    borderRadius: AppRadius.small,
                  ),
                  child: FractionallySizedBox(
                    alignment: Alignment.centerLeft,
                    widthFactor: progress.progressPercentage.clamp(0.0, 1.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: color,
                        borderRadius: AppRadius.small,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: AppSpacing.sm),
              Text(
                progress.progressLabel,
                style: AppTextStyles.labelMedium.copyWith(
                  color: color,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            progress.timeRemainingLabel,
            style: AppTextStyles.labelMedium.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSuggestions(List<String> suggestions, ColorScheme colorScheme) {
    if (suggestions.isEmpty) return const SizedBox.shrink();
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Suggestions',
          style: AppTextStyles.titleMedium.copyWith(
            color: colorScheme.onSurface,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: AppSpacing.sm),
        ...suggestions.take(2).map((suggestion) => Padding(
          padding: const EdgeInsets.only(bottom: AppSpacing.xs),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 6),
                width: 4,
                height: 4,
                decoration: BoxDecoration(
                  color: colorScheme.primary,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: AppSpacing.sm),
              Expanded(
                child: Text(
                  suggestion,
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ),
            ],
          ),
        )),
      ],
    );
  }

  Widget _buildNoGoalState(ColorScheme colorScheme) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.xl),
      child: Column(
        children: [
          Icon(
            Icons.flag_outlined,
            size: 48,
            color: colorScheme.onSurfaceVariant,
          ),
          const SizedBox(height: AppSpacing.md),
          Text(
            'No active goal',
            style: AppTextStyles.titleMedium.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            'Set a goal to track your progress',
            style: AppTextStyles.bodyMedium.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildActivitySummary(WidgetRef ref, ColorScheme colorScheme) {
    final activityStats = ref.watch(todayActivityStatsProvider);
    
    return Card(
      elevation: 0,
      color: colorScheme.surface,
      shape: RoundedRectangleBorder(
        borderRadius: AppRadius.large,
        side: BorderSide(
          color: colorScheme.outline.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Activity Summary',
                  style: AppTextStyles.headlineMedium.copyWith(
                    color: colorScheme.onSurface,
                  ),
                ),
                TextButton(
                  onPressed: () => context.push('/activity'),
                  child: Text(
                    'Log Activity',
                    style: AppTextStyles.labelLarge.copyWith(
                      color: colorScheme.primary,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.md),
            activityStats.when(
              data: (stats) => _buildActivityStatsGrid(stats, colorScheme),
              loading: () => _buildLoadingState(),
              error: (_, __) => _buildErrorState(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActivityStatsGrid(ActivityStats stats, ColorScheme colorScheme) {
    return Row(
      children: [
        Expanded(
          child: _buildStatCard(
            'Calories',
            '${stats.totalCalories.toStringAsFixed(0)}',
            'burned',
            Icons.local_fire_department_rounded,
            AppColors.secondaryOrange,
          ),
        ),
        const SizedBox(width: AppSpacing.sm),
        Expanded(
          child: _buildStatCard(
            'Duration',
            stats.formattedDuration,
            'active',
            Icons.schedule_rounded,
            AppColors.carbsBlue,
          ),
        ),
        const SizedBox(width: AppSpacing.sm),
        Expanded(
          child: _buildStatCard(
            'Activities',
            '${stats.activityCount}',
            'logged',
            Icons.fitness_center_rounded,
            AppColors.proteinPurple,
          ),
        ),
      ],
    );
  }

  Widget _buildNutritionSummary(WidgetRef ref, ColorScheme colorScheme) {
    final todayNutrition = ref.watch(todayNutritionProvider);
    
    return Card(
      elevation: 0,
      color: colorScheme.surface,
      shape: RoundedRectangleBorder(
        borderRadius: AppRadius.large,
        side: BorderSide(
          color: colorScheme.outline.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Nutrition Summary',
                  style: AppTextStyles.headlineMedium.copyWith(
                    color: colorScheme.onSurface,
                  ),
                ),
                TextButton(
                  onPressed: () => context.push('/camera'),
                  child: Text(
                    'Add Food',
                    style: AppTextStyles.labelLarge.copyWith(
                      color: colorScheme.primary,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.md),
            todayNutrition.when(
              data: (nutrition) {
                if (nutrition == null) {
                  return _buildEmptyNutritionState(colorScheme);
                }
                return _buildNutritionStatsGrid(nutrition, colorScheme);
              },
              loading: () => _buildLoadingState(),
              error: (_, __) => _buildErrorState(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNutritionStatsGrid(nutrition, ColorScheme colorScheme) {
    return Row(
      children: [
        Expanded(
          child: _buildStatCard(
            'Calories',
            '${nutrition.totalCalories.toStringAsFixed(0)}',
            'consumed',
            Icons.restaurant_rounded,
            AppColors.primaryGreen,
          ),
        ),
        const SizedBox(width: AppSpacing.sm),
        Expanded(
          child: _buildStatCard(
            'Protein',
            '${nutrition.totalProtein.toStringAsFixed(0)}g',
            'eaten',
            Icons.fitness_center_rounded,
            AppColors.proteinPurple,
          ),
        ),
        const SizedBox(width: AppSpacing.sm),
        Expanded(
          child: _buildStatCard(
            'Meals',
            '${nutrition.mealCount}',
            'logged',
            Icons.restaurant_menu_rounded,
            AppColors.carbsBlue,
          ),
        ),
      ],
    );
  }

  Widget _buildStatCard(
    String label,
    String value,
    String subtitle,
    IconData icon,
    Color color,
  ) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: AppRadius.medium,
        border: Border.all(
          color: color.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Column(
        children: [
          Icon(
            icon,
            color: color,
            size: 24,
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            value,
            style: AppTextStyles.titleLarge.copyWith(
              color: color,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(
            label,
            style: AppTextStyles.labelMedium.copyWith(
              color: color.withOpacity(0.8),
            ),
          ),
          Text(
            subtitle,
            style: AppTextStyles.labelSmall.copyWith(
              color: color.withOpacity(0.6),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHealthMetrics(WidgetRef ref, ColorScheme colorScheme) {
    final todayMetrics = ref.watch(todayMetricsProvider);
    
    return Card(
      elevation: 0,
      color: colorScheme.surface,
      shape: RoundedRectangleBorder(
        borderRadius: AppRadius.large,
        side: BorderSide(
          color: colorScheme.outline.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Health Metrics',
              style: AppTextStyles.headlineMedium.copyWith(
                color: colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            todayMetrics.when(
              data: (metrics) => _buildMetricsContent(ref, metrics, colorScheme),
              loading: () => _buildLoadingState(),
              error: (_, __) => _buildErrorState(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMetricsContent(WidgetRef ref, UserMetrics? metrics, ColorScheme colorScheme) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _buildMetricCard(
                'Weight',
                metrics?.weight?.toStringAsFixed(1) ?? '--',
                'lbs',
                Icons.scale_rounded,
                AppColors.proteinPurple,
                () => _showWeightDialog(ref),
              ),
            ),
            const SizedBox(width: AppSpacing.sm),
            Expanded(
              child: _buildMetricCard(
                'Water',
                metrics?.waterLiters?.toStringAsFixed(1) ?? '0.0',
                'L',
                Icons.water_drop_rounded,
                AppColors.carbsBlue,
                () => _showWaterDialog(ref),
              ),
            ),
            const SizedBox(width: AppSpacing.sm),
            Expanded(
              child: _buildMetricCard(
                'Sleep',
                metrics?.sleepHours?.toStringAsFixed(1) ?? '--',
                'hrs',
                Icons.bedtime_rounded,
                AppColors.primaryGreen,
                () => _showSleepDialog(ref),
              ),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.md),
        _buildQuickWaterButtons(ref, colorScheme),
      ],
    );
  }

  Widget _buildMetricCard(
    String label,
    String value,
    String unit,
    IconData icon,
    Color color,
    VoidCallback onTap,
  ) {
    return InkWell(
      onTap: onTap,
      borderRadius: AppRadius.medium,
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: AppRadius.medium,
          border: Border.all(
            color: color.withOpacity(0.2),
            width: 1,
          ),
        ),
        child: Column(
          children: [
            Icon(
              icon,
              color: color,
              size: 24,
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(
              value,
              style: AppTextStyles.titleLarge.copyWith(
                color: color,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              unit,
              style: AppTextStyles.labelSmall.copyWith(
                color: color.withOpacity(0.7),
              ),
            ),
            const SizedBox(height: AppSpacing.xs),
            Text(
              label,
              style: AppTextStyles.labelMedium.copyWith(
                color: color.withOpacity(0.8),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickWaterButtons(WidgetRef ref, ColorScheme colorScheme) {
    return Row(
      children: [
        const Icon(
          Icons.water_drop_outlined,
          color: AppColors.carbsBlue,
          size: 20,
        ),
        const SizedBox(width: AppSpacing.sm),
        Text(
          'Quick add:',
          style: AppTextStyles.labelMedium.copyWith(
            color: colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(width: AppSpacing.sm),
        ...[0.25, 0.5, 1.0].map((amount) => Container(
          margin: const EdgeInsets.only(right: AppSpacing.xs),
          child: InkWell(
            onTap: () => _addWater(ref, amount),
            borderRadius: AppRadius.small,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.sm,
                vertical: AppSpacing.xs,
              ),
              decoration: BoxDecoration(
                color: AppColors.carbsBlue.withOpacity(0.1),
                borderRadius: AppRadius.small,
                border: Border.all(
                  color: AppColors.carbsBlue.withOpacity(0.2),
                  width: 1,
                ),
              ),
              child: Text(
                '+${amount}L',
                style: AppTextStyles.labelSmall.copyWith(
                  color: AppColors.carbsBlue,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        )),
      ],
    );
  }

  void _showWeightDialog(WidgetRef ref) {
    final controller = TextEditingController();
    
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Log Weight'),
        content: TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            labelText: 'Weight (lbs)',
            suffixText: 'lbs',
          ),
          autofocus: true,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              final weight = double.tryParse(controller.text);
              if (weight != null) {
                ref.read(quickLogStateProvider.notifier).logWeight(weight);
                Navigator.pop(context);
              }
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  void _showWaterDialog(WidgetRef ref) {
    final controller = TextEditingController();
    
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Log Water Intake'),
        content: TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            labelText: 'Water (liters)',
            suffixText: 'L',
          ),
          autofocus: true,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              final water = double.tryParse(controller.text);
              if (water != null) {
                ref.read(quickLogStateProvider.notifier).logWater(water);
                Navigator.pop(context);
              }
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  void _showSleepDialog(WidgetRef ref) {
    final controller = TextEditingController();
    
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Log Sleep'),
        content: TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            labelText: 'Sleep (hours)',
            suffixText: 'hrs',
          ),
          autofocus: true,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              final sleep = double.tryParse(controller.text);
              if (sleep != null) {
                ref.read(quickLogStateProvider.notifier).logSleep(sleep);
                Navigator.pop(context);
              }
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  void _addWater(WidgetRef ref, double amount) {
    ref.read(quickLogStateProvider.notifier).addWater(amount);
  }

  Widget _buildQuickActions(BuildContext context, ColorScheme colorScheme) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton.icon(
            onPressed: () => context.push('/activity'),
            icon: const Icon(Icons.fitness_center_rounded),
            label: const Text('Log Activity'),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.proteinPurple,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.all(AppSpacing.md),
              shape: RoundedRectangleBorder(
                borderRadius: AppRadius.medium,
              ),
            ),
          ),
        ),
        const SizedBox(width: AppSpacing.md),
        Expanded(
          child: ElevatedButton.icon(
            onPressed: () => context.push('/camera'),
            icon: const Icon(Icons.restaurant_rounded),
            label: const Text('Add Food'),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryGreen,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.all(AppSpacing.md),
              shape: RoundedRectangleBorder(
                borderRadius: AppRadius.medium,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildEmptyNutritionState(ColorScheme colorScheme) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Column(
        children: [
          Icon(
            Icons.restaurant_menu_rounded,
            size: 48,
            color: colorScheme.onSurfaceVariant,
          ),
          const SizedBox(height: AppSpacing.md),
          Text(
            'No meals logged today',
            style: AppTextStyles.titleMedium.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoadingState() {
    return Container(
      height: 100,
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget _buildErrorState() {
    return Container(
      height: 100,
      child: Center(
        child: Text(
          'Error loading data',
          style: AppTextStyles.bodyMedium.copyWith(
            color: Theme.of(context).colorScheme.error,
          ),
        ),
      ),
    );
  }
}