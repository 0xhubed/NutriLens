import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/food_entry.dart';
import '../models/daily_nutrition.dart';
import 'database_service.dart';

// Analytics data models
class WeeklyStats {
  final double avgCalories;
  final double avgProtein;
  final double avgCarbs;
  final double avgFat;
  final int daysLogged;
  final int totalMeals;
  final Map<String, int> topFoods;
  final List<DailyNutrition> dailyBreakdown;

  WeeklyStats({
    required this.avgCalories,
    required this.avgProtein,
    required this.avgCarbs,
    required this.avgFat,
    required this.daysLogged,
    required this.totalMeals,
    required this.topFoods,
    required this.dailyBreakdown,
  });
}

class Insight {
  final String title;
  final String description;
  final InsightType type;
  final double? value;
  final String? actionSuggestion;

  Insight({
    required this.title,
    required this.description,
    required this.type,
    this.value,
    this.actionSuggestion,
  });
}

enum InsightType {
  consistency,
  macroBalance,
  caloriesTrend,
  mealPattern,
  achievement,
  suggestion
}

class DailyProgress {
  final DateTime date;
  final double caloriesGoal;
  final double caloriesActual;
  final double proteinGoal;
  final double proteinActual;
  final double carbsGoal;
  final double carbsActual;
  final double fatGoal;
  final double fatActual;
  final int mealsLogged;

  DailyProgress({
    required this.date,
    required this.caloriesGoal,
    required this.caloriesActual,
    required this.proteinGoal,
    required this.proteinActual,
    required this.carbsGoal,
    required this.carbsActual,
    required this.fatGoal,
    required this.fatActual,
    required this.mealsLogged,
  });

  double get caloriesProgress => caloriesGoal > 0 ? (caloriesActual / caloriesGoal).clamp(0.0, 1.0) : 0.0;
  double get proteinProgress => proteinGoal > 0 ? (proteinActual / proteinGoal).clamp(0.0, 1.0) : 0.0;
  double get carbsProgress => carbsGoal > 0 ? (carbsActual / carbsGoal).clamp(0.0, 1.0) : 0.0;
  double get fatProgress => fatGoal > 0 ? (fatActual / fatGoal).clamp(0.0, 1.0) : 0.0;
}

class AnalyticsService {
  final DatabaseService _dbService;

  AnalyticsService(this._dbService);

  // Calculate weekly statistics
  Future<WeeklyStats> calculateWeeklyStats(DateTime startDate) async {
    final endDate = startDate.add(const Duration(days: 7));
    final entries = await _dbService.getFoodEntriesInRange(startDate, endDate);
    
    if (entries.isEmpty) {
      return WeeklyStats(
        avgCalories: 0,
        avgProtein: 0,
        avgCarbs: 0,
        avgFat: 0,
        daysLogged: 0,
        totalMeals: 0,
        topFoods: {},
        dailyBreakdown: [],
      );
    }

    // Group entries by day
    final Map<DateTime, List<FoodEntry>> entriesByDay = {};
    for (final entry in entries) {
      final day = DateTime(entry.timestamp.year, entry.timestamp.month, entry.timestamp.day);
      entriesByDay.putIfAbsent(day, () => []).add(entry);
    }

    // Calculate daily nutrition
    final List<DailyNutrition> dailyBreakdown = [];
    double totalCalories = 0;
    double totalProtein = 0;
    double totalCarbs = 0;
    double totalFat = 0;

    for (int i = 0; i < 7; i++) {
      final day = startDate.add(Duration(days: i));
      final dayKey = DateTime(day.year, day.month, day.day);
      final dayEntries = entriesByDay[dayKey] ?? [];
      
      final dayNutrition = DailyNutrition.fromEntries(day, dayEntries);
      dailyBreakdown.add(dayNutrition);
      
      totalCalories += dayNutrition.totalCalories;
      totalProtein += dayNutrition.totalProtein;
      totalCarbs += dayNutrition.totalCarbs;
      totalFat += dayNutrition.totalFat;
    }

    // Calculate top foods with portion information
    final Map<String, int> foodCounts = {};
    for (final entry in entries) {
      final foodKey = entry.portions.isNotEmpty
          ? '${entry.name} (${entry.portionSummary})'
          : entry.name;
      foodCounts[foodKey] = (foodCounts[foodKey] ?? 0) + 1;
    }
    
    final topFoods = Map.fromEntries(
      foodCounts.entries.toList()
        ..sort((a, b) => b.value.compareTo(a.value))
        ..take(5)
    );

    final daysWithEntries = entriesByDay.keys.length;

    return WeeklyStats(
      avgCalories: daysWithEntries > 0 ? totalCalories / daysWithEntries : 0,
      avgProtein: daysWithEntries > 0 ? totalProtein / daysWithEntries : 0,
      avgCarbs: daysWithEntries > 0 ? totalCarbs / daysWithEntries : 0,
      avgFat: daysWithEntries > 0 ? totalFat / daysWithEntries : 0,
      daysLogged: daysWithEntries,
      totalMeals: entries.length,
      topFoods: topFoods,
      dailyBreakdown: dailyBreakdown,
    );
  }

  // Generate insights based on food entries
  Future<List<Insight>> generateInsights(List<FoodEntry> entries) async {
    final insights = <Insight>[];
    
    if (entries.isEmpty) {
      insights.add(Insight(
        title: "Start Tracking",
        description: "Begin your nutrition journey by logging your first meal!",
        type: InsightType.suggestion,
        actionSuggestion: "Tap 'Add Food' to get started",
      ));
      return insights;
    }

    // Consistency insight
    final today = DateTime.now();
    final last7Days = List.generate(7, (i) => today.subtract(Duration(days: i)));
    final daysWithEntries = last7Days.where((day) {
      return entries.any((entry) =>
        entry.timestamp.year == day.year &&
        entry.timestamp.month == day.month &&
        entry.timestamp.day == day.day);
    }).length;

    insights.add(Insight(
      title: "Consistency Score",
      description: "You logged meals $daysWithEntries out of 7 days this week!",
      type: InsightType.consistency,
      value: daysWithEntries / 7,
      actionSuggestion: daysWithEntries < 5 
        ? "Try to log at least one meal per day for better insights"
        : "Great consistency! Keep it up!",
    ));

    // Calorie trend insight
    final last7DaysEntries = entries.where((entry) =>
      entry.timestamp.isAfter(today.subtract(const Duration(days: 7)))
    ).toList();
    
    if (last7DaysEntries.isNotEmpty) {
      final avgCalories = last7DaysEntries
        .map((e) => e.calories)
        .reduce((a, b) => a + b) / last7DaysEntries.length;
      
      insights.add(Insight(
        title: "Weekly Average",
        description: "Average daily calories: ${avgCalories.toStringAsFixed(0)} kcal",
        type: InsightType.caloriesTrend,
        value: avgCalories,
      ));
    }

    // Meal pattern insight
    final breakfastCount = entries.where((e) => e.mealType == MealType.breakfast).length;
    final totalDays = (entries.length / 3).ceil(); // Rough estimate
    
    if (totalDays > 0 && breakfastCount / totalDays < 0.5) {
      insights.add(Insight(
        title: "Breakfast Pattern",
        description: "You tend to skip breakfast frequently",
        type: InsightType.mealPattern,
        actionSuggestion: "Consider adding quick breakfast options like yogurt or oatmeal",
      ));
    }

    // Top food insight
    final foodCounts = <String, int>{};
    for (final entry in entries) {
      foodCounts[entry.name] = (foodCounts[entry.name] ?? 0) + 1;
    }
    
    if (foodCounts.isNotEmpty) {
      final topFood = foodCounts.entries.reduce((a, b) => a.value > b.value ? a : b);
      insights.add(Insight(
        title: "Most Logged Food",
        description: "${topFood.key} appears ${topFood.value} times in your recent entries",
        type: InsightType.mealPattern,
      ));
    }

    return insights;
  }

  // Watch daily progress
  Stream<DailyProgress> watchDailyProgress({DateTime? date}) {
    final targetDate = date ?? DateTime.now();
    final startOfDay = DateTime(targetDate.year, targetDate.month, targetDate.day);
    final endOfDay = startOfDay.add(const Duration(days: 1));
    
    return _dbService.watchFoodEntriesInRange(startOfDay, endOfDay).map((entries) {
      final totalCalories = entries.fold<double>(0, (sum, entry) => sum + entry.calories);
      final totalProtein = entries.fold<double>(0, (sum, entry) => sum + entry.protein);
      final totalCarbs = entries.fold<double>(0, (sum, entry) => sum + entry.carbs);
      final totalFat = entries.fold<double>(0, (sum, entry) => sum + entry.fat);
      
      // Default goals (these would come from user settings in a real app)
      const caloriesGoal = 2000.0;
      const proteinGoal = 150.0;
      const carbsGoal = 250.0;
      const fatGoal = 67.0;
      
      return DailyProgress(
        date: targetDate,
        caloriesGoal: caloriesGoal,
        caloriesActual: totalCalories,
        proteinGoal: proteinGoal,
        proteinActual: totalProtein,
        carbsGoal: carbsGoal,
        carbsActual: totalCarbs,
        fatGoal: fatGoal,
        fatActual: totalFat,
        mealsLogged: entries.length,
      );
    });
  }
}

// Provider for analytics service
final analyticsServiceProvider = Provider<AnalyticsService>((ref) {
  final dbService = ref.watch(databaseServiceProvider);
  return AnalyticsService(dbService);
});

// Provider for weekly stats
final weeklyStatsProvider = FutureProvider.family<WeeklyStats, DateTime>((ref, startDate) {
  final analyticsService = ref.watch(analyticsServiceProvider);
  return analyticsService.calculateWeeklyStats(startDate);
});

// Provider for insights
final insightsProvider = FutureProvider<List<Insight>>((ref) async {
  final dbService = ref.watch(databaseServiceProvider);
  final analyticsService = ref.watch(analyticsServiceProvider);
  
  final entries = await dbService.getFoodEntriesInRange(
    DateTime.now().subtract(const Duration(days: 30)),
    DateTime.now(),
  );
  
  return analyticsService.generateInsights(entries);
});

// Provider for daily progress
final dailyProgressProvider = StreamProvider.family<DailyProgress, DateTime?>((ref, date) {
  final analyticsService = ref.watch(analyticsServiceProvider);
  final targetDate = date ?? DateTime.now();
  
  // Create default progress
  final defaultProgress = DailyProgress(
    date: targetDate,
    caloriesGoal: 2000.0,
    caloriesActual: 0.0,
    proteinGoal: 150.0,
    proteinActual: 0.0,
    carbsGoal: 250.0,
    carbsActual: 0.0,
    fatGoal: 67.0,
    fatActual: 0.0,
    mealsLogged: 0,
  );
  
  // Create a stream that immediately emits default data and then switches to database updates
  return Stream<DailyProgress>.multi((controller) async {
    // Emit default immediately
    controller.add(defaultProgress);
    
    try {
      // Subscribe to database updates
      await for (final progress in analyticsService.watchDailyProgress(date: date)) {
        controller.add(progress);
      }
    } catch (e) {
      // On error, we already have default data emitted
    }
  });
});