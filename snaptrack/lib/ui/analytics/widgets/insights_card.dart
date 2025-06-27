import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/services/analytics_service.dart';

class InsightsCard extends ConsumerWidget {
  final int? maxInsights;

  const InsightsCard({
    super.key,
    this.maxInsights,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final insightsAsync = ref.watch(insightsProvider);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.lightbulb,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: 8),
                Text(
                  'Insights',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
            const SizedBox(height: 16),
            insightsAsync.when(
              data: (insights) => _buildInsightsList(context, insights),
              loading: () => const Center(
                child: Padding(
                  padding: EdgeInsets.all(24),
                  child: CircularProgressIndicator(),
                ),
              ),
              error: (error, stack) => Center(
                child: Text(
                  'Error loading insights: $error',
                  style: const TextStyle(color: Colors.red),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInsightsList(BuildContext context, List<Insight> insights) {
    if (insights.isEmpty) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Text('No insights available yet. Keep logging meals!'),
        ),
      );
    }

    final displayInsights = maxInsights != null
        ? insights.take(maxInsights!).toList()
        : insights;

    return Column(
      children: displayInsights.map((insight) => _buildInsightItem(context, insight)).toList(),
    );
  }

  Widget _buildInsightItem(BuildContext context, Insight insight) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: _getInsightColor(insight.type).withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Icon(
              _getInsightIcon(insight.type),
              color: _getInsightColor(insight.type),
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  insight.title,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  insight.description,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                if (insight.actionSuggestion != null) ...[
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surfaceVariant,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.tips_and_updates,
                          size: 16,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            insight.actionSuggestion!,
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Theme.of(context).colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
                if (insight.value != null && insight.type == InsightType.consistency) ...[
                  const SizedBox(height: 8),
                  LinearProgressIndicator(
                    value: insight.value!,
                    backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      _getInsightColor(insight.type),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  IconData _getInsightIcon(InsightType type) {
    switch (type) {
      case InsightType.consistency:
        return Icons.calendar_today;
      case InsightType.macroBalance:
        return Icons.balance;
      case InsightType.caloriesTrend:
        return Icons.trending_up;
      case InsightType.mealPattern:
        return Icons.schedule;
      case InsightType.achievement:
        return Icons.emoji_events;
      case InsightType.suggestion:
        return Icons.lightbulb_outline;
    }
  }

  Color _getInsightColor(InsightType type) {
    switch (type) {
      case InsightType.consistency:
        return Colors.blue;
      case InsightType.macroBalance:
        return Colors.green;
      case InsightType.caloriesTrend:
        return Colors.orange;
      case InsightType.mealPattern:
        return Colors.purple;
      case InsightType.achievement:
        return Colors.amber;
      case InsightType.suggestion:
        return Colors.teal;
    }
  }
}