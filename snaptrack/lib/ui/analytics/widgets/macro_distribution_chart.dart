import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fl_chart/fl_chart.dart';

import '../../../data/services/analytics_service.dart';

class MacroDistributionChart extends ConsumerWidget {
  final DateTime weekStart;

  const MacroDistributionChart({
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
            Row(
              children: [
                Icon(
                  Icons.pie_chart,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: 8),
                Text(
                  'Macro Distribution',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 300,
              child: weeklyStatsAsync.when(
                data: (stats) => _buildChart(context, stats),
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (error, stack) => Center(
                  child: Text(
                    'Error loading chart: $error',
                    style: const TextStyle(color: Colors.red),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChart(BuildContext context, WeeklyStats stats) {
    if (stats.avgProtein == 0 && stats.avgCarbs == 0 && stats.avgFat == 0) {
      return const Center(
        child: Text('No macro data available for this week'),
      );
    }

    // Calculate calories from macros (protein: 4 cal/g, carbs: 4 cal/g, fat: 9 cal/g)
    final proteinCalories = stats.avgProtein * 4;
    final carbsCalories = stats.avgCarbs * 4;
    final fatCalories = stats.avgFat * 9;
    final totalMacroCalories = proteinCalories + carbsCalories + fatCalories;

    if (totalMacroCalories == 0) {
      return const Center(
        child: Text('No macro data available for this week'),
      );
    }

    final proteinPercentage = (proteinCalories / totalMacroCalories * 100);
    final carbsPercentage = (carbsCalories / totalMacroCalories * 100);
    final fatPercentage = (fatCalories / totalMacroCalories * 100);

    return Row(
      children: [
        // Pie Chart
        Expanded(
          flex: 2,
          child: PieChart(
            PieChartData(
              sectionsSpace: 2,
              centerSpaceRadius: 50,
              sections: [
                PieChartSectionData(
                  color: Colors.red,
                  value: proteinCalories,
                  title: '${proteinPercentage.toStringAsFixed(0)}%',
                  radius: 80,
                  titleStyle: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                PieChartSectionData(
                  color: Colors.green,
                  value: carbsCalories,
                  title: '${carbsPercentage.toStringAsFixed(0)}%',
                  radius: 80,
                  titleStyle: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                PieChartSectionData(
                  color: Colors.blue,
                  value: fatCalories,
                  title: '${fatPercentage.toStringAsFixed(0)}%',
                  radius: 80,
                  titleStyle: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
        
        // Legend and values
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildLegendItem(
                context,
                'Protein',
                Colors.red,
                stats.avgProtein,
                proteinCalories,
                proteinPercentage,
              ),
              const SizedBox(height: 16),
              _buildLegendItem(
                context,
                'Carbs',
                Colors.green,
                stats.avgCarbs,
                carbsCalories,
                carbsPercentage,
              ),
              const SizedBox(height: 16),
              _buildLegendItem(
                context,
                'Fat',
                Colors.blue,
                stats.avgFat,
                fatCalories,
                fatPercentage,
              ),
              const SizedBox(height: 20),
              const Divider(),
              const SizedBox(height: 8),
              Text(
                'Total: ${totalMacroCalories.toStringAsFixed(0)} kcal',
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildLegendItem(
    BuildContext context,
    String label,
    Color color,
    double grams,
    double calories,
    double percentage,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 16,
              height: 16,
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              label,
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ],
        ),
        const SizedBox(height: 4),
        Padding(
          padding: const EdgeInsets.only(left: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${grams.toStringAsFixed(0)}g',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '${calories.toStringAsFixed(0)} kcal',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}