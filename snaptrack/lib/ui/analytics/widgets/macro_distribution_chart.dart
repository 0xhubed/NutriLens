import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fl_chart/fl_chart.dart';

import '../../../data/services/analytics_service.dart';
import '../../../data/models/macro_profile.dart';
import '../../../core/theme/app_theme.dart';

class MacroDistributionChart extends ConsumerStatefulWidget {
  final DateTime weekStart;

  const MacroDistributionChart({
    super.key,
    required this.weekStart,
  });

  @override
  ConsumerState<MacroDistributionChart> createState() => _MacroDistributionChartState();
}

class _MacroDistributionChartState extends ConsumerState<MacroDistributionChart> {
  MacroProfile? _selectedProfile;
  bool _showComparison = false;

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
                  Icons.pie_chart,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: 8),
                Text(
                  'Macro Distribution',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const Spacer(),
                _buildComparisonToggle(),
              ],
            ),
            if (_showComparison) ...[
              const SizedBox(height: 12),
              _buildProfileSelector(),
            ],
            const SizedBox(height: 16),
            SizedBox(
              height: _showComparison ? 350 : 300,
              child: weeklyStatsAsync.when(
                data: (stats) => _showComparison && _selectedProfile != null
                    ? _buildComparisonChart(context, stats, _selectedProfile!)
                    : _buildChart(context, stats),
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
                  color: AppColors.proteinPurple,
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
                  color: AppColors.carbsBlue,
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
                  color: AppColors.fatsYellow,
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
                AppColors.proteinPurple,
                stats.avgProtein,
                proteinCalories,
                proteinPercentage,
              ),
              const SizedBox(height: 16),
              _buildLegendItem(
                context,
                'Carbs',
                AppColors.carbsBlue,
                stats.avgCarbs,
                carbsCalories,
                carbsPercentage,
              ),
              const SizedBox(height: 16),
              _buildLegendItem(
                context,
                'Fat',
                AppColors.fatsYellow,
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

  Widget _buildComparisonToggle() {
    return Row(
      children: [
        Switch.adaptive(
          value: _showComparison,
          onChanged: (value) {
            setState(() {
              _showComparison = value;
              if (value && _selectedProfile == null) {
                _selectedProfile = MacroProfile.standardProfiles.first;
              }
            });
          },
        ),
        const SizedBox(width: 8),
        Text(
          'Compare',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }

  Widget _buildProfileSelector() {
    return Row(
      children: [
        Text(
          'Profile: ',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        Expanded(
          child: DropdownButton<MacroProfile>(
            value: _selectedProfile,
            isExpanded: true,
            items: MacroProfile.standardProfiles.map((profile) {
              return DropdownMenuItem(
                value: profile,
                child: Text(profile.name),
              );
            }).toList(),
            onChanged: (profile) {
              setState(() {
                _selectedProfile = profile;
              });
            },
          ),
        ),
      ],
    );
  }

  Widget _buildComparisonChart(BuildContext context, WeeklyStats stats, MacroProfile profile) {
    if (stats.avgProtein == 0 && stats.avgCarbs == 0 && stats.avgFat == 0) {
      return const Center(
        child: Text('No macro data available for this week'),
      );
    }

    // User's actual macros
    final proteinCalories = stats.avgProtein * 4;
    final carbsCalories = stats.avgCarbs * 4;
    final fatCalories = stats.avgFat * 9;
    final totalMacroCalories = proteinCalories + carbsCalories + fatCalories;

    if (totalMacroCalories == 0) {
      return const Center(
        child: Text('No macro data available for this week'),
      );
    }

    final userProteinPercentage = (proteinCalories / totalMacroCalories * 100);
    final userCarbsPercentage = (carbsCalories / totalMacroCalories * 100);
    final userFatPercentage = (fatCalories / totalMacroCalories * 100);

    return Column(
      children: [
        // Comparison charts side by side
        Expanded(
          child: Row(
            children: [
              // User's actual distribution
              Expanded(
                child: Column(
                  children: [
                    Text(
                      'Your Average',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 8),
                    Expanded(
                      child: PieChart(
                        PieChartData(
                          sectionsSpace: 2,
                          centerSpaceRadius: 30,
                          sections: [
                            PieChartSectionData(
                              color: AppColors.proteinPurple,
                              value: proteinCalories,
                              title: '${userProteinPercentage.toStringAsFixed(0)}%',
                              radius: 50,
                              titleStyle: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            PieChartSectionData(
                              color: AppColors.carbsBlue,
                              value: carbsCalories,
                              title: '${userCarbsPercentage.toStringAsFixed(0)}%',
                              radius: 50,
                              titleStyle: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            PieChartSectionData(
                              color: AppColors.fatsYellow,
                              value: fatCalories,
                              title: '${userFatPercentage.toStringAsFixed(0)}%',
                              radius: 50,
                              titleStyle: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              
              // Optimal distribution
              Expanded(
                child: Column(
                  children: [
                    Text(
                      'Optimal (${profile.name})',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 8),
                    Expanded(
                      child: PieChart(
                        PieChartData(
                          sectionsSpace: 2,
                          centerSpaceRadius: 30,
                          sections: [
                            PieChartSectionData(
                              color: AppColors.proteinPurple.withOpacity(0.7),
                              value: profile.proteinPercentage,
                              title: '${profile.proteinPercentage.toStringAsFixed(0)}%',
                              radius: 50,
                              titleStyle: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            PieChartSectionData(
                              color: AppColors.carbsBlue.withOpacity(0.7),
                              value: profile.carbsPercentage,
                              title: '${profile.carbsPercentage.toStringAsFixed(0)}%',
                              radius: 50,
                              titleStyle: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            PieChartSectionData(
                              color: AppColors.fatsYellow.withOpacity(0.7),
                              value: profile.fatPercentage,
                              title: '${profile.fatPercentage.toStringAsFixed(0)}%',
                              radius: 50,
                              titleStyle: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        
        // Comparison details
        const SizedBox(height: 16),
        _buildComparisonDetails(context, userProteinPercentage, userCarbsPercentage, userFatPercentage, profile),
      ],
    );
  }

  Widget _buildComparisonDetails(
    BuildContext context,
    double userProtein,
    double userCarbs,
    double userFat,
    MacroProfile profile,
  ) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceVariant.withOpacity(0.3),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Comparison vs ${profile.name}',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: _buildComparisonItem(
                  context,
                  'Protein',
                  AppColors.proteinPurple,
                  userProtein,
                  profile.proteinPercentage,
                ),
              ),
              Expanded(
                child: _buildComparisonItem(
                  context,
                  'Carbs',
                  AppColors.carbsBlue,
                  userCarbs,
                  profile.carbsPercentage,
                ),
              ),
              Expanded(
                child: _buildComparisonItem(
                  context,
                  'Fat',
                  AppColors.fatsYellow,
                  userFat,
                  profile.fatPercentage,
                ),
              ),
            ],
          ),
          if (profile.note != null) ...[
            const SizedBox(height: 8),
            Text(
              profile.note!,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildComparisonItem(
    BuildContext context,
    String label,
    Color color,
    double userValue,
    double optimalValue,
  ) {
    final difference = userValue - optimalValue;
    final isClose = difference.abs() <= 3; // Within 3% is considered close

    return Column(
      children: [
        Row(
          children: [
            Container(
              width: 12,
              height: 12,
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 4),
            Text(
              label,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          '${userValue.toStringAsFixed(0)}% vs ${optimalValue.toStringAsFixed(0)}%',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          difference > 0 ? '+${difference.toStringAsFixed(0)}%' : '${difference.toStringAsFixed(0)}%',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: isClose 
                ? AppColors.success 
                : difference.abs() > 10 
                    ? AppColors.warning 
                    : Theme.of(context).colorScheme.onSurfaceVariant,
            fontWeight: FontWeight.bold,
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