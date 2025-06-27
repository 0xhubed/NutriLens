import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../data/services/analytics_service.dart';

class DailyProgressCard extends ConsumerWidget {
  final DateTime? date;

  const DailyProgressCard({
    super.key,
    this.date,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final targetDate = date ?? DateTime.now();
    // Pass null instead of targetDate to match the provider parameter
    final progressAsync = ref.watch(dailyProgressProvider(date));

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.today,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: 8),
                Text(
                  'Today\'s Progress',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const Spacer(),
                Text(
                  DateFormat('MMM d').format(targetDate),
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            progressAsync.when(
              data: (progress) => _buildProgressContent(context, progress),
              loading: () => const Center(
                child: Padding(
                  padding: EdgeInsets.all(24),
                  child: CircularProgressIndicator(),
                ),
              ),
              error: (error, stack) => Center(
                child: Text(
                  'Error loading progress: $error',
                  style: const TextStyle(color: Colors.red),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProgressContent(BuildContext context, DailyProgress progress) {
    return Column(
      children: [
        // Calories progress
        _buildProgressItem(
          context,
          'Calories',
          progress.caloriesActual,
          progress.caloriesGoal,
          'kcal',
          progress.caloriesProgress,
          Colors.orange,
        ),
        const SizedBox(height: 16),
        
        // Macros progress
        Row(
          children: [
            Expanded(
              child: _buildMacroProgress(
                context,
                'Protein',
                progress.proteinActual,
                progress.proteinGoal,
                'g',
                progress.proteinProgress,
                Colors.red,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildMacroProgress(
                context,
                'Carbs',
                progress.carbsActual,
                progress.carbsGoal,
                'g',
                progress.carbsProgress,
                Colors.green,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildMacroProgress(
                context,
                'Fat',
                progress.fatActual,
                progress.fatGoal,
                'g',
                progress.fatProgress,
                Colors.blue,
              ),
            ),
          ],
        ),
        
        if (progress.mealsLogged > 0) ...[
          const SizedBox(height: 16),
          const Divider(),
          const SizedBox(height: 8),
          Row(
            children: [
              Icon(
                Icons.restaurant,
                size: 16,
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
              const SizedBox(width: 8),
              Text(
                '${progress.mealsLogged} meals logged today',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ],
      ],
    );
  }

  Widget _buildProgressItem(
    BuildContext context,
    String label,
    double actual,
    double goal,
    String unit,
    double progress,
    Color color,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: actual.toStringAsFixed(0),
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: color,
                    ),
                  ),
                  TextSpan(
                    text: ' / ${goal.toStringAsFixed(0)} $unit',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: LinearProgressIndicator(
                value: progress,
                backgroundColor: color.withOpacity(0.2),
                valueColor: AlwaysStoppedAnimation<Color>(color),
                minHeight: 8,
              ),
            ),
            const SizedBox(width: 12),
            Text(
              '${(progress * 100).toStringAsFixed(0)}%',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildMacroProgress(
    BuildContext context,
    String label,
    double actual,
    double goal,
    String unit,
    double progress,
    Color color,
  ) {
    return Column(
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(height: 4),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: actual.toStringAsFixed(0),
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
              TextSpan(
                text: unit,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: color,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 4),
        LinearProgressIndicator(
          value: progress,
          backgroundColor: color.withOpacity(0.2),
          valueColor: AlwaysStoppedAnimation<Color>(color),
          minHeight: 4,
        ),
        const SizedBox(height: 4),
        Text(
          '${(progress * 100).toStringAsFixed(0)}%',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: color,
          ),
        ),
      ],
    );
  }
}