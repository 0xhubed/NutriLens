import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../generated/l10n/app_localizations.dart';
import '../../../data/services/analytics_service.dart';

class WeeklyStatsCard extends ConsumerWidget {
  final DateTime weekStart;

  const WeeklyStatsCard({
    super.key,
    required this.weekStart,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weeklyStatsAsync = ref.watch(weeklyStatsProvider(weekStart));

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context)!.weeklySummary,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            weeklyStatsAsync.when(
              data: (stats) => _buildStatsContent(context, stats),
              loading: () => const Center(
                child: Padding(
                  padding: EdgeInsets.all(24),
                  child: CircularProgressIndicator(),
                ),
              ),
              error: (error, stack) => Center(
                child: Text(
                  '${AppLocalizations.of(context)!.errorLoadingData}: $error',
                  style: const TextStyle(color: Colors.red),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatsContent(BuildContext context, WeeklyStats stats) {
    return Column(
      children: [
        // Main metrics
        Row(
          children: [
            Expanded(
              child: _buildStatItem(
                context,
                AppLocalizations.of(context)!.averageCalories,
                '${stats.avgCalories.toStringAsFixed(0)}',
                'kcal',
                Icons.local_fire_department,
                Colors.orange,
              ),
            ),
            Expanded(
              child: _buildStatItem(
                context,
                AppLocalizations.of(context)!.daysLogged,
                '${stats.daysLogged}',
                '/ 7',
                Icons.calendar_today,
                Colors.blue,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        
        // Macro breakdown
        Row(
          children: [
            Expanded(
              child: _buildMacroItem(
                context,
                AppLocalizations.of(context)!.protein,
                stats.avgProtein,
                'g',
                Colors.red,
              ),
            ),
            Expanded(
              child: _buildMacroItem(
                context,
                AppLocalizations.of(context)!.carbs,
                stats.avgCarbs,
                'g',
                Colors.green,
              ),
            ),
            Expanded(
              child: _buildMacroItem(
                context,
                AppLocalizations.of(context)!.fat,
                stats.avgFat,
                'g',
                Colors.blue,
              ),
            ),
          ],
        ),
        
        if (stats.topFoods.isNotEmpty) ...[
          const SizedBox(height: 16),
          const Divider(),
          const SizedBox(height: 8),
          Text(
            AppLocalizations.of(context)!.topFoods,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          ...stats.topFoods.entries.take(3).map(
            (entry) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      entry.key,
                      style: Theme.of(context).textTheme.bodyMedium,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      '${entry.value}x',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildStatItem(
    BuildContext context,
    String label,
    String value,
    String unit,
    IconData icon,
    Color color,
  ) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 24),
          const SizedBox(height: 4),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: value,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
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
          Text(
            label,
            style: Theme.of(context).textTheme.bodySmall,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildMacroItem(
    BuildContext context,
    String label,
    double value,
    String unit,
    Color color,
  ) {
    return Column(
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall,
        ),
        const SizedBox(height: 4),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: value.toStringAsFixed(0),
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
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
      ],
    );
  }
}