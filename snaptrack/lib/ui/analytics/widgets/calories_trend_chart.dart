import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';

import '../../../data/services/analytics_service.dart';

class CaloriesTrendChart extends ConsumerStatefulWidget {
  final DateTime weekStart;

  const CaloriesTrendChart({
    super.key,
    required this.weekStart,
  });

  @override
  ConsumerState<CaloriesTrendChart> createState() => _CaloriesTrendChartState();
}

class _CaloriesTrendChartState extends ConsumerState<CaloriesTrendChart> {
  int? _selectedDayIndex;

  @override
  Widget build(BuildContext context) {
    final weeklyStatsAsync = ref.watch(weeklyStatsProvider(widget.weekStart));

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.trending_up,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: 8),
                Text(
                  'Calories Trend',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const Spacer(),
                if (_selectedDayIndex != null)
                  TextButton(
                    onPressed: () => setState(() => _selectedDayIndex = null),
                    child: const Text('Clear Selection'),
                  ),
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 250,
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
            // Selected day details
            weeklyStatsAsync.when(
              data: (stats) => _buildSelectedDayDetails(context, stats),
              loading: () => const SizedBox.shrink(),
              error: (_, __) => const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChart(BuildContext context, WeeklyStats stats) {
    final dailyData = stats.dailyBreakdown;
    
    if (dailyData.isEmpty) {
      return const Center(
        child: Text('No data available for this week'),
      );
    }

    final spots = dailyData.asMap().entries.map((entry) {
      final index = entry.key;
      final day = entry.value;
      return FlSpot(index.toDouble(), day.totalCalories);
    }).toList();

    final maxY = dailyData.isEmpty 
        ? 2500.0 
        : dailyData.map((d) => d.totalCalories).reduce((a, b) => a > b ? a : b) * 1.1;

    return LineChart(
      LineChartData(
        gridData: FlGridData(
          show: true,
          drawVerticalLine: false,
          horizontalInterval: maxY / 5,
          getDrawingHorizontalLine: (value) {
            return FlLine(
              color: Theme.of(context).colorScheme.outline.withOpacity(0.3),
              strokeWidth: 1,
            );
          },
        ),
        titlesData: FlTitlesData(
          show: true,
          rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 30,
              interval: 1,
              getTitlesWidget: (value, meta) {
                final index = value.toInt();
                if (index >= 0 && index < dailyData.length) {
                  final date = dailyData[index].date;
                  return SideTitleWidget(
                    axisSide: meta.axisSide,
                    child: Text(
                      DateFormat('E').format(date),
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  );
                }
                return const Text('');
              },
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              interval: maxY / 5,
              reservedSize: 50,
              getTitlesWidget: (value, meta) {
                return Text(
                  '${value.toInt()}',
                  style: Theme.of(context).textTheme.bodySmall,
                );
              },
            ),
          ),
        ),
        borderData: FlBorderData(
          show: true,
          border: Border(
            bottom: BorderSide(
              color: Theme.of(context).colorScheme.outline.withOpacity(0.5),
            ),
            left: BorderSide(
              color: Theme.of(context).colorScheme.outline.withOpacity(0.5),
            ),
          ),
        ),
        minX: 0,
        maxX: 6,
        minY: 0,
        maxY: maxY,
        lineBarsData: [
          LineChartBarData(
            spots: spots,
            isCurved: true,
            gradient: LinearGradient(
              colors: [
                Theme.of(context).colorScheme.primary,
                Theme.of(context).colorScheme.primary.withOpacity(0.7),
              ],
            ),
            barWidth: 3,
            isStrokeCapRound: true,
            dotData: FlDotData(
              show: true,
              getDotPainter: (spot, percent, barData, index) {
                return FlDotCirclePainter(
                  radius: 4,
                  color: Theme.of(context).colorScheme.primary,
                  strokeWidth: 2,
                  strokeColor: Theme.of(context).colorScheme.surface,
                );
              },
            ),
            belowBarData: BarAreaData(
              show: true,
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.primary.withOpacity(0.3),
                  Theme.of(context).colorScheme.primary.withOpacity(0.1),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        ],
        lineTouchData: LineTouchData(
          enabled: true,
          touchCallback: (FlTouchEvent event, LineTouchResponse? touchResponse) {
            if (event is FlTapUpEvent && touchResponse?.lineBarSpots?.isNotEmpty == true) {
              final spot = touchResponse!.lineBarSpots!.first;
              final index = spot.x.toInt();
              if (index >= 0 && index < dailyData.length) {
                setState(() {
                  _selectedDayIndex = _selectedDayIndex == index ? null : index;
                });
              }
            }
          },
          touchTooltipData: LineTouchTooltipData(
            getTooltipItems: (touchedSpots) {
              return touchedSpots.map((LineBarSpot touchedSpot) {
                final index = touchedSpot.x.toInt();
                if (index >= 0 && index < dailyData.length) {
                  final day = dailyData[index];
                  return LineTooltipItem(
                    '${DateFormat('MMM d').format(day.date)}\n${touchedSpot.y.toStringAsFixed(0)} kcal',
                    TextStyle(
                      color: Theme.of(context).colorScheme.onSurface,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                }
                return null;
              }).toList();
            },
          ),
        ),
      ),
    );
  }

  Widget _buildSelectedDayDetails(BuildContext context, WeeklyStats stats) {
    if (_selectedDayIndex == null || _selectedDayIndex! >= stats.dailyBreakdown.length) {
      return const SizedBox.shrink();
    }

    final selectedDay = stats.dailyBreakdown[_selectedDayIndex!];
    final totalMacros = selectedDay.totalProtein + selectedDay.totalCarbs + selectedDay.totalFat;

    return Container(
      margin: const EdgeInsets.only(top: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer.withOpacity(0.3),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.calendar_today,
                size: 20,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(width: 8),
              Text(
                DateFormat('EEEE, MMM d').format(selectedDay.date),
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  '${selectedDay.totalCalories.toStringAsFixed(0)} kcal',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          if (totalMacros > 0) ...[
            const SizedBox(height: 16),
            Text(
              'Macro Distribution',
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: _buildMacroItem(
                    context,
                    'Protein',
                    selectedDay.totalProtein,
                    selectedDay.totalProtein * 4, // 4 cal/g
                    totalMacros > 0 ? selectedDay.totalProtein / totalMacros : 0,
                    Colors.red,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildMacroItem(
                    context,
                    'Carbs',
                    selectedDay.totalCarbs,
                    selectedDay.totalCarbs * 4, // 4 cal/g
                    totalMacros > 0 ? selectedDay.totalCarbs / totalMacros : 0,
                    Colors.green,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildMacroItem(
                    context,
                    'Fat',
                    selectedDay.totalFat,
                    selectedDay.totalFat * 9, // 9 cal/g
                    totalMacros > 0 ? selectedDay.totalFat / totalMacros : 0,
                    Colors.blue,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Daily Data',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.grey[600],
                  ),
                ),
                Text(
                  '${totalMacros.toStringAsFixed(1)}g total macros',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ] else ...[
            const SizedBox(height: 12),
            Center(
              child: Text(
                'No meals logged on this day',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.grey[600],
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildMacroItem(
    BuildContext context,
    String name,
    double grams,
    double calories,
    double percentage,
    Color color,
  ) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: color,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  name,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            '${grams.toStringAsFixed(1)}g',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          Text(
            '${calories.toStringAsFixed(0)} kcal',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 4),
          LinearProgressIndicator(
            value: percentage,
            backgroundColor: color.withOpacity(0.2),
            valueColor: AlwaysStoppedAnimation<Color>(color),
            minHeight: 3,
          ),
          const SizedBox(height: 2),
          Text(
            '${(percentage * 100).toStringAsFixed(0)}%',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: color,
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }
}