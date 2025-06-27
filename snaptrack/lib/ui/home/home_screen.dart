import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'dart:math' as math;

import '../../core/theme/app_theme.dart';
import '../../data/models/daily_nutrition.dart';
import '../../data/providers/activity_providers.dart';
import '../../data/providers/nutrition_providers.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todayNutrition = ref.watch(todayNutritionProvider);
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    return Scaffold(
      backgroundColor: colorScheme.background,
      body: CustomScrollView(
        slivers: [
          _buildModernAppBar(context, colorScheme),
          SliverPadding(
            padding: const EdgeInsets.all(AppSpacing.md),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                _buildWelcomeSection(context),
                const SizedBox(height: AppSpacing.lg),
                _buildQuickActions(context, colorScheme),
                const SizedBox(height: AppSpacing.lg),
                _buildDailySummaryCard(todayNutrition, colorScheme),
                const SizedBox(height: AppSpacing.lg),
                _buildBalancePreview(context, ref, colorScheme),
                const SizedBox(height: AppSpacing.lg),
                _buildRecentActivity(context, colorScheme),
                const SizedBox(height: AppSpacing.xxxl),
              ]),
            ),
          ),
        ],
      ),
      floatingActionButton: _buildModernFAB(context, colorScheme),
    );
  }
  
  Widget _buildModernAppBar(BuildContext context, ColorScheme colorScheme) {
    return SliverAppBar(
      expandedHeight: 120,
      floating: true,
      snap: true,
      backgroundColor: colorScheme.surface,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsets.only(
          left: AppSpacing.md,
          bottom: AppSpacing.md,
        ),
        title: Text(
          'NutriLens',
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
      actions: [
        _buildAppBarAction(
          context,
          Icons.balance_rounded,
          'Balance',
          () => context.push('/balance'),
          colorScheme,
        ),
        _buildAppBarAction(
          context,
          Icons.fitness_center_outlined,
          'Activity',
          () => context.push('/activity'),
          colorScheme,
        ),
        _buildAppBarAction(
          context,
          Icons.analytics_outlined,
          'Analytics',
          () => context.push('/analytics'),
          colorScheme,
        ),
        _buildAppBarAction(
          context,
          Icons.history_outlined,
          'History',
          () => context.push('/history'),
          colorScheme,
        ),
        _buildAppBarAction(
          context,
          Icons.settings_outlined,
          'Settings',
          () => context.push('/settings'),
          colorScheme,
        ),
        const SizedBox(width: AppSpacing.sm),
      ],
    );
  }
  
  Widget _buildAppBarAction(
    BuildContext context,
    IconData icon,
    String tooltip,
    VoidCallback onPressed,
    ColorScheme colorScheme,
  ) {
    return Container(
      margin: const EdgeInsets.only(right: AppSpacing.xs),
      child: IconButton(
        icon: Icon(icon),
        onPressed: onPressed,
        tooltip: tooltip,
        style: IconButton.styleFrom(
          backgroundColor: colorScheme.surfaceVariant.withOpacity(0.5),
          foregroundColor: colorScheme.onSurfaceVariant,
          shape: RoundedRectangleBorder(
            borderRadius: AppRadius.medium,
          ),
        ),
      ),
    );
  }
  
  Widget _buildWelcomeSection(BuildContext context) {
    final now = DateTime.now();
    final hour = now.hour;
    String greeting;
    
    if (hour < 12) {
      greeting = 'Good Morning!';
    } else if (hour < 17) {
      greeting = 'Good Afternoon!';
    } else {
      greeting = 'Good Evening!';
    }
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          greeting,
          style: AppTextStyles.displayMedium.copyWith(
            color: Theme.of(context).colorScheme.onBackground,
          ),
        ),
        const SizedBox(height: AppSpacing.xs),
        Text(
          'Ready to track your nutrition?',
          style: AppTextStyles.bodyLarge.copyWith(
            color: Theme.of(context).colorScheme.onBackground.withOpacity(0.7),
          ),
        ),
      ],
    );
  }
  
  Widget _buildQuickActions(BuildContext context, ColorScheme colorScheme) {
    return Row(
      children: [
        Expanded(
          child: _buildActionCard(
            context,
            'Take Photo',
            'Scan your meal instantly',
            Icons.camera_alt_rounded,
            colorScheme.primary,
            () => context.push('/camera'),
          ),
        ),
        const SizedBox(width: AppSpacing.md),
        Expanded(
          child: _buildActionCard(
            context,
            'Type Food',
            'Describe your meal',
            Icons.edit_rounded,
            colorScheme.secondary,
            () => context.push('/text-entry'),
          ),
        ),
      ],
    );
  }
  
  Widget _buildActionCard(
    BuildContext context,
    String title,
    String subtitle,
    IconData icon,
    Color color,
    VoidCallback onTap,
  ) {
    return Card(
      elevation: 0,
      color: color.withOpacity(0.1),
      shape: RoundedRectangleBorder(
        borderRadius: AppRadius.large,
        side: BorderSide(
          color: color.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: AppRadius.large,
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(AppSpacing.sm),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.15),
                  borderRadius: AppRadius.medium,
                ),
                child: Icon(
                  icon,
                  color: color,
                  size: 24,
                ),
              ),
              const SizedBox(height: AppSpacing.md),
              Text(
                title,
                style: AppTextStyles.titleLarge.copyWith(
                  color: color,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: AppSpacing.xs),
              Text(
                subtitle,
                style: AppTextStyles.bodyMedium.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDailySummaryCard(AsyncValue<DailyNutrition?> nutritionAsync, ColorScheme colorScheme) {
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
      child: nutritionAsync.when(
        data: (nutrition) {
          if (nutrition == null) {
            return _buildEmptyState(colorScheme);
          }
          return _buildNutritionSummary(nutrition, colorScheme);
        },
        loading: () => Container(
          height: 200,
          child: Center(
            child: CircularProgressIndicator(
              color: colorScheme.primary,
            ),
          ),
        ),
        error: (error, stack) => Container(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Text(
            'Error loading nutrition data',
            style: AppTextStyles.bodyMedium.copyWith(
              color: colorScheme.error,
            ),
          ),
        ),
      ),
    );
  }
  
  Widget _buildEmptyState(ColorScheme colorScheme) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.xl),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(AppSpacing.lg),
            decoration: BoxDecoration(
              color: colorScheme.primary.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.restaurant_menu_rounded,
              size: 48,
              color: colorScheme.primary,
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          Text(
            'No meals logged today',
            style: AppTextStyles.headlineMedium.copyWith(
              color: colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            'Start tracking your nutrition by taking a photo or typing your meal',
            textAlign: TextAlign.center,
            style: AppTextStyles.bodyMedium.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildEmptyStateAction(
                'Take Photo',
                Icons.camera_alt_rounded,
                colorScheme.primary,
              ),
              _buildEmptyStateAction(
                'Type Food',
                Icons.edit_rounded,
                colorScheme.secondary,
              ),
            ],
          ),
        ],
      ),
    );
  }
  
  Widget _buildEmptyStateAction(String label, IconData icon, Color color) {
    return Column(
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
        const SizedBox(height: AppSpacing.xs),
        Text(
          label,
          style: AppTextStyles.labelMedium.copyWith(
            color: color,
          ),
        ),
      ],
    );
  }
  
  Widget _buildNutritionSummary(DailyNutrition nutrition, ColorScheme colorScheme) {
    return Padding(
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Today\'s Summary',
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
                  '${nutrition.mealCount} meals',
                  style: AppTextStyles.labelMedium.copyWith(
                    color: colorScheme.primary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.lg),
          _buildCaloriesCard(nutrition, colorScheme),
          const SizedBox(height: AppSpacing.md),
          _buildMacronutrientCards(nutrition, colorScheme),
        ],
      ),
    );
  }
  
  Widget _buildCaloriesCard(DailyNutrition nutrition, ColorScheme colorScheme) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.secondaryOrange.withOpacity(0.1),
            AppColors.secondaryOrange.withOpacity(0.05),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: AppRadius.large,
        border: Border.all(
          color: AppColors.secondaryOrange.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(AppSpacing.md),
            decoration: BoxDecoration(
              color: AppColors.secondaryOrange.withOpacity(0.15),
              borderRadius: AppRadius.medium,
            ),
            child: Icon(
              Icons.local_fire_department_rounded,
              color: AppColors.secondaryOrange,
              size: 32,
            ),
          ),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Calories',
                  style: AppTextStyles.labelLarge.copyWith(
                    color: AppColors.secondaryOrange,
                  ),
                ),
                const SizedBox(height: AppSpacing.xs),
                Text(
                  '${nutrition.totalCalories.toStringAsFixed(0)}',
                  style: AppTextStyles.displayMedium.copyWith(
                    color: AppColors.secondaryOrange,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
          Text(
            'kcal',
            style: AppTextStyles.titleLarge.copyWith(
              color: AppColors.secondaryOrange.withOpacity(0.7),
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildMacronutrientCards(DailyNutrition nutrition, ColorScheme colorScheme) {
    return Row(
      children: [
        Expanded(
          child: _buildMacroCard(
            'Protein',
            '${nutrition.totalProtein.toStringAsFixed(1)}g',
            AppColors.proteinPurple,
            Icons.fitness_center_rounded,
          ),
        ),
        const SizedBox(width: AppSpacing.sm),
        Expanded(
          child: _buildMacroCard(
            'Carbs',
            '${nutrition.totalCarbs.toStringAsFixed(1)}g',
            AppColors.carbsBlue,
            Icons.grain_rounded,
          ),
        ),
        const SizedBox(width: AppSpacing.sm),
        Expanded(
          child: _buildMacroCard(
            'Fat',
            '${nutrition.totalFat.toStringAsFixed(1)}g',
            AppColors.fatsYellow,
            Icons.water_drop_rounded,
          ),
        ),
      ],
    );
  }
  
  Widget _buildMacroCard(String label, String value, Color color, IconData icon) {
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
        ],
      ),
    );
  }
  
  Widget _buildBalancePreview(BuildContext context, WidgetRef ref, ColorScheme colorScheme) {
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
      child: InkWell(
        onTap: () => context.push('/balance'),
        borderRadius: AppRadius.large,
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Energy Balance',
                    style: AppTextStyles.headlineMedium.copyWith(
                      color: colorScheme.onSurface,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 16,
                    color: colorScheme.onSurfaceVariant,
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.md),
              balanceAsync.when(
                data: (balance) => _buildBalanceContent(balance, colorScheme),
                loading: () => _buildBalanceLoading(colorScheme),
                error: (_, __) => _buildBalanceError(colorScheme),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBalanceContent(CalorieBalance balance, ColorScheme colorScheme) {
    final isDeficit = balance.isDeficit;
    final isBalanced = balance.isBalanced;
    final color = isBalanced
        ? AppColors.primaryGreen
        : isDeficit
            ? AppColors.carbsBlue
            : AppColors.secondaryOrange;
    
    final icon = isBalanced
        ? Icons.balance_rounded
        : isDeficit
            ? Icons.trending_down_rounded
            : Icons.trending_up_rounded;

    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            color.withOpacity(0.1),
            color.withOpacity(0.05),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
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
                  balance.balanceLabel,
                  style: AppTextStyles.titleLarge.copyWith(
                    color: color,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: AppSpacing.xs),
                Text(
                  balance.formattedBalance,
                  style: AppTextStyles.displaySmall.copyWith(
                    color: color,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              _buildBalanceStatItem(
                'Food',
                '+${balance.foodIntake.toStringAsFixed(0)}',
                AppColors.primaryGreen,
              ),
              const SizedBox(height: AppSpacing.xs),
              _buildBalanceStatItem(
                'Activity',
                '-${balance.activityBurn.toStringAsFixed(0)}',
                AppColors.proteinPurple,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBalanceStatItem(String label, String value, Color color) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          value,
          style: AppTextStyles.labelLarge.copyWith(
            color: color,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          label,
          style: AppTextStyles.labelSmall.copyWith(
            color: color.withOpacity(0.7),
          ),
        ),
      ],
    );
  }

  Widget _buildBalanceLoading(ColorScheme colorScheme) {
    return Container(
      height: 80,
      child: Center(
        child: CircularProgressIndicator(
          color: colorScheme.primary,
        ),
      ),
    );
  }

  Widget _buildBalanceError(ColorScheme colorScheme) {
    return Container(
      height: 80,
      padding: const EdgeInsets.all(AppSpacing.md),
      child: Center(
        child: Text(
          'Unable to load balance data',
          style: AppTextStyles.bodyMedium.copyWith(
            color: colorScheme.error,
          ),
        ),
      ),
    );
  }

  Widget _buildRecentActivity(BuildContext context, ColorScheme colorScheme) {
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
                  'Quick Access',
                  style: AppTextStyles.headlineMedium.copyWith(
                    color: colorScheme.onSurface,
                  ),
                ),
                TextButton(
                  onPressed: () => context.push('/history'),
                  child: Text(
                    'View All',
                    style: AppTextStyles.labelLarge.copyWith(
                      color: colorScheme.primary,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.md),
            Row(
              children: [
                Expanded(
                  child: _buildQuickAccessCard(
                    context,
                    'Analytics',
                    'View your trends',
                    Icons.analytics_outlined,
                    colorScheme.tertiary,
                    () => context.push('/analytics'),
                  ),
                ),
                const SizedBox(width: AppSpacing.sm),
                Expanded(
                  child: _buildQuickAccessCard(
                    context,
                    'Templates',
                    'Saved meals',
                    Icons.library_books_outlined,
                    colorScheme.primary,
                    () => context.push('/templates'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  
  Widget _buildQuickAccessCard(
    BuildContext context,
    String title,
    String subtitle,
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
          color: color.withOpacity(0.08),
          borderRadius: AppRadius.medium,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              icon,
              color: color,
              size: 20,
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(
              title,
              style: AppTextStyles.labelLarge.copyWith(
                color: color,
              ),
            ),
            const SizedBox(height: AppSpacing.xs),
            Text(
              subtitle,
              style: AppTextStyles.bodyMedium.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  Widget _buildModernFAB(BuildContext context, ColorScheme colorScheme) {
    return FloatingActionButton.extended(
      onPressed: () => _showAddFoodOptions(context),
      backgroundColor: colorScheme.primary,
      foregroundColor: colorScheme.onPrimary,
      elevation: 4,
      icon: const Icon(Icons.add_rounded),
      label: const Text('Add Food'),
      shape: RoundedRectangleBorder(
        borderRadius: AppRadius.extraLarge,
      ),
    );
  }
  

  void _showAddFoodOptions(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(AppRadius.xl),
          ),
        ),
        padding: EdgeInsets.only(
          left: AppSpacing.lg,
          right: AppSpacing.lg,
          top: AppSpacing.lg,
          bottom: AppSpacing.lg + MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: colorScheme.outline.withOpacity(0.4),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
            Text(
              'Add Food',
              style: AppTextStyles.headlineMedium.copyWith(
                color: colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(
              'Choose how you\'d like to track your meal',
              style: AppTextStyles.bodyMedium.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppSpacing.xl),
            _buildBottomSheetOption(
              context,
              'Take a Photo',
              'Snap a picture and let AI analyze it',
              Icons.camera_alt_rounded,
              colorScheme.primary,
              () {
                Navigator.pop(context);
                context.push('/camera');
              },
            ),
            const SizedBox(height: AppSpacing.md),
            _buildBottomSheetOption(
              context,
              'Type Description',
              'Describe your meal in text',
              Icons.edit_rounded,
              colorScheme.secondary,
              () {
                Navigator.pop(context);
                context.push('/text-entry');
              },
            ),
            const SizedBox(height: AppSpacing.md),
            _buildBottomSheetOption(
              context,
              'Use Template',
              'Choose from saved meals',
              Icons.library_books_rounded,
              colorScheme.tertiary,
              () {
                Navigator.pop(context);
                context.push('/templates/select');
              },
            ),
            const SizedBox(height: AppSpacing.md),
            _buildBottomSheetOption(
              context,
              'Log Activity',
              'Track your exercise and workouts',
              Icons.fitness_center_rounded,
              AppColors.proteinPurple,
              () {
                Navigator.pop(context);
                context.push('/activity');
              },
            ),
            const SizedBox(height: AppSpacing.md),
          ],
        ),
      ),
    );
  }
  
  Widget _buildBottomSheetOption(
    BuildContext context,
    String title,
    String subtitle,
    IconData icon,
    Color color,
    VoidCallback onTap,
  ) {
    return InkWell(
      onTap: onTap,
      borderRadius: AppRadius.large,
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.lg),
        decoration: BoxDecoration(
          color: color.withOpacity(0.08),
          borderRadius: AppRadius.large,
          border: Border.all(
            color: color.withOpacity(0.2),
            width: 1,
          ),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(AppSpacing.md),
              decoration: BoxDecoration(
                color: color.withOpacity(0.15),
                borderRadius: AppRadius.medium,
              ),
              child: Icon(
                icon,
                color: color,
                size: 28,
              ),
            ),
            const SizedBox(width: AppSpacing.md),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTextStyles.titleLarge.copyWith(
                      color: color,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.xs),
                  Text(
                    subtitle,
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios_rounded,
              color: color.withOpacity(0.6),
              size: 16,
            ),
          ],
        ),
      ),
    );
  }
}