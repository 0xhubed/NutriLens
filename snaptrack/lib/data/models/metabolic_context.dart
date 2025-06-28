import 'meal_timing_data.dart';
import 'metabolic_state.dart';
import 'eating_pattern.dart';
import 'user_metrics.dart';

enum UserGoals {
  weightLoss,
  muscleGain,
  maintenance,
  performance,
  health,
}

enum ActivityLevel {
  sedentary,
  lightlyActive,
  moderatelyActive,
  veryActive,
  extremelyActive,
}

class SleepPattern {
  final Duration averageSleepDuration;
  final DateTime typicalBedtime;
  final DateTime typicalWakeTime;
  final double sleepQuality; // 0.0 to 1.0
  
  const SleepPattern({
    required this.averageSleepDuration,
    required this.typicalBedtime,
    required this.typicalWakeTime,
    required this.sleepQuality,
  });
  
  static const SleepPattern defaultPattern = SleepPattern(
    averageSleepDuration: Duration(hours: 8),
    typicalBedtime: Duration(hours: 23), // 11 PM as Duration from midnight
    typicalWakeTime: Duration(hours: 7), // 7 AM as Duration from midnight
    sleepQuality: 0.7,
  );
  
  Map<String, dynamic> toJson() => {
    'averageSleepHours': averageSleepDuration.inHours,
    'bedtimeHour': typicalBedtime.inHours,
    'wakeTimeHour': typicalWakeTime.inHours,
    'sleepQuality': sleepQuality,
  };
}

class MetabolicContext {
  // Recent meal history
  final List<MealTimingData> last24Hours;
  final List<MealTimingData> last7Days;
  
  // Current state
  final Duration timeSinceLastMeal;
  final MetabolicState currentState;
  
  // User profile
  final UserGoals goals;
  final ActivityLevel activityLevel;
  final SleepPattern sleepPattern;
  final UserMetrics? userMetrics;
  
  // Patterns
  final EatingPattern recentPattern;
  final List<String> identifiedIssues;
  
  // Additional context
  final DateTime timestamp;
  final String? currentActivity; // workout, work, sleep, etc.
  final double? currentStressLevel; // 0.0 to 1.0
  
  const MetabolicContext({
    required this.last24Hours,
    required this.last7Days,
    required this.timeSinceLastMeal,
    required this.currentState,
    required this.goals,
    required this.activityLevel,
    required this.sleepPattern,
    required this.recentPattern,
    required this.identifiedIssues,
    required this.timestamp,
    this.userMetrics,
    this.currentActivity,
    this.currentStressLevel,
  });
  
  /// Convert to JSON for LLM prompt
  Map<String, dynamic> toJson() {
    return {
      'timestamp': timestamp.toIso8601String(),
      'currentState': {
        'phase': currentState.phase.name,
        'insulinLevel': currentState.estimatedInsulinLevel.name,
        'timeSinceLastMeal': '${timeSinceLastMeal.inHours}h ${timeSinceLastMeal.inMinutes % 60}m',
        'fatBurningPotential': currentState.fatBurningPotential,
        'activeProcesses': currentState.activeProcesses,
        'description': currentState.phaseDescription,
      },
      'recentMeals': {
        'last24Hours': last24Hours.map((meal) => {
          'timestamp': meal.timestamp.toIso8601String(),
          'mealType': meal.mealType.name,
          'calories': meal.totalCalories,
          'macros': {
            'protein': meal.protein,
            'carbs': meal.carbs,
            'fat': meal.fat,
          },
          'foodTypes': meal.foodTypes,
          'mealSize': meal.mealSizeCategory,
        }).toList(),
        'weeklyAverage': _calculateWeeklyAverages(),
      },
      'eatingPattern': {
        'eatingWindow': '${recentPattern.averageEatingWindow.inHours}h',
        'fastingWindow': '${recentPattern.averageFastingWindow.inHours}h',
        'mealFrequency': recentPattern.mealFrequency,
        'isIntermittentFasting': recentPattern.isIntermittentFasting,
        'detectedPattern': recentPattern.detectedPattern,
        'consistencyScore': recentPattern.consistencyScore,
        'optimizationScore': recentPattern.metabolicOptimizationScore,
        'quality': recentPattern.qualityAssessment,
      },
      'userProfile': {
        'goals': goals.name,
        'activityLevel': activityLevel.name,
        'age': userMetrics?.age,
        'gender': userMetrics?.gender,
        'weight': userMetrics?.currentWeight,
        'height': userMetrics?.height,
        'bodyFatPercentage': userMetrics?.bodyFatPercentage,
      },
      'sleepPattern': sleepPattern.toJson(),
      'identifiedIssues': identifiedIssues,
      'currentActivity': currentActivity,
      'stressLevel': currentStressLevel,
    };
  }
  
  Map<String, dynamic> _calculateWeeklyAverages() {
    if (last7Days.isEmpty) {
      return {
        'avgCalories': 0,
        'avgProtein': 0,
        'avgCarbs': 0,
        'avgFat': 0,
        'avgMealsPerDay': 0,
      };
    }
    
    final totalCalories = last7Days.fold(0.0, (sum, meal) => sum + meal.totalCalories);
    final totalProtein = last7Days.fold(0.0, (sum, meal) => sum + meal.protein);
    final totalCarbs = last7Days.fold(0.0, (sum, meal) => sum + meal.carbs);
    final totalFat = last7Days.fold(0.0, (sum, meal) => sum + meal.fat);
    
    return {
      'avgCalories': totalCalories / 7,
      'avgProtein': totalProtein / 7,
      'avgCarbs': totalCarbs / 7,
      'avgFat': totalFat / 7,
      'avgMealsPerDay': last7Days.length / 7,
    };
  }
  
  /// Get human-readable summary for display
  String getSummary() {
    final buffer = StringBuffer();
    buffer.writeln('Current State: ${currentState.phaseDescription}');
    buffer.writeln('Time Since Last Meal: ${_formatDuration(timeSinceLastMeal)}');
    buffer.writeln('Eating Pattern: ${recentPattern.patternSummary}');
    buffer.writeln('Pattern Quality: ${recentPattern.qualityAssessment}');
    
    if (identifiedIssues.isNotEmpty) {
      buffer.writeln('Areas for Improvement:');
      for (final issue in identifiedIssues) {
        buffer.writeln('• $issue');
      }
    }
    
    return buffer.toString();
  }
  
  String _formatDuration(Duration duration) {
    final hours = duration.inHours;
    final minutes = duration.inMinutes % 60;
    
    if (hours > 0) {
      return '${hours}h ${minutes}m';
    } else {
      return '${minutes}m';
    }
  }
  
  /// Check if it's optimal time to eat based on metabolic state
  bool get isOptimalEatingTime {
    switch (currentState.phase) {
      case MetabolicPhase.fed:
        return false; // Still digesting
      case MetabolicPhase.fasting:
        return timeSinceLastMeal.inHours >= 4; // Good for next meal
      case MetabolicPhase.fatBurning:
        return false; // Optimal fat burning window
      case MetabolicPhase.muscleBuilding:
        return true; // Good time for protein intake
    }
  }
  
  /// Get next optimal meal recommendation
  String get nextMealRecommendation {
    if (currentState.phase == MetabolicPhase.fatBurning) {
      return 'Consider extending fast for maximum fat burning, or eat protein if muscle building is priority';
    } else if (currentState.phase == MetabolicPhase.muscleBuilding) {
      return 'Great time for a protein-rich meal to support muscle building';
    } else if (timeSinceLastMeal.inHours < 3) {
      return 'Wait ${3 - timeSinceLastMeal.inHours} more hours for optimal digestion';
    } else {
      return 'Good time for your next meal based on your eating pattern';
    }
  }
}