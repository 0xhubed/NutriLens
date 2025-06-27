import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';

import '../../../data/services/analytics_service.dart';

class DailyMacroSummary extends ConsumerWidget {
  final DateTime? date;

  const DailyMacroSummary({
    super.key,
    this.date,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final targetDate = date ?? DateTime.now();
    // Pass the same date parameter as provided to the widget
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
                  Icons.pie_chart,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: 8),
                Text(
                  'Daily Macro Distribution',
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
              data: (progress) => _buildMacroContent(context, progress),
              loading: () => const Center(
                child: Padding(
                  padding: EdgeInsets.all(24),
                  child: CircularProgressIndicator(),
                ),
              ),
              error: (error, stack) => Center(
                child: Text(
                  'Error loading macro data: $error',
                  style: const TextStyle(color: Colors.red),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMacroContent(BuildContext context, DailyProgress progress) {
    final totalMacros = progress.proteinActual + progress.carbsActual + progress.fatActual;
    
    if (totalMacros == 0) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Text(
            'No meals logged today',
            style: TextStyle(color: Colors.grey),
          ),
        ),
      );
    }

    // Calculate percentages
    final proteinPercent = progress.proteinActual / totalMacros;
    final carbsPercent = progress.carbsActual / totalMacros;
    final fatPercent = progress.fatActual / totalMacros;

    // Calculate calories from macros (protein: 4 cal/g, carbs: 4 cal/g, fat: 9 cal/g)
    final proteinCalories = progress.proteinActual * 4;
    final carbsCalories = progress.carbsActual * 4;
    final fatCalories = progress.fatActual * 9;

    return Row(
      children: [
        // Pie Chart
        Expanded(
          flex: 2,
          child: SizedBox(
            height: 160,
            child: PieChart(
              PieChartData(
                sections: [
                  PieChartSectionData(
                    color: Colors.red,
                    value: progress.proteinActual,
                    title: '${(proteinPercent * 100).toStringAsFixed(0)}%',
                    radius: 50,
                    titleStyle: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  PieChartSectionData(
                    color: Colors.green,
                    value: progress.carbsActual,
                    title: '${(carbsPercent * 100).toStringAsFixed(0)}%',
                    radius: 50,
                    titleStyle: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  PieChartSectionData(
                    color: Colors.blue,
                    value: progress.fatActual,
                    title: '${(fatPercent * 100).toStringAsFixed(0)}%',
                    radius: 50,
                    titleStyle: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
                sectionsSpace: 2,
                centerSpaceRadius: 30,
              ),
            ),
          ),
        ),
        const SizedBox(width: 20),
        
        // Legend and Details
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildMacroItem(
                'Protein',
                progress.proteinActual,
                proteinCalories,
                Colors.red,
                proteinPercent,
              ),
              const SizedBox(height: 12),
              _buildMacroItem(
                'Carbs',
                progress.carbsActual,
                carbsCalories,
                Colors.green,
                carbsPercent,
              ),
              const SizedBox(height: 12),
              _buildMacroItem(
                'Fat',
                progress.fatActual,
                fatCalories,
                Colors.blue,
                fatPercent,
              ),
              const SizedBox(height: 16),
              const Divider(),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Total:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '${totalMacros.toStringAsFixed(1)}g',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Calories:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '${progress.caloriesActual.toStringAsFixed(0)} kcal',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMacroItem(
    String name,
    double grams,
    double calories,
    Color color,
    double percentage,
  ) {
    return Row(
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    name,
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                  Text(
                    '${grams.toStringAsFixed(1)}g',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: color,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${(percentage * 100).toStringAsFixed(0)}% of macros',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),
                  ),
                  Text(
                    '${calories.toStringAsFixed(0)} kcal',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}