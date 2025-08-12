import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'dart:math' as math;

import '../../core/theme/app_theme.dart';
import '../../core/utils/responsive_helper.dart';
import '../../core/utils/localization_extension.dart';
import '../../data/models/daily_nutrition.dart';
import '../../data/providers/activity_providers.dart';
import '../../data/providers/nutrition_providers.dart';
import '../../data/services/database_service.dart';

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
            padding: EdgeInsets.all(ResponsiveHelper.adaptivePadding(context)),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                _buildWelcomeSection(context),
                const SizedBox(height: AppSpacing.lg),
                _buildQuickActions(context, colorScheme),
                const SizedBox(height: AppSpacing.lg),
                _buildDailySummaryCard(context, todayNutrition, colorScheme),
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
    final isCompact = ResponsiveHelper.shouldUseCompactLayout(context);
    final isMobile = ResponsiveHelper.isMobile(context);
    
    return SliverAppBar(
      expandedHeight: ResponsiveHelper.getAppBarHeight(context),
      floating: true,
      snap: true,
      backgroundColor: colorScheme.surface,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: EdgeInsets.only(
          left: ResponsiveHelper.adaptivePadding(context),
          bottom: ResponsiveHelper.adaptivePadding(context),
        ),
        title: Text(
          context.l10n.appTitle,
          style: AppTextStyles.headlineLarge.copyWith(
            color: colorScheme.onSurface,
            fontWeight: FontWeight.w800,
            fontSize: ResponsiveHelper.adaptiveFontSize(context, base: 24),
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
      actions: isCompact ? [
        PopupMenuButton<String>(
          icon: Icon(Icons.more_vert, color: colorScheme.onSurface),
          onSelected: (value) {
            switch (value) {
              case 'balance':
                context.push('/balance');
                break;
              case 'activity':
                context.push('/activity');
                break;
              case 'analytics':
                context.push('/analytics');
                break;
              case 'history':
                context.push('/history');
                break;
              case 'settings':
                context.push('/settings');
                break;
            }
          },
          itemBuilder: (context) => [
            PopupMenuItem(value: 'balance', child: Row(children: [Icon(Icons.balance_rounded, size: 20), SizedBox(width: 8), Text(context.l10n.balanceTab)])),
            PopupMenuItem(value: 'activity', child: Row(children: [Icon(Icons.fitness_center_outlined, size: 20), SizedBox(width: 8), Text(context.l10n.activityTab)])),
            PopupMenuItem(value: 'analytics', child: Row(children: [Icon(Icons.analytics_outlined, size: 20), SizedBox(width: 8), Text(context.l10n.analyticsTab)])),
            PopupMenuItem(value: 'history', child: Row(children: [Icon(Icons.history_outlined, size: 20), SizedBox(width: 8), Text(context.l10n.historyTab)])),
            PopupMenuItem(value: 'settings', child: Row(children: [Icon(Icons.settings_outlined, size: 20), SizedBox(width: 8), Text(context.l10n.settings)])),
          ],
        ),
        const SizedBox(width: AppSpacing.sm),
      ] : [
        _buildAppBarAction(
          context,
          Icons.balance_rounded,
          context.l10n.balanceTab,
          () => context.push('/balance'),
          colorScheme,
        ),
        _buildAppBarAction(
          context,
          Icons.fitness_center_outlined,
          context.l10n.activityTab,
          () => context.push('/activity'),
          colorScheme,
        ),
        _buildAppBarAction(
          context,
          Icons.analytics_outlined,
          context.l10n.analyticsTab,
          () => context.push('/analytics'),
          colorScheme,
        ),
        _buildAppBarAction(
          context,
          Icons.history_outlined,
          context.l10n.historyTab,
          () => context.push('/history'),
          colorScheme,
        ),
        _buildAppBarAction(
          context,
          Icons.settings_outlined,
          context.l10n.settings,
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
      greeting = context.l10n.goodMorning;
    } else if (hour < 17) {
      greeting = context.l10n.goodAfternoon;
    } else {
      greeting = context.l10n.goodEvening;
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
          context.l10n.readyToTrack,
          style: AppTextStyles.bodyLarge.copyWith(
            color: Theme.of(context).colorScheme.onBackground.withOpacity(0.7),
          ),
        ),
      ],
    );
  }
  
  Widget _buildQuickActions(BuildContext context, ColorScheme colorScheme) {
    final isCompact = ResponsiveHelper.shouldUseCompactLayout(context);
    
    if (isCompact) {
      return Column(
        children: [
          _buildActionCard(
            context,
            context.l10n.takePhoto,
            context.l10n.takePhotoDescription,
            Icons.camera_alt_rounded,
            colorScheme.primary,
            () => context.push('/camera'),
          ),
          const SizedBox(height: AppSpacing.md),
          _buildActionCard(
            context,
            context.l10n.typeFood,
            context.l10n.typeFoodDescription,
            Icons.edit_rounded,
            colorScheme.secondary,
            () => context.push('/text-entry'),
          ),
        ],
      );
    }
    
    return Row(
      children: [
        Expanded(
          child: _buildActionCard(
            context,
            context.l10n.takePhoto,
            context.l10n.takePhotoDescription,
            Icons.camera_alt_rounded,
            colorScheme.primary,
            () => context.push('/camera'),
          ),
        ),
        const SizedBox(width: AppSpacing.md),
        Expanded(
          child: _buildActionCard(
            context,
            context.l10n.typeFood,
            context.l10n.typeFoodDescription,
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
            mainAxisSize: MainAxisSize.min,
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
              Flexible(
                child: Text(
                  title,
                  style: AppTextStyles.titleLarge.copyWith(
                    color: color,
                    fontWeight: FontWeight.w600,
                    fontSize: ResponsiveHelper.adaptiveFontSize(context, base: 18),
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(height: AppSpacing.xs),
              Flexible(
                child: Text(
                  subtitle,
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                    fontSize: ResponsiveHelper.adaptiveFontSize(context, base: 14),
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDailySummaryCard(BuildContext context, AsyncValue<DailyNutrition?> nutritionAsync, ColorScheme colorScheme) {
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
            return _buildEmptyState(context, colorScheme);
          }
          return _buildNutritionSummary(context, nutrition, colorScheme);
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
            context.l10n.errorLoadingNutrition,
            style: AppTextStyles.bodyMedium.copyWith(
              color: colorScheme.error,
            ),
          ),
        ),
      ),
    );
  }
  
  Widget _buildEmptyState(BuildContext context, ColorScheme colorScheme) {
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
            context.l10n.noMealsLogged,
            style: AppTextStyles.headlineMedium.copyWith(
              color: colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            context.l10n.startTrackingMeal,
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
                context.l10n.takePhoto,
                Icons.camera_alt_rounded,
                colorScheme.primary,
              ),
              _buildEmptyStateAction(
                context.l10n.typeFood,
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
  
  Widget _buildNutritionSummary(BuildContext context, DailyNutrition nutrition, ColorScheme colorScheme) {
    return Padding(
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                context.l10n.todaysSummary,
                style: AppTextStyles.headlineMedium.copyWith(
                  color: colorScheme.onSurface,
                ),
              ),
              Row(
                children: [
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
                      context.l10n.meals(nutrition.mealCount),
                      style: AppTextStyles.labelMedium.copyWith(
                        color: colorScheme.primary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  if (nutrition.totalCalories == 0 && nutrition.mealCount > 0) ...[
                    const SizedBox(width: AppSpacing.xs),
                    Consumer(
                      builder: (context, ref, child) => IconButton(
                        icon: Icon(Icons.refresh, size: 20),
                        onPressed: () async {
                          await ref.read(databaseServiceProvider).recalculateDailyNutrition(DateTime.now());
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(context.l10n.recalculatingTotals)),
                          );
                        },
                        tooltip: context.l10n.recalculateTotals,
                        padding: EdgeInsets.all(AppSpacing.xs),
                        constraints: BoxConstraints(),
                        iconSize: 20,
                        color: colorScheme.error,
                      ),
                    ),
                  ],
                ],
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.lg),
          _buildCaloriesCard(context, nutrition, colorScheme),
          const SizedBox(height: AppSpacing.md),
          _buildMacronutrientCards(nutrition, colorScheme),
        ],
      ),
    );
  }
  
  Widget _buildCaloriesCard(BuildContext context, DailyNutrition nutrition, ColorScheme colorScheme) {
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
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.l10n.calories,
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
            context.l10n.kcal,
            style: AppTextStyles.titleLarge.copyWith(
              color: AppColors.secondaryOrange.withOpacity(0.7),
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildMacronutrientCards(DailyNutrition nutrition, ColorScheme colorScheme) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isCompact = ResponsiveHelper.shouldUseCompactLayout(context);
    
    final cards = [
      _buildMacroCard(
        context.l10n.protein,
        '${nutrition.totalProtein.toStringAsFixed(1)}${context.l10n.grams}',
        AppColors.proteinPurple,
        Icons.fitness_center_rounded,
      ),
      _buildMacroCard(
        context.l10n.carbs,
        '${nutrition.totalCarbs.toStringAsFixed(1)}${context.l10n.grams}',
        AppColors.carbsBlue,
        Icons.grain_rounded,
      ),
      _buildMacroCard(
        context.l10n.fat,
        '${nutrition.totalFat.toStringAsFixed(1)}${context.l10n.grams}',
        AppColors.fatsYellow,
        Icons.water_drop_rounded,
      ),
    ];
    
    if (isCompact) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: cards.map((card) => Padding(
          padding: const EdgeInsets.only(bottom: AppSpacing.sm),
          child: card,
        )).toList(),
      );
    }
    
    return Row(
      children: [
        Expanded(
          child: cards[0],
        ),
        const SizedBox(width: AppSpacing.sm),
        Expanded(
          child: cards[1],
        ),
        const SizedBox(width: AppSpacing.sm),
        Expanded(
          child: cards[2],
        ),
      ],
    );
      },
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
                    context.l10n.energyBalance,
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
                data: (balance) => _buildBalanceContent(context, balance, colorScheme),
                loading: () => _buildBalanceLoading(colorScheme),
                error: (_, __) => _buildBalanceError(context, colorScheme),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBalanceContent(BuildContext context, CalorieBalance balance, ColorScheme colorScheme) {
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
              mainAxisSize: MainAxisSize.min,
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
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              _buildBalanceStatItem(
                context.l10n.food,
                '+${balance.foodIntake.toStringAsFixed(0)}',
                AppColors.primaryGreen,
              ),
              const SizedBox(height: AppSpacing.xs),
              _buildBalanceStatItem(
                context.l10n.activityTab,
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

  Widget _buildBalanceError(BuildContext context, ColorScheme colorScheme) {
    return Container(
      height: 80,
      padding: const EdgeInsets.all(AppSpacing.md),
      child: Center(
        child: Text(
          context.l10n.unableToLoadBalance,
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
                  context.l10n.quickAccess,
                  style: AppTextStyles.headlineMedium.copyWith(
                    color: colorScheme.onSurface,
                  ),
                ),
                TextButton(
                  onPressed: () => context.push('/history'),
                  child: Text(
                    context.l10n.viewAll,
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
                    context.l10n.analytics,
                    context.l10n.analyticsDescription,
                    Icons.analytics_outlined,
                    colorScheme.tertiary,
                    () => context.push('/analytics'),
                  ),
                ),
                const SizedBox(width: AppSpacing.sm),
                Expanded(
                  child: _buildQuickAccessCard(
                    context,
                    context.l10n.templates,
                    context.l10n.templatesDescription,
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
          mainAxisSize: MainAxisSize.min,
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
      label: Text(context.l10n.addFood),
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
              context.l10n.addFood,
              style: AppTextStyles.headlineMedium.copyWith(
                color: colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(
              context.l10n.addFoodDescription,
              style: AppTextStyles.bodyMedium.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppSpacing.xl),
            _buildBottomSheetOption(
              context,
              context.l10n.takeAPhoto,
              context.l10n.snapPictureAI,
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
              context.l10n.typeDescription,
              context.l10n.describeMealText,
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
              context.l10n.useTemplate,
              context.l10n.chooseSavedMeals,
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
              context.l10n.logActivity,
              context.l10n.trackExerciseWorkouts,
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