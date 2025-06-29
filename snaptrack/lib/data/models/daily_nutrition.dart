import 'package:hive/hive.dart';

import 'food_entry.dart';

part 'daily_nutrition.g.dart';

@HiveType(typeId: 1)
class DailyNutrition extends HiveObject {
  @HiveField(0)
  String? id;
  
  @HiveField(1)
  DateTime date = DateTime.now();
  
  @HiveField(2)
  double totalCalories = 0.0;
  
  @HiveField(3)
  double totalProtein = 0.0;
  
  @HiveField(4)
  double totalCarbs = 0.0;
  
  @HiveField(5)
  double totalFat = 0.0;
  
  @HiveField(6)
  int mealCount = 0;
  
  DailyNutrition({
    required this.date,
    this.totalCalories = 0,
    this.totalProtein = 0,
    this.totalCarbs = 0,
    this.totalFat = 0,
    this.mealCount = 0,
  });
  
  // Helper to create from food entries
  static DailyNutrition fromEntries(DateTime date, List<FoodEntry> entries) {
    return DailyNutrition(
      date: DateTime(date.year, date.month, date.day),
      totalCalories: entries.fold(0.0, (sum, entry) => sum + entry.effectiveCalories),
      totalProtein: entries.fold(0.0, (sum, entry) => sum + entry.effectiveProtein),
      totalCarbs: entries.fold(0.0, (sum, entry) => sum + entry.effectiveCarbs),
      totalFat: entries.fold(0.0, (sum, entry) => sum + entry.effectiveFat),
      mealCount: entries.length,
    );
  }
}