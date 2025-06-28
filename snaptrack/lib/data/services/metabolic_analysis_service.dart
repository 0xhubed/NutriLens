import 'package:isar/isar.dart';
import '../models/food_entry.dart';
import '../models/meal_timing_data.dart';
import '../models/metabolic_state.dart';
import '../models/eating_pattern.dart';

class MetabolicAnalysisService {
  final Isar _isar;
  
  MetabolicAnalysisService(this._isar);
  
  /// Calculate the current metabolic state for a user
  Future<MetabolicState> calculateCurrentState(String userId) async {
    final lastMeal = await _getLastMeal(userId);
    
    if (lastMeal == null) {
      // No recent meals found, assume extended fasting
      return MetabolicState.calculate(
        timeSinceLastMeal: const Duration(hours: 24),
        lastMealCalories: 0,
        lastMealCarbs: 0,
        timestamp: DateTime.now(),
      );
    }
    
    final timeSinceLastMeal = DateTime.now().difference(lastMeal.timestamp);
    
    return MetabolicState.calculate(
      timeSinceLastMeal: timeSinceLastMeal,
      lastMealCalories: lastMeal.effectiveCalories,
      lastMealCarbs: lastMeal.effectiveCarbs,
      timestamp: DateTime.now(),
    );
  }
  
  /// Get meal timing data for a specific date range
  Future<List<MealTimingData>> getMealTimings(String userId, DateTime start, DateTime end) async {
    final foodEntries = await _isar.foodEntrys
        .filter()
        .timestampBetween(start, end)
        .findAll();
    
    if (foodEntries.isEmpty) return [];
    
    // Sort by timestamp
    foodEntries.sort((a, b) => a.timestamp.compareTo(b.timestamp));
    
    final mealTimings = <MealTimingData>[];
    
    for (int i = 0; i < foodEntries.length; i++) {
      final entry = foodEntries[i];
      
      // Calculate time since last meal
      Duration timeSinceLastMeal;
      if (i == 0) {
        // For first meal of the day, check previous day's last meal
        final previousMeal = await _getLastMealBefore(userId, entry.timestamp);
        timeSinceLastMeal = previousMeal != null 
            ? entry.timestamp.difference(previousMeal.timestamp)
            : const Duration(hours: 12); // Default assumption
      } else {
        timeSinceLastMeal = entry.timestamp.difference(foodEntries[i-1].timestamp);
      }
      
      // Calculate fasting window (time since first meal of the day)
      final firstMealToday = foodEntries.first;
      final fastingWindow = entry.timestamp.difference(_getStartOfDay(entry.timestamp));
      
      final mealTiming = MealTimingData.fromFoodEntry(
        entry,
        timeSinceLastMeal,
        fastingWindow,
      );
      
      mealTimings.add(mealTiming);
    }
    
    return mealTimings;
  }
  
  /// Generate eating pattern analysis for a specific date
  Future<EatingPattern> generateEatingPattern(String userId, DateTime date) async {
    final startOfDay = _getStartOfDay(date);
    final endOfDay = _getEndOfDay(date);
    
    final mealTimings = await getMealTimings(userId, startOfDay, endOfDay);
    
    return EatingPattern.fromMealTimings(mealTimings, date);
  }
  
  /// Get eating patterns for a date range
  Future<List<EatingPattern>> getEatingPatterns(String userId, DateTime start, DateTime end) async {
    final patterns = <EatingPattern>[];
    
    DateTime currentDate = _getStartOfDay(start);
    final endDate = _getStartOfDay(end);
    
    while (currentDate.isBefore(endDate) || currentDate.isAtSameMomentAs(endDate)) {
      final pattern = await generateEatingPattern(userId, currentDate);
      patterns.add(pattern);
      currentDate = currentDate.add(const Duration(days: 1));
    }
    
    return patterns;
  }
  
  /// Identify metabolic patterns over time
  Future<List<String>> identifyPatterns(String userId, Duration timeRange) async {
    final endDate = DateTime.now();
    final startDate = endDate.subtract(timeRange);
    
    final patterns = await getEatingPatterns(userId, startDate, endDate);
    final insights = <String>[];
    
    if (patterns.isEmpty) {
      insights.add('No eating patterns detected. Start logging meals to see insights.');
      return insights;
    }
    
    // Analyze intermittent fasting consistency
    final ifDays = patterns.where((p) => p.isIntermittentFasting).length;
    if (ifDays > patterns.length * 0.7) {
      insights.add('You consistently practice intermittent fasting (${(ifDays/patterns.length*100).round()}% of days)');
    }
    
    // Analyze eating windows
    final avgEatingWindow = patterns
        .map((p) => p.averageEatingWindow.inHours)
        .reduce((a, b) => a + b) / patterns.length;
    
    if (avgEatingWindow <= 8) {
      insights.add('You maintain a tight eating window (${avgEatingWindow.toStringAsFixed(1)} hours on average)');
    } else if (avgEatingWindow >= 14) {
      insights.add('Your eating window is quite extended (${avgEatingWindow.toStringAsFixed(1)} hours on average)');
    }
    
    // Analyze meal frequency
    final avgMealFreq = patterns
        .map((p) => p.mealFrequency)
        .reduce((a, b) => a + b) / patterns.length;
    
    if (avgMealFreq <= 2) {
      insights.add('You typically eat 1-2 meals per day (OMAD/2MAD pattern)');
    } else if (avgMealFreq >= 5) {
      insights.add('You eat frequently (${avgMealFreq.toStringAsFixed(1)} meals per day on average)');
    }
    
    // Analyze consistency
    final avgConsistency = patterns
        .map((p) => p.consistencyScore)
        .reduce((a, b) => a + b) / patterns.length;
    
    if (avgConsistency > 0.8) {
      insights.add('Your meal timing is very consistent');
    } else if (avgConsistency < 0.4) {
      insights.add('Your meal timing varies significantly day to day');
    }
    
    // Analyze metabolic optimization
    final avgOptimization = patterns
        .map((p) => p.metabolicOptimizationScore)
        .reduce((a, b) => a + b) / patterns.length;
    
    if (avgOptimization > 0.8) {
      insights.add('Your eating patterns are well-optimized for metabolic health');
    } else if (avgOptimization < 0.4) {
      insights.add('There\'s room for improvement in your eating pattern timing');
    }
    
    return insights;
  }
  
  /// Suggest optimal meal time based on current metabolic state
  Future<DateTime> suggestOptimalMealTime(String userId, MealType mealType) async {
    final currentState = await calculateCurrentState(userId);
    final now = DateTime.now();
    
    switch (mealType) {
      case MealType.breakfast:
        // Suggest breakfast 1-2 hours after waking (assuming 7 AM wake up)
        return DateTime(now.year, now.month, now.day, 8, 0);
        
      case MealType.lunch:
        // Suggest lunch 4-6 hours after breakfast
        if (currentState.timeSinceLastMeal.inHours >= 4) {
          return now; // Can eat now
        } else {
          final hoursToWait = 4 - currentState.timeSinceLastMeal.inHours;
          return now.add(Duration(hours: hoursToWait));
        }
        
      case MealType.dinner:
        // Suggest dinner 4-6 hours after lunch, but not after 8 PM
        final suggestedTime = now.add(const Duration(hours: 4));
        final eightPM = DateTime(now.year, now.month, now.day, 20, 0);
        
        if (suggestedTime.isAfter(eightPM)) {
          return eightPM;
        }
        return suggestedTime;
        
      case MealType.snack:
        // Suggest snack 2-3 hours after last meal
        if (currentState.timeSinceLastMeal.inHours >= 2) {
          return now; // Can snack now
        } else {
          return now.add(const Duration(hours: 2));
        }
    }
  }
  
  /// Get simple timing insights for display
  Future<Map<String, String>> getSimpleInsights(String userId) async {
    final currentState = await calculateCurrentState(userId);
    final insights = <String, String>{};
    
    // Current state
    insights['currentState'] = currentState.phaseDescription;
    insights['recommendation'] = currentState.recommendedAction;
    
    // Time since last meal
    final hours = currentState.timeSinceLastMeal.inHours;
    final minutes = currentState.timeSinceLastMeal.inMinutes % 60;
    
    if (hours > 0) {
      insights['timeSinceLastMeal'] = '${hours}h ${minutes}m ago';
    } else {
      insights['timeSinceLastMeal'] = '${minutes}m ago';
    }
    
    // Fat burning status
    if (currentState.isFatBurning) {
      insights['fatBurning'] = 'Active (${(currentState.fatBurningPotential * 100).round()}% potential)';
    } else {
      insights['fatBurning'] = 'Not active';
    }
    
    // Insulin status
    insights['insulinLevel'] = currentState.estimatedInsulinLevel.name.toUpperCase();
    
    return insights;
  }
  
  // Helper methods
  Future<FoodEntry?> _getLastMeal(String userId) async {
    final twentyFourHoursAgo = DateTime.now().subtract(const Duration(hours: 24));
    
    return await _isar.foodEntrys
        .filter()
        .timestampGreaterThan(twentyFourHoursAgo)
        .sortByTimestampDesc()
        .findFirst();
  }
  
  Future<FoodEntry?> _getLastMealBefore(String userId, DateTime before) async {
    return await _isar.foodEntrys
        .filter()
        .timestampLessThan(before)
        .sortByTimestampDesc()
        .findFirst();
  }
  
  DateTime _getStartOfDay(DateTime date) {
    return DateTime(date.year, date.month, date.day);
  }
  
  DateTime _getEndOfDay(DateTime date) {
    return DateTime(date.year, date.month, date.day, 23, 59, 59);
  }
}