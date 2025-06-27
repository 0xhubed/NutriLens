import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/user_metrics.dart';
import '../services/goal_service.dart';
import 'activity_providers.dart';

// Current user goal provider (could be stored in UserMetrics in the future)
final currentGoalProvider = StateProvider<HealthGoal?>((ref) => null);

// Goal service provider
final goalServiceProvider = Provider<GoalService>((ref) {
  return GoalService();
});

// Current goal progress provider
final goalProgressProvider = FutureProvider<GoalProgress?>((ref) async {
  final goal = ref.watch(currentGoalProvider);
  if (goal == null) return null;

  final goalService = ref.watch(goalServiceProvider);
  final balance = await ref.watch(dailyCalorieBalanceProvider.future);
  
  return goalService.calculateProgress(
    goal: goal,
    currentBalance: balance,
  );
});

// Goal suggestions provider
final goalSuggestionsProvider = FutureProvider<List<String>>((ref) async {
  final progress = await ref.watch(goalProgressProvider.future);
  if (progress == null) return <String>[];

  final goalService = ref.watch(goalServiceProvider);
  final balance = progress.currentBalance;
  
  return goalService.generateSuggestions(
    progress: progress,
    activityCalories: balance.activityBurn,
    foodCalories: balance.foodIntake,
  );
});

// Quick goal presets provider
final goalPresetsProvider = Provider<List<GoalPreset>>((ref) {
  return [
    GoalPreset(
      name: 'Lose Weight',
      description: 'Lose 1-2 lbs per week',
      icon: '📉',
      type: GoalType.weightLoss,
      color: 0xFF2196F3, // Blue
    ),
    GoalPreset(
      name: 'Gain Weight',
      description: 'Gain 0.5-1 lb per week',
      icon: '📈',
      type: GoalType.weightGain,
      color: 0xFF4CAF50, // Green
    ),
    GoalPreset(
      name: 'Maintain Weight',
      description: 'Stay within current range',
      icon: '⚖️',
      type: GoalType.maintenance,
      color: 0xFFFF9800, // Orange
    ),
    GoalPreset(
      name: 'Build Muscle',
      description: 'Focus on strength and protein',
      icon: '💪',
      type: GoalType.performance,
      color: 0xFF9C27B0, // Purple
    ),
    GoalPreset(
      name: 'Improve Fitness',
      description: 'Increase activity levels',
      icon: '🏃',
      type: GoalType.performance,
      color: 0xFFF44336, // Red
    ),
    GoalPreset(
      name: 'Custom Goal',
      description: 'Set your own target',
      icon: '🎯',
      type: GoalType.custom,
      color: 0xFF607D8B, // Blue Grey
    ),
  ];
});

// Demo goal provider for testing
final demoGoalProvider = StateProvider<HealthGoal?>((ref) {
  // Create a demo weight loss goal
  return HealthGoal.create(
    name: 'Lose 10 lbs',
    targetValue: 150.0, // Target weight
    unit: 'lbs',
    targetDate: DateTime.now().add(const Duration(days: 70)), // 10 weeks
    description: 'Lose 10 lbs in 10 weeks with a 500 calorie daily deficit',
    type: GoalType.weightLoss,
  );
});

class GoalPreset {
  final String name;
  final String description;
  final String icon;
  final GoalType type;
  final int color;

  GoalPreset({
    required this.name,
    required this.description,
    required this.icon,
    required this.type,
    required this.color,
  });
}