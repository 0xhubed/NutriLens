import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/user_metrics.dart';
import '../providers/activity_providers.dart';

final goalServiceProvider = Provider<GoalService>((ref) {
  return GoalService();
});

class GoalService {
  // Default goals based on common recommendations
  static const double defaultCalorieDeficit = 500.0; // For 1 lb/week weight loss
  static const double defaultCalorieSurplus = 300.0; // For gradual weight gain
  static const double defaultMaintenanceRange = 100.0; // ±100 calories for maintenance

  HealthGoal createWeightLossGoal({
    required double currentWeight,
    required double targetWeight,
    required DateTime targetDate,
    double? weeklyRate, // lbs per week
  }) {
    final rate = weeklyRate ?? 1.0; // Default 1 lb/week
    final deficitPerDay = rate * 500; // 500 cal deficit = 1 lb/week
    
    return HealthGoal.create(
      name: 'Weight Loss Goal',
      targetValue: targetWeight,
      unit: 'lbs',
      targetDate: targetDate,
      description: 'Lose ${(currentWeight - targetWeight).toStringAsFixed(1)} lbs by target date',
      type: GoalType.weightLoss,
    );
  }

  HealthGoal createWeightGainGoal({
    required double currentWeight,
    required double targetWeight,
    required DateTime targetDate,
    double? weeklyRate,
  }) {
    final rate = weeklyRate ?? 0.5; // Default 0.5 lb/week
    final surplusPerDay = rate * 500;
    
    return HealthGoal.create(
      name: 'Weight Gain Goal',
      targetValue: targetWeight,
      unit: 'lbs',
      targetDate: targetDate,
      description: 'Gain ${(targetWeight - currentWeight).toStringAsFixed(1)} lbs by target date',
      type: GoalType.weightGain,
    );
  }

  HealthGoal createMaintenanceGoal({
    required double currentWeight,
  }) {
    return HealthGoal.create(
      name: 'Weight Maintenance',
      targetValue: currentWeight,
      unit: 'lbs',
      targetDate: DateTime.now().add(const Duration(days: 365)),
      description: 'Maintain current weight within ±2 lbs',
      type: GoalType.maintenance,
    );
  }

  HealthGoal createPerformanceGoal({
    required String name,
    required double targetValue,
    required String unit,
    required DateTime targetDate,
    required String description,
  }) {
    return HealthGoal.create(
      name: name,
      targetValue: targetValue,
      unit: unit,
      targetDate: targetDate,
      description: description,
      type: GoalType.performance,
    );
  }

  GoalProgress calculateProgress({
    required HealthGoal goal,
    required CalorieBalance currentBalance,
    double? currentWeight,
  }) {
    final daysRemaining = goal.targetDate.difference(DateTime.now()).inDays;
    final totalDays = goal.targetDate.difference(DateTime.now().subtract(
      Duration(days: 30), // Assume goal was set 30 days ago for demo
    )).inDays;
    final progressPercentage = ((totalDays - daysRemaining) / totalDays).clamp(0.0, 1.0);

    String status;
    bool onTrack = true;
    double? targetDailyDeficit;

    switch (goal.type) {
      case GoalType.weightLoss:
        targetDailyDeficit = -defaultCalorieDeficit;
        onTrack = currentBalance.netCalories <= targetDailyDeficit + 100; // Allow 100 cal buffer
        status = onTrack ? 'On Track' : 'Behind Target';
        break;
        
      case GoalType.weightGain:
        targetDailyDeficit = defaultCalorieSurplus;
        onTrack = currentBalance.netCalories >= targetDailyDeficit - 100;
        status = onTrack ? 'On Track' : 'Behind Target';
        break;
        
      case GoalType.maintenance:
        targetDailyDeficit = 0;
        onTrack = currentBalance.netCalories.abs() <= defaultMaintenanceRange;
        status = onTrack ? 'Maintaining' : 'Off Balance';
        break;
        
      case GoalType.performance:
      case GoalType.custom:
        status = 'In Progress';
        onTrack = true; // For now, assume custom goals are on track
        break;
    }

    return GoalProgress(
      goal: goal,
      progressPercentage: progressPercentage,
      daysRemaining: daysRemaining,
      status: status,
      onTrack: onTrack,
      targetDailyDeficit: targetDailyDeficit,
      currentBalance: currentBalance,
    );
  }

  List<String> generateSuggestions({
    required GoalProgress progress,
    required double activityCalories,
    required double foodCalories,
  }) {
    final suggestions = <String>[];
    final goal = progress.goal;
    final balance = progress.currentBalance;

    if (!progress.onTrack) {
      switch (goal.type) {
        case GoalType.weightLoss:
          if (balance.netCalories > (progress.targetDailyDeficit ?? -500)) {
            final deficit = (progress.targetDailyDeficit ?? -500) - balance.netCalories;
            if (deficit > 200) {
              suggestions.add('Add ${deficit.toStringAsFixed(0)} calories of exercise');
            } else {
              suggestions.add('Reduce food intake by ${deficit.abs().toStringAsFixed(0)} calories');
            }
          }
          if (activityCalories < 200) {
            suggestions.add('Add 30 minutes of moderate exercise');
          }
          break;
          
        case GoalType.weightGain:
          if (balance.netCalories < (progress.targetDailyDeficit ?? 300)) {
            final surplus = (progress.targetDailyDeficit ?? 300) - balance.netCalories;
            suggestions.add('Add ${surplus.toStringAsFixed(0)} calories to meals');
          }
          break;
          
        case GoalType.maintenance:
          if (balance.netCalories.abs() > 100) {
            if (balance.netCalories > 100) {
              suggestions.add('Add light exercise or reduce portion sizes');
            } else {
              suggestions.add('Add a healthy snack or reduce exercise intensity');
            }
          }
          break;
          
        default:
          break;
      }
    } else {
      suggestions.add('Great job! You\'re on track with your goal');
    }

    // General suggestions
    if (activityCalories == 0) {
      suggestions.add('Log your activities to track calories burned');
    }
    
    if (foodCalories == 0) {
      suggestions.add('Log your meals to track calories consumed');
    }

    return suggestions;
  }
}

class GoalProgress {
  final HealthGoal goal;
  final double progressPercentage;
  final int daysRemaining;
  final String status;
  final bool onTrack;
  final double? targetDailyDeficit;
  final CalorieBalance currentBalance;

  GoalProgress({
    required this.goal,
    required this.progressPercentage,
    required this.daysRemaining,
    required this.status,
    required this.onTrack,
    this.targetDailyDeficit,
    required this.currentBalance,
  });

  String get progressLabel => '${(progressPercentage * 100).toStringAsFixed(0)}%';
  
  String get timeRemainingLabel {
    if (daysRemaining <= 0) return 'Target date reached';
    if (daysRemaining == 1) return '1 day remaining';
    if (daysRemaining < 7) return '$daysRemaining days remaining';
    if (daysRemaining < 30) {
      final weeks = (daysRemaining / 7).round();
      return weeks == 1 ? '1 week remaining' : '$weeks weeks remaining';
    }
    final months = (daysRemaining / 30).round();
    return months == 1 ? '1 month remaining' : '$months months remaining';
  }
}