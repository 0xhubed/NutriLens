import 'package:flutter/material.dart';
import '../../data/models/metabolic_insight.dart';
import '../../data/models/metabolic_state.dart';
import '../../core/theme/app_theme.dart';

class MetabolicInsightsCard extends StatelessWidget {
  final MetabolicInsight insight;
  final VoidCallback? onTap;

  const MetabolicInsightsCard({
    super.key,
    required this.insight,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.lg),
        side: BorderSide(
          color: colorScheme.outline.withOpacity(0.2),
        ),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppRadius.lg),
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(context),
              const SizedBox(height: AppSpacing.md),
              _buildCurrentState(context),
              const SizedBox(height: AppSpacing.md),
              _buildRecommendation(context),
              if (insight.hasActionItems) ...[
                const SizedBox(height: AppSpacing.md),
                _buildActionItems(context),
              ],
              if (insight.hasTimingRecommendation || insight.hasMacroRecommendation) ...[
                const SizedBox(height: AppSpacing.md),
                _buildAdditionalInfo(context),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.sm,
            vertical: AppSpacing.xs,
          ),
          decoration: BoxDecoration(
            color: _getConfidenceColor(insight.confidenceScore, colorScheme).withOpacity(0.1),
            borderRadius: BorderRadius.circular(AppRadius.sm),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.psychology,
                size: 16,
                color: _getConfidenceColor(insight.confidenceScore, colorScheme),
              ),
              const SizedBox(width: AppSpacing.xs),
              Text(
                'AI Insight',
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: _getConfidenceColor(insight.confidenceScore, colorScheme),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        const Spacer(),
        Row(
          children: [
            Icon(
              _getConfidenceIcon(insight.confidenceScore),
              size: 16,
              color: colorScheme.onSurface.withOpacity(0.6),
            ),
            const SizedBox(width: AppSpacing.xs),
            Text(
              insight.confidenceDescription,
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: colorScheme.onSurface.withOpacity(0.6),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildCurrentState(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: colorScheme.primaryContainer.withOpacity(0.3),
        borderRadius: BorderRadius.circular(AppRadius.md),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.timeline,
                size: 18,
                color: colorScheme.primary,
              ),
              const SizedBox(width: AppSpacing.sm),
              Text(
                'Current State',
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: colorScheme.primary,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            insight.currentState,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecommendation(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              Icons.lightbulb_outline,
              size: 18,
              color: Theme.of(context).colorScheme.secondary,
            ),
            const SizedBox(width: AppSpacing.sm),
            Text(
              'Recommendation',
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.sm),
        Text(
          insight.recommendation,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(height: AppSpacing.sm),
        Text(
          insight.reasoning,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
          ),
        ),
      ],
    );
  }

  Widget _buildActionItems(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              Icons.checklist,
              size: 18,
              color: AppColors.primaryGreen,
            ),
            const SizedBox(width: AppSpacing.sm),
            Text(
              'Action Items',
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.primaryGreen,
              ),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.sm),
        ...insight.actionItems.map((item) => Padding(
          padding: const EdgeInsets.only(bottom: AppSpacing.xs),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 6),
                width: 4,
                height: 4,
                decoration: BoxDecoration(
                  color: AppColors.primaryGreen,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: AppSpacing.sm),
              Expanded(
                child: Text(
                  item,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            ],
          ),
        )),
      ],
    );
  }

  Widget _buildAdditionalInfo(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: colorScheme.surfaceVariant.withOpacity(0.3),
        borderRadius: BorderRadius.circular(AppRadius.md),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (insight.hasTimingRecommendation) ...[
            Row(
              children: [
                Icon(
                  Icons.schedule,
                  size: 16,
                  color: colorScheme.primary,
                ),
                const SizedBox(width: AppSpacing.sm),
                Text(
                  'Next Meal: ${insight.nextOptimalMealTime}',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
          if (insight.hasTimingRecommendation && insight.hasMacroRecommendation)
            const SizedBox(height: AppSpacing.sm),
          if (insight.hasMacroRecommendation) ...[
            Row(
              children: [
                Icon(
                  Icons.pie_chart,
                  size: 16,
                  color: colorScheme.primary,
                ),
                const SizedBox(width: AppSpacing.sm),
                Text(
                  'Recommended Macros:',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.xs),
            Padding(
              padding: const EdgeInsets.only(left: AppSpacing.lg),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (insight.recommendedProtein > 0)
                    Text(
                      'Protein: ${insight.recommendedProtein.toStringAsFixed(1)}g',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  if (insight.recommendedCarbs > 0)
                    Text(
                      'Carbs: ${insight.recommendedCarbs.toStringAsFixed(1)}g',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  if (insight.recommendedFat > 0)
                    Text(
                      'Fat: ${insight.recommendedFat.toStringAsFixed(1)}g',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  Color _getConfidenceColor(int confidenceScore, ColorScheme colorScheme) {
    if (confidenceScore >= 8) return AppColors.primaryGreen;
    if (confidenceScore >= 6) return AppColors.secondaryOrange;
    if (confidenceScore >= 4) return colorScheme.primary;
    return colorScheme.error;
  }

  IconData _getConfidenceIcon(int confidenceScore) {
    if (confidenceScore >= 8) return Icons.verified;
    if (confidenceScore >= 6) return Icons.thumb_up;
    if (confidenceScore >= 4) return Icons.help_outline;
    return Icons.warning_outlined;
  }
}

class MetabolicStatusWidget extends StatelessWidget {
  final MetabolicState state;
  final Duration timeSinceLastMeal;

  const MetabolicStatusWidget({
    super.key,
    required this.state,
    required this.timeSinceLastMeal,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    
    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            _getStateColor(state.phase).withOpacity(0.1),
            _getStateColor(state.phase).withOpacity(0.05),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(AppRadius.lg),
        border: Border.all(
          color: _getStateColor(state.phase).withOpacity(0.3),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(AppSpacing.sm),
                decoration: BoxDecoration(
                  color: _getStateColor(state.phase),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  _getStateIcon(state.phase),
                  color: Colors.white,
                  size: 24,
                ),
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _getStateTitle(state.phase),
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: _getStateColor(state.phase),
                      ),
                    ),
                    Text(
                      _formatTimeSinceLastMeal(timeSinceLastMeal),
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurface.withOpacity(0.7),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          Text(
            state.phaseDescription,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            state.recommendedAction,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              fontStyle: FontStyle.italic,
              color: colorScheme.onSurface.withOpacity(0.8),
            ),
          ),
          if (state.fatBurningPotential > 0.5) ...[
            const SizedBox(height: AppSpacing.md),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.md,
                vertical: AppSpacing.sm,
              ),
              decoration: BoxDecoration(
                color: AppColors.proteinPurple.withOpacity(0.1),
                borderRadius: BorderRadius.circular(AppRadius.sm),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.local_fire_department,
                    size: 16,
                    color: AppColors.proteinPurple,
                  ),
                  const SizedBox(width: AppSpacing.xs),
                  Text(
                    'Fat burning: ${(state.fatBurningPotential * 100).round()}%',
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: AppColors.proteinPurple,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  Color _getStateColor(MetabolicPhase phase) {
    switch (phase) {
      case MetabolicPhase.fed:
        return AppColors.secondaryOrange;
      case MetabolicPhase.fasting:
        return AppColors.primaryGreen;
      case MetabolicPhase.fatBurning:
        return AppColors.proteinPurple;
      case MetabolicPhase.muscleBuilding:
        return AppColors.carbsBlue;
    }
  }

  IconData _getStateIcon(MetabolicPhase phase) {
    switch (phase) {
      case MetabolicPhase.fed:
        return Icons.restaurant;
      case MetabolicPhase.fasting:
        return Icons.hourglass_empty;
      case MetabolicPhase.fatBurning:
        return Icons.local_fire_department;
      case MetabolicPhase.muscleBuilding:
        return Icons.fitness_center;
    }
  }

  String _getStateTitle(MetabolicPhase phase) {
    switch (phase) {
      case MetabolicPhase.fed:
        return 'Fed State';
      case MetabolicPhase.fasting:
        return 'Fasting';
      case MetabolicPhase.fatBurning:
        return 'Fat Burning';
      case MetabolicPhase.muscleBuilding:
        return 'Recovery Mode';
    }
  }

  String _formatTimeSinceLastMeal(Duration duration) {
    final hours = duration.inHours;
    final minutes = duration.inMinutes % 60;
    
    if (hours > 0) {
      return 'Last meal: ${hours}h ${minutes}m ago';
    } else {
      return 'Last meal: ${minutes}m ago';
    }
  }
}