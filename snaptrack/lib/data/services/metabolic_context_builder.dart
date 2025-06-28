import '../models/metabolic_context.dart';
import '../models/meal_timing_data.dart';
import '../models/metabolic_state.dart';
import '../models/eating_pattern.dart';
import '../models/user_metrics.dart';
import 'metabolic_analysis_service.dart';

class MetabolicContextBuilder {
  final MetabolicAnalysisService _analysisService;
  
  MetabolicContextBuilder(this._analysisService);
  
  /// Build complete metabolic context for a user
  Future<MetabolicContext> buildContext({
    required String userId,
    UserGoals goals = UserGoals.maintenance,
    ActivityLevel activityLevel = ActivityLevel.moderatelyActive,
    SleepPattern sleepPattern = SleepPattern.defaultPattern,
    String? currentActivity,
    double? currentStressLevel,
  }) async {
    final now = DateTime.now();
    final twentyFourHoursAgo = now.subtract(const Duration(hours: 24));
    final sevenDaysAgo = now.subtract(const Duration(days: 7));
    
    // Get recent meal data
    final last24Hours = await _analysisService.getMealTimings(
      userId, 
      twentyFourHoursAgo, 
      now,
    );
    
    final last7Days = await _analysisService.getMealTimings(
      userId, 
      sevenDaysAgo, 
      now,
    );
    
    // Get current metabolic state
    final currentState = await _analysisService.calculateCurrentState(userId);
    
    // Get recent eating pattern (yesterday for stability)
    final yesterday = now.subtract(const Duration(days: 1));
    final recentPattern = await _analysisService.generateEatingPattern(userId, yesterday);
    
    // Identify issues
    final identifiedIssues = await _identifyMetabolicIssues(
      last24Hours, 
      last7Days, 
      recentPattern,
      currentState,
    );
    
    // Get user metrics (if available)
    final userMetrics = await _getUserMetrics(userId);
    
    return MetabolicContext(
      last24Hours: last24Hours,
      last7Days: last7Days,
      timeSinceLastMeal: currentState.timeSinceLastMeal,
      currentState: currentState,
      goals: goals,
      activityLevel: activityLevel,
      sleepPattern: sleepPattern,
      recentPattern: recentPattern,
      identifiedIssues: identifiedIssues,
      timestamp: now,
      userMetrics: userMetrics,
      currentActivity: currentActivity,
      currentStressLevel: currentStressLevel,
    );
  }
  
  /// Build minimal context for quick analysis
  Future<MetabolicContext> buildQuickContext(String userId) async {
    final now = DateTime.now();
    final currentState = await _analysisService.calculateCurrentState(userId);
    
    // Get last 24 hours only for quick analysis
    final last24Hours = await _analysisService.getMealTimings(
      userId, 
      now.subtract(const Duration(hours: 24)), 
      now,
    );
    
    // Use current day pattern
    final today = await _analysisService.generateEatingPattern(userId, now);
    
    return MetabolicContext(
      last24Hours: last24Hours,
      last7Days: last24Hours, // Use same data for quick analysis
      timeSinceLastMeal: currentState.timeSinceLastMeal,
      currentState: currentState,
      goals: UserGoals.maintenance, // Default
      activityLevel: ActivityLevel.moderatelyActive, // Default
      sleepPattern: SleepPattern.defaultPattern,
      recentPattern: today,
      identifiedIssues: [],
      timestamp: now,
    );
  }
  
  Future<List<String>> _identifyMetabolicIssues(
    List<MealTimingData> last24Hours,
    List<MealTimingData> last7Days,
    EatingPattern recentPattern,
    MetabolicState currentState,
  ) async {
    final issues = <String>[];
    
    // Check for late night eating
    final lateNightMeals = last24Hours.where((meal) {
      final hour = meal.timestamp.hour;
      return hour >= 21 || hour <= 5; // 9 PM to 5 AM
    }).length;
    
    if (lateNightMeals > 0) {
      issues.add('late_eating');
    }
    
    // Check for irregular meal timing
    if (recentPattern.consistencyScore < 0.4) {
      issues.add('irregular_meals');
    }
    
    // Check for too frequent eating (less than 3 hours between meals)
    final frequentMeals = last24Hours.where((meal) {
      return meal.timeSinceLastMeal.inHours < 3;
    }).length;
    
    if (frequentMeals > 1) {
      issues.add('frequent_eating');
    }
    
    // Check for extended eating window (>14 hours)
    if (recentPattern.averageEatingWindow.inHours > 14) {
      issues.add('extended_eating_window');
    }
    
    // Check for insufficient fasting window (<10 hours)
    if (recentPattern.averageFastingWindow.inHours < 10) {
      issues.add('insufficient_fasting');
    }
    
    // Check for high carb meals in evening
    final eveningHighCarbMeals = last24Hours.where((meal) {
      final hour = meal.timestamp.hour;
      return hour >= 18 && meal.isHighCarb; // After 6 PM and high carb
    }).length;
    
    if (eveningHighCarbMeals > 0) {
      issues.add('evening_high_carb');
    }
    
    // Check for skipping breakfast (no meal before 11 AM)
    final breakfastMeals = last24Hours.where((meal) {
      return meal.timestamp.hour < 11;
    }).length;
    
    if (breakfastMeals == 0 && last24Hours.isNotEmpty) {
      issues.add('skipping_breakfast');
    }
    
    // Check for large meals (>800 calories)
    final largeMeals = last24Hours.where((meal) {
      return meal.totalCalories > 800;
    }).length;
    
    if (largeMeals > 1) {
      issues.add('large_meals');
    }
    
    return issues;
  }
  
  Future<UserMetrics?> _getUserMetrics(String userId) async {
    // This would typically fetch from a user metrics service
    // For now, return null as this service doesn't exist yet
    return null;
  }
  
  /// Get issue descriptions for display
  static Map<String, String> get issueDescriptions => {
    'late_eating': 'Eating late at night can disrupt circadian rhythms and sleep quality',
    'irregular_meals': 'Inconsistent meal timing can affect metabolic efficiency',
    'frequent_eating': 'Eating too frequently may not allow proper digestion and insulin recovery',
    'extended_eating_window': 'Long eating windows reduce fasting benefits',
    'insufficient_fasting': 'Short fasting periods limit metabolic flexibility',
    'evening_high_carb': 'High carb meals in evening can affect sleep and fat burning',
    'skipping_breakfast': 'Skipping breakfast may affect metabolic rhythm',
    'large_meals': 'Very large meals can strain digestion and affect energy levels',
  };
  
  /// Get issue recommendations
  static Map<String, String> get issueRecommendations => {
    'late_eating': 'Try to finish eating 3 hours before bedtime',
    'irregular_meals': 'Aim for consistent meal timing each day',
    'frequent_eating': 'Allow 3-4 hours between meals for proper digestion',
    'extended_eating_window': 'Consider reducing eating window to 10-12 hours',
    'insufficient_fasting': 'Aim for at least 12 hours of fasting overnight',
    'evening_high_carb': 'Focus on protein and vegetables for dinner',
    'skipping_breakfast': 'Consider a light breakfast to support metabolic rhythm',
    'large_meals': 'Try smaller, more frequent meals if feeling too full',
  };
}