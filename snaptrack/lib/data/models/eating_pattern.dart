import 'package:hive/hive.dart';
import 'food_entry.dart';
import 'meal_timing_data.dart';
import 'macro_profile.dart';

part 'eating_pattern.g.dart';

@HiveType(typeId: 8)
class EatingPattern extends HiveObject {
  @HiveField(0)
  String? id;
  
  @HiveField(1)
  DateTime date = DateTime.now(); // Date this pattern represents
  
  @HiveField(2)
  int averageEatingWindowMinutes = 0; // Duration stored as minutes
  
  @HiveField(3)
  int averageFastingWindowMinutes = 0; // Duration stored as minutes
  
  // Typical meal times for this day
  @HiveField(4)
  List<DateTime> typicalMealTimes = [];
  
  @HiveField(5)
  double mealFrequency = 0.0; // meals per day
  
  // Macro distribution per meal type
  @HiveField(6)
  double breakfastProtein = 0.0;
  
  @HiveField(7)
  double breakfastCarbs = 0.0;
  
  @HiveField(8)
  double breakfastFat = 0.0;
  
  @HiveField(9)
  double lunchProtein = 0.0;
  
  @HiveField(10)
  double lunchCarbs = 0.0;
  
  @HiveField(11)
  double lunchFat = 0.0;
  
  @HiveField(12)
  double dinnerProtein = 0.0;
  
  @HiveField(13)
  double dinnerCarbs = 0.0;
  
  @HiveField(14)
  double dinnerFat = 0.0;
  
  @HiveField(15)
  double snackProtein = 0.0;
  
  @HiveField(16)
  double snackCarbs = 0.0;
  
  @HiveField(17)
  double snackFat = 0.0;
  
  // Pattern quality metrics
  @HiveField(18)
  double consistencyScore = 0.0; // 0.0 to 1.0
  
  @HiveField(19)
  double metabolicOptimizationScore = 0.0; // 0.0 to 1.0
  
  // Timing insights
  @HiveField(20)
  bool isIntermittentFasting = false;
  
  @HiveField(21)
  String? detectedPattern; // '16:8', '18:6', 'OMAD', etc.
  
  // Constructor
  EatingPattern();
  
  // Helper properties for Duration conversion
  Duration get averageEatingWindow => Duration(minutes: averageEatingWindowMinutes);
  set averageEatingWindow(Duration duration) => averageEatingWindowMinutes = duration.inMinutes;
  
  Duration get averageFastingWindow => Duration(minutes: averageFastingWindowMinutes);
  set averageFastingWindow(Duration duration) => averageFastingWindowMinutes = duration.inMinutes;
  
  // Calculate eating pattern from meal timing data
  static EatingPattern fromMealTimings(List<MealTimingData> mealTimings, DateTime date) {
    final pattern = EatingPattern()..date = date;
    
    if (mealTimings.isEmpty) {
      pattern._setDefaults();
      return pattern;
    }
    
    pattern._calculateTimingWindows(mealTimings);
    pattern._calculateMealFrequency(mealTimings);
    pattern._calculateMacroDistribution(mealTimings);
    pattern._calculateScores(mealTimings);
    pattern._detectPattern(mealTimings);
    
    return pattern;
  }
  
  void _setDefaults() {
    averageEatingWindowMinutes = 12 * 60; // 12 hours
    averageFastingWindowMinutes = 12 * 60; // 12 hours
    mealFrequency = 3.0;
    consistencyScore = 0.0;
    metabolicOptimizationScore = 0.0;
    
    // Set default macro values
    _setDefaultMacros();
  }
  
  void _setDefaultMacros() {
    breakfastProtein = breakfastCarbs = breakfastFat = 0.0;
    lunchProtein = lunchCarbs = lunchFat = 0.0;
    dinnerProtein = dinnerCarbs = dinnerFat = 0.0;
    snackProtein = snackCarbs = snackFat = 0.0;
  }
  
  void _calculateTimingWindows(List<MealTimingData> mealTimings) {
    if (mealTimings.isEmpty) return;
    
    // Sort by timestamp
    final sortedMeals = List<MealTimingData>.from(mealTimings)
      ..sort((a, b) => a.timestamp.compareTo(b.timestamp));
    
    final firstMeal = sortedMeals.first.timestamp;
    final lastMeal = sortedMeals.last.timestamp;
    
    final eatingWindow = lastMeal.difference(firstMeal);
    averageEatingWindowMinutes = eatingWindow.inMinutes;
    averageFastingWindowMinutes = ((24 * 60) - eatingWindow.inMinutes).toInt();
    
    typicalMealTimes = sortedMeals.map<DateTime>((m) => m.timestamp).toList();
  }
  
  void _calculateMealFrequency(List<MealTimingData> mealTimings) {
    mealFrequency = mealTimings.length.toDouble();
  }
  
  void _calculateMacroDistribution(List<MealTimingData> mealTimings) {
    _setDefaultMacros();
    
    final mealsByType = <MealType, List<MealTimingData>>{};
    for (final meal in mealTimings) {
      mealsByType.putIfAbsent(meal.mealType, () => []).add(meal);
    }
    
    // Calculate average macros for each meal type
    for (final entry in mealsByType.entries) {
      final mealType = entry.key;
      final meals = entry.value;
      
      if (meals.isEmpty) continue;
      
      final avgProtein = meals.map((m) => m.protein).reduce((a, b) => a + b) / meals.length;
      final avgCarbs = meals.map((m) => m.carbs).reduce((a, b) => a + b) / meals.length;
      final avgFat = meals.map((m) => m.fat).reduce((a, b) => a + b) / meals.length;
      
      switch (mealType) {
        case MealType.breakfast:
          breakfastProtein = avgProtein;
          breakfastCarbs = avgCarbs;
          breakfastFat = avgFat;
          break;
        case MealType.lunch:
          lunchProtein = avgProtein;
          lunchCarbs = avgCarbs;
          lunchFat = avgFat;
          break;
        case MealType.dinner:
          dinnerProtein = avgProtein;
          dinnerCarbs = avgCarbs;
          dinnerFat = avgFat;
          break;
        case MealType.snack:
          snackProtein = avgProtein;
          snackCarbs = avgCarbs;
          snackFat = avgFat;
          break;
      }
    }
  }
  
  void _calculateScores(List<MealTimingData> mealTimings) {
    // Consistency score based on regular meal timing
    consistencyScore = _calculateConsistencyScore(mealTimings);
    
    // Metabolic optimization score based on eating window and patterns
    metabolicOptimizationScore = _calculateMetabolicScore();
  }
  
  double _calculateConsistencyScore(List<MealTimingData> mealTimings) {
    if (mealTimings.length < 2) return 0.0;
    
    // Calculate variance in meal intervals
    final intervals = <Duration>[];
    for (int i = 1; i < mealTimings.length; i++) {
      intervals.add(mealTimings[i].timestamp.difference(mealTimings[i-1].timestamp));
    }
    
    if (intervals.isEmpty) return 0.0;
    
    final averageInterval = intervals.map((d) => d.inMinutes).reduce((a, b) => a + b) / intervals.length;
    final variance = intervals
        .map((d) => (d.inMinutes - averageInterval) * (d.inMinutes - averageInterval))
        .reduce((a, b) => a + b) / intervals.length;
    
    // Lower variance = higher consistency
    return (1.0 / (1.0 + variance / 10000)).clamp(0.0, 1.0);
  }
  
  double _calculateMetabolicScore() {
    double score = 0.0;
    
    // Bonus for intermittent fasting patterns
    if (isIntermittentFasting) score += 0.3;
    
    // Bonus for reasonable eating window (8-12 hours)
    final eatingHours = averageEatingWindow.inHours;
    if (eatingHours >= 8 && eatingHours <= 12) score += 0.3;
    
    // Bonus for adequate fasting window (12+ hours)
    if (averageFastingWindow.inHours >= 12) score += 0.2;
    
    // Bonus for not eating too frequently (3-4 meals per day)
    if (mealFrequency >= 3 && mealFrequency <= 4) score += 0.2;
    
    return score.clamp(0.0, 1.0);
  }
  
  void _detectPattern(List<MealTimingData> mealTimings) {
    final fastingHours = averageFastingWindow.inHours;
    final eatingHours = averageEatingWindow.inHours;
    
    if (fastingHours >= 16 && eatingHours <= 8) {
      isIntermittentFasting = true;
      detectedPattern = '16:8';
    } else if (fastingHours >= 18 && eatingHours <= 6) {
      isIntermittentFasting = true;
      detectedPattern = '18:6';
    } else if (fastingHours >= 20 && eatingHours <= 4) {
      isIntermittentFasting = true;
      detectedPattern = '20:4';
    } else if (mealTimings.length == 1) {
      isIntermittentFasting = true;
      detectedPattern = 'OMAD';
    } else if (fastingHours >= 12) {
      isIntermittentFasting = true;
      detectedPattern = 'Extended';
    }
  }
  
  // Helper methods
  MacroGrams getMacrosForMealType(MealType mealType) {
    switch (mealType) {
      case MealType.breakfast:
        return MacroGrams(protein: breakfastProtein, carbs: breakfastCarbs, fat: breakfastFat);
      case MealType.lunch:
        return MacroGrams(protein: lunchProtein, carbs: lunchCarbs, fat: lunchFat);
      case MealType.dinner:
        return MacroGrams(protein: dinnerProtein, carbs: dinnerCarbs, fat: dinnerFat);
      case MealType.snack:
        return MacroGrams(protein: snackProtein, carbs: snackCarbs, fat: snackFat);
    }
  }
  
  String get patternSummary {
    if (detectedPattern != null) {
      return '$detectedPattern Intermittent Fasting';
    }
    return '${averageEatingWindow.inHours}h eating window';
  }
  
  String get qualityAssessment {
    if (metabolicOptimizationScore > 0.8) return 'Excellent';
    if (metabolicOptimizationScore > 0.6) return 'Good';
    if (metabolicOptimizationScore > 0.4) return 'Fair';
    return 'Needs Improvement';
  }
}