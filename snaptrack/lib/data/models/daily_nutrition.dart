import 'package:isar/isar.dart';

import 'food_entry.dart';

part 'daily_nutrition.g.dart';

@collection
class DailyNutrition {
  Id id = Isar.autoIncrement;
  
  @Index(unique: true)
  late DateTime date;
  
  late double totalCalories;
  late double totalProtein;
  late double totalCarbs;
  late double totalFat;
  late int mealCount;
  
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
      totalCalories: entries.fold(0, (sum, entry) => sum + entry.calories),
      totalProtein: entries.fold(0, (sum, entry) => sum + entry.protein),
      totalCarbs: entries.fold(0, (sum, entry) => sum + entry.carbs),
      totalFat: entries.fold(0, (sum, entry) => sum + entry.fat),
      mealCount: entries.length,
    );
  }
}