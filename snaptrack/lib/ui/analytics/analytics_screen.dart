import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../data/models/food_entry.dart';
import '../../data/services/analytics_service.dart';
import '../../data/services/export_service.dart';
import '../../data/providers/metabolic_providers.dart';
import '../../data/models/metabolic_context.dart';
import '../widgets/metabolic_insights_card.dart';
import '../widgets/metabolic_timeline_widget.dart';
import 'widgets/weekly_stats_card.dart';
import 'widgets/calories_trend_chart.dart';
import 'widgets/macro_distribution_chart.dart';
import 'widgets/insights_card.dart';
import 'widgets/daily_progress_card.dart';
import 'widgets/daily_macro_summary.dart';

class AnalyticsScreen extends ConsumerStatefulWidget {
  const AnalyticsScreen({super.key});

  @override
  ConsumerState<AnalyticsScreen> createState() => _AnalyticsScreenState();
}

class _AnalyticsScreenState extends ConsumerState<AnalyticsScreen> with TickerProviderStateMixin {
  late TabController _tabController;
  DateTime _selectedWeek = DateTime.now();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  DateTime get _weekStart {
    final now = _selectedWeek;
    final daysFromMonday = now.weekday - 1;
    return DateTime(now.year, now.month, now.day).subtract(Duration(days: daysFromMonday));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Analytics'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Overview', icon: Icon(Icons.dashboard)),
            Tab(text: 'Trends', icon: Icon(Icons.trending_up)),
            Tab(text: 'Insights', icon: Icon(Icons.lightbulb)),
            Tab(text: 'Metabolic', icon: Icon(Icons.timeline)),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.date_range),
            onPressed: _selectWeek,
            tooltip: 'Select Week',
          ),
          PopupMenuButton<String>(
            onSelected: (value) {
              switch (value) {
                case 'export':
                  _showExportDialog();
                  break;
                case 'goals':
                  _showGoalsDialog();
                  break;
              }
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'export',
                child: Row(
                  children: [
                    Icon(Icons.download),
                    SizedBox(width: 8),
                    Text('Export Data'),
                  ],
                ),
              ),
              const PopupMenuItem(
                value: 'goals',
                child: Row(
                  children: [
                    Icon(Icons.flag),
                    SizedBox(width: 8),
                    Text('Set Goals'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildOverviewTab(),
          _buildTrendsTab(),
          _buildInsightsTab(),
          _buildMetabolicTab(),
        ],
      ),
    );
  }

  Widget _buildOverviewTab() {
    return RefreshIndicator(
      onRefresh: () async {
        ref.invalidate(weeklyStatsProvider(_weekStart));
        ref.invalidate(dailyProgressProvider(null));
      },
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Week selector
            _buildWeekSelector(),
            const SizedBox(height: 16),
            
            // Daily progress for today
            const DailyProgressCard(),
            const SizedBox(height: 16),
            
            // Daily macro distribution
            const DailyMacroSummary(),
            const SizedBox(height: 16),
            
            // Weekly stats
            WeeklyStatsCard(weekStart: _weekStart),
            const SizedBox(height: 16),
            
            // Quick insights
            const InsightsCard(maxInsights: 3),
          ],
        ),
      ),
    );
  }

  Widget _buildTrendsTab() {
    return RefreshIndicator(
      onRefresh: () async {
        ref.invalidate(weeklyStatsProvider(_weekStart));
      },
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Week selector
            _buildWeekSelector(),
            const SizedBox(height: 16),
            
            // Calories trend chart
            CaloriesTrendChart(weekStart: _weekStart),
            const SizedBox(height: 16),
            
            // Macro distribution
            MacroDistributionChart(weekStart: _weekStart),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildInsightsTab() {
    return RefreshIndicator(
      onRefresh: () async {
        ref.invalidate(insightsProvider);
      },
      child: const SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            InsightsCard(maxInsights: null), // Show all insights
          ],
        ),
      ),
    );
  }

  Widget _buildWeekSelector() {
    final weekFormat = DateFormat('MMM d');
    final weekStart = _weekStart;
    final weekEnd = weekStart.add(const Duration(days: 6));

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  _selectedWeek = _selectedWeek.subtract(const Duration(days: 7));
                });
              },
              icon: const Icon(Icons.chevron_left),
            ),
            Expanded(
              child: Text(
                '${weekFormat.format(weekStart)} - ${weekFormat.format(weekEnd)}',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            IconButton(
              onPressed: _selectedWeek.isBefore(DateTime.now().subtract(const Duration(days: 6)))
                  ? () {
                      setState(() {
                        _selectedWeek = _selectedWeek.add(const Duration(days: 7));
                      });
                    }
                  : null,
              icon: const Icon(Icons.chevron_right),
            ),
          ],
        ),
      ),
    );
  }

  void _selectWeek() async {
    final selected = await showDatePicker(
      context: context,
      initialDate: _selectedWeek,
      firstDate: DateTime.now().subtract(const Duration(days: 365)),
      lastDate: DateTime.now(),
      helpText: 'Select any day in the week',
    );

    if (selected != null) {
      setState(() {
        _selectedWeek = selected;
      });
    }
  }

  void _showExportDialog() {
    showDialog(
      context: context,
      builder: (context) => _ExportDialog(weekStart: _weekStart),
    );
  }

  void _showGoalsDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Set Goals'),
        content: const Text('Goal setting functionality will be available soon!'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  Widget _buildMetabolicTab() {
    return RefreshIndicator(
      onRefresh: () async {
        // Invalidate metabolic providers to refresh data
        ref.invalidate(metabolicInsightProvider('current_user'));
        ref.invalidate(currentMetabolicStateProvider('current_user'));
      },
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Section header
            Text(
              'Metabolic Analysis',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Track your metabolic state and timing patterns',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 24),

            // Current Metabolic State
            Consumer(
              builder: (context, ref, child) {
                final stateAsync = ref.watch(currentMetabolicStateProvider('current_user'));
                
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.timeline,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'Current Metabolic State',
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        stateAsync.when(
                          data: (state) => MetabolicStatusWidget(
                            state: state,
                            timeSinceLastMeal: state.timeSinceLastMeal,
                          ),
                          loading: () => const Center(
                            child: Padding(
                              padding: EdgeInsets.all(32),
                              child: CircularProgressIndicator(),
                            ),
                          ),
                          error: (error, stack) => Center(
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.error_outline,
                                    color: Theme.of(context).colorScheme.error,
                                    size: 48,
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    'Unable to load metabolic state',
                                    style: Theme.of(context).textTheme.bodyMedium,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 16),

            // Metabolic Insights
            Consumer(
              builder: (context, ref, child) {
                final insightAsync = ref.watch(metabolicInsightProvider('current_user'));
                
                return insightAsync.when(
                  data: (insight) => MetabolicInsightsCard(
                    insight: insight,
                    onTap: () {
                      // Could navigate to detailed metabolic dashboard
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Detailed metabolic dashboard coming soon!'),
                        ),
                      );
                    },
                  ),
                  loading: () => Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          const CircularProgressIndicator(),
                          const SizedBox(height: 16),
                          Text(
                            'Analyzing metabolic patterns...',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ),
                  ),
                  error: (error, stack) => Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Icon(
                            Icons.warning_outlined,
                            color: Theme.of(context).colorScheme.error,
                            size: 48,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Metabolic insights temporarily unavailable',
                            style: Theme.of(context).textTheme.bodyMedium,
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Using fallback analysis',
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Theme.of(context).colorScheme.onSurfaceVariant,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 16),

            // Metabolic Timeline
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.schedule,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Today\'s Timeline',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Consumer(
                      builder: (context, ref, child) {
                        final stateAsync = ref.watch(currentMetabolicStateProvider('current_user'));
                        
                        return SizedBox(
                          height: 120,
                          child: stateAsync.when(
                            data: (state) => MetabolicTimelineWidget(
                              currentState: state,
                              recentMeals: [], // Would load from provider in real implementation
                              timeRange: const Duration(hours: 12),
                            ),
                            loading: () => const Center(child: CircularProgressIndicator()),
                            error: (error, stack) => Center(
                              child: Text(
                                'Timeline unavailable',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Timeline shows your metabolic phases throughout the day',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Getting Started Card (if no data)
            Card(
              color: Theme.of(context).colorScheme.primaryContainer,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.tips_and_updates,
                          color: Theme.of(context).colorScheme.onPrimaryContainer,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Getting Started',
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: Theme.of(context).colorScheme.onPrimaryContainer,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Log your meals to see detailed metabolic analysis including:\n'
                      '• Current metabolic phase (fed/fasting/fat-burning)\n'
                      '• Optimal meal timing recommendations\n'
                      '• Intermittent fasting pattern detection\n'
                      '• Personalized metabolic insights',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}

class _ExportDialog extends ConsumerStatefulWidget {
  final DateTime weekStart;

  const _ExportDialog({required this.weekStart});

  @override
  ConsumerState<_ExportDialog> createState() => _ExportDialogState();
}

class _ExportDialogState extends ConsumerState<_ExportDialog> {
  DateTime? _startDate;
  DateTime? _endDate;
  String _selectedFormat = 'CSV';
  bool _includeImages = false;
  bool _includeNutritionBreakdown = true;
  Set<MealType> _selectedMealTypes = {};
  bool _isExporting = false;

  @override
  void initState() {
    super.initState();
    // Default to current week
    _startDate = widget.weekStart;
    _endDate = widget.weekStart.add(const Duration(days: 6));
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Export Data'),
      content: SizedBox(
        width: double.maxFinite,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Date Range Selection
              const Text('Date Range', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => _selectDate(true),
                      child: Text(_startDate != null
                          ? DateFormat('MMM d, yyyy').format(_startDate!)
                          : 'Start Date'),
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Text('to'),
                  const SizedBox(width: 8),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => _selectDate(false),
                      child: Text(_endDate != null
                          ? DateFormat('MMM d, yyyy').format(_endDate!)
                          : 'End Date'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Format Selection
              const Text('Export Format', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              DropdownButtonFormField<String>(
                value: _selectedFormat,
                onChanged: (value) => setState(() => _selectedFormat = value!),
                items: const [
                  DropdownMenuItem(value: 'CSV', child: Text('CSV (Spreadsheet)')),
                  DropdownMenuItem(value: 'JSON', child: Text('JSON (Data)')),
                  DropdownMenuItem(value: 'Summary', child: Text('Summary Report')),
                ],
              ),
              const SizedBox(height: 16),

              // Meal Type Filter
              const Text('Meal Types', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                children: MealType.values.map((mealType) {
                  return FilterChip(
                    label: Text(mealType.name),
                    selected: _selectedMealTypes.contains(mealType),
                    onSelected: (selected) {
                      setState(() {
                        if (selected) {
                          _selectedMealTypes.add(mealType);
                        } else {
                          _selectedMealTypes.remove(mealType);
                        }
                      });
                    },
                  );
                }).toList(),
              ),
              if (_selectedMealTypes.isEmpty)
                const Padding(
                  padding: EdgeInsets.only(top: 4),
                  child: Text(
                    'All meal types will be included',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ),
              const SizedBox(height: 16),

              // Options
              const Text('Options', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              CheckboxListTile(
                title: const Text('Include nutrition breakdown'),
                subtitle: const Text('Detailed nutritional information per food item'),
                value: _includeNutritionBreakdown,
                onChanged: (value) => setState(() => _includeNutritionBreakdown = value!),
                controlAffinity: ListTileControlAffinity.leading,
                contentPadding: EdgeInsets.zero,
              ),
              CheckboxListTile(
                title: const Text('Include images'),
                subtitle: const Text('Image data (increases file size)'),
                value: _includeImages,
                onChanged: (value) => setState(() => _includeImages = value!),
                controlAffinity: ListTileControlAffinity.leading,
                contentPadding: EdgeInsets.zero,
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: _isExporting ? null : () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        FilledButton(
          onPressed: _isExporting || _startDate == null || _endDate == null
              ? null
              : _performExport,
          child: _isExporting
              ? const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : const Text('Export'),
        ),
      ],
    );
  }

  Future<void> _selectDate(bool isStartDate) async {
    final initialDate = isStartDate 
        ? (_startDate ?? DateTime.now()) 
        : (_endDate ?? DateTime.now());
    
    final selected = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime.now().subtract(const Duration(days: 365)),
      lastDate: DateTime.now(),
      helpText: 'Select ${isStartDate ? 'start' : 'end'} date',
    );

    if (selected != null) {
      setState(() {
        if (isStartDate) {
          _startDate = selected;
          // Ensure end date is not before start date
          if (_endDate != null && _endDate!.isBefore(selected)) {
            _endDate = selected;
          }
        } else {
          _endDate = selected;
          // Ensure start date is not after end date
          if (_startDate != null && _startDate!.isAfter(selected)) {
            _startDate = selected;
          }
        }
      });
    }
  }

  Future<void> _performExport() async {
    if (_startDate == null || _endDate == null) return;

    setState(() => _isExporting = true);

    try {
      final exportService = ref.read(exportServiceProvider);
      final dateRange = DateRange(start: _startDate!, end: _endDate!);
      final options = ExportOptions(
        includeImages: _includeImages,
        mealTypes: _selectedMealTypes.isEmpty ? null : _selectedMealTypes.toList(),
        includeNutritionBreakdown: _includeNutritionBreakdown,
      );

      File exportFile;
      switch (_selectedFormat) {
        case 'CSV':
          exportFile = await exportService.exportToCSV(dateRange, options: options);
          break;
        case 'JSON':
          exportFile = await exportService.exportToJSON(dateRange, options: options);
          break;
        case 'Summary':
          exportFile = await exportService.generateSummaryReport(dateRange);
          break;
        default:
          throw Exception('Unknown export format: $_selectedFormat');
      }

      // Close dialog
      if (mounted) {
        Navigator.of(context).pop();
      }

      // Show share options
      await _showShareOptions(exportFile);

    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Export failed: ${e.toString()}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isExporting = false);
      }
    }
  }

  Future<void> _showShareOptions(File exportFile) async {
    if (!mounted) return;

    final result = await showDialog<ShareMethod>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Share Export'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Export saved: ${exportFile.path.split('/').last}'),
            const SizedBox(height: 16),
            const Text('How would you like to share it?'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(ShareMethod.saveToFiles),
            child: const Text('Keep in Files'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(ShareMethod.email),
            child: const Text('Email'),
          ),
          FilledButton(
            onPressed: () => Navigator.of(context).pop(ShareMethod.share),
            child: const Text('Share'),
          ),
        ],
      ),
    );

    if (result != null) {
      try {
        final exportService = ref.read(exportServiceProvider);
        await exportService.shareExport(exportFile, result);
        
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(result == ShareMethod.saveToFiles 
                  ? 'Export saved to Files app'
                  : 'Export shared successfully'),
              backgroundColor: Colors.green,
            ),
          );
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Share failed: ${e.toString()}'),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    }
  }
}