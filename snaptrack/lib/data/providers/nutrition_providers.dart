import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/daily_nutrition.dart';
import '../models/food_entry.dart';
import '../services/database_service.dart';

// Provider for today's nutrition
final todayNutritionProvider = StreamProvider<DailyNutrition?>((ref) {
  final dbService = ref.watch(databaseServiceProvider);
  return dbService.watchDailyNutrition(DateTime.now());
});

// Provider for all food entries
final foodEntriesProvider = StreamProvider<List<FoodEntry>>((ref) {
  final dbService = ref.watch(databaseServiceProvider);
  return dbService.watchFoodEntries();
});

// Provider for food entries by date
final foodEntriesByDateProvider = FutureProvider.family<List<FoodEntry>, DateTime>((ref, date) async {
  final dbService = ref.watch(databaseServiceProvider);
  return await dbService.getFoodEntriesForDate(date);
});

// Provider for nutrition repository
final nutritionRepositoryProvider = Provider<NutritionRepository>((ref) {
  final dbService = ref.watch(databaseServiceProvider);
  return NutritionRepository(dbService);
});

class NutritionRepository {
  final DatabaseService _dbService;
  
  NutritionRepository(this._dbService);
  
  // Expose database service for template service
  DatabaseService get databaseService => _dbService;
  
  Future<List<FoodEntry>> getEntriesInDateRange(DateTime start, DateTime end) async {
    // Collect entries day by day using existing method
    final List<FoodEntry> allEntries = [];
    DateTime currentDate = start;
    
    while (currentDate.isBefore(end)) {
      final dayEntries = await _dbService.getFoodEntriesForDate(currentDate);
      allEntries.addAll(dayEntries);
      currentDate = currentDate.add(const Duration(days: 1));
    }
    
    return allEntries;
  }
}