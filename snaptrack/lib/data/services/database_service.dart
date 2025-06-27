import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';

import '../models/daily_nutrition.dart';
import '../models/food_entry.dart';

final databaseServiceProvider = Provider<DatabaseService>((ref) {
  throw UnimplementedError('Must be overridden in main.dart');
});

class DatabaseService {
  final Isar isar;
  
  DatabaseService(this.isar);
  
  // Expose Isar instance for other services
  Isar get database => isar;
  
  // Food Entry operations
  Future<void> saveFoodEntry(FoodEntry entry) async {
    await isar.writeTxn(() async {
      await isar.foodEntrys.put(entry);
      await _updateDailyNutrition(entry.timestamp);
    });
  }
  
  Future<void> deleteFoodEntry(int id) async {
    final entry = await isar.foodEntrys.get(id);
    if (entry != null) {
      await isar.writeTxn(() async {
        await isar.foodEntrys.delete(id);
        await _updateDailyNutrition(entry.timestamp);
      });
    }
  }
  
  Future<List<FoodEntry>> getFoodEntriesForDate(DateTime date) async {
    final startOfDay = DateTime(date.year, date.month, date.day);
    final endOfDay = startOfDay.add(const Duration(days: 1));
    
    return await isar.foodEntrys
        .filter()
        .timestampBetween(startOfDay, endOfDay, includeUpper: false)
        .findAll();
  }
  
  Stream<List<FoodEntry>> watchFoodEntries() {
    return isar.foodEntrys
        .where()
        .sortByTimestampDesc()
        .watch(fireImmediately: true);
  }
  
  // Daily Nutrition operations
  Future<DailyNutrition?> getDailyNutrition(DateTime date) async {
    final dateOnly = DateTime(date.year, date.month, date.day);
    return await isar.dailyNutritions
        .where()
        .dateEqualTo(dateOnly)
        .findFirst();
  }
  
  Stream<DailyNutrition?> watchDailyNutrition(DateTime date) {
    final dateOnly = DateTime(date.year, date.month, date.day);
    return isar.dailyNutritions
        .where()
        .dateEqualTo(dateOnly)
        .watch(fireImmediately: true)
        .map((list) => list.isEmpty ? null : list.first);
  }
  
  // Private helper to update daily nutrition totals
  Future<void> _updateDailyNutrition(DateTime date) async {
    final entries = await getFoodEntriesForDate(date);
    final dateOnly = DateTime(date.year, date.month, date.day);
    
    final existingDaily = await isar.dailyNutritions
        .where()
        .dateEqualTo(dateOnly)
        .findFirst();
    
    final daily = DailyNutrition.fromEntries(date, entries);
    if (existingDaily != null) {
      daily.id = existingDaily.id;
    }
    
    await isar.dailyNutritions.put(daily);
  }
}