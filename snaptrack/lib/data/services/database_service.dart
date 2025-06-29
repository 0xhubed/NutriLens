import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

import '../models/daily_nutrition.dart';
import '../models/food_entry.dart';

final databaseServiceProvider = Provider<DatabaseService>((ref) {
  throw UnimplementedError('Must be overridden in main.dart');
});

class DatabaseService {
  // Box getters
  Box<FoodEntry> get _foodBox => Hive.box<FoodEntry>('foodEntries');
  Box<DailyNutrition> get _dailyBox => Hive.box<DailyNutrition>('dailyNutrition');
  
  DatabaseService() {
    // Run migration and recalculation on startup
    _initializeService();
  }
  
  Future<void> _initializeService() async {
    print('🚀 DatabaseService: Initializing service...');
    print('🚀 DatabaseService: Food box length: ${_foodBox.length}');
    print('🚀 DatabaseService: Daily nutrition box length: ${_dailyBox.length}');
    
    // Debug: List all existing food entries
    final allEntries = _foodBox.values.toList();
    print('🚀 DatabaseService: All food entries (${allEntries.length}):');
    for (final entry in allEntries) {
      print('🚀   - "${entry.name}" (${entry.effectiveCalories} cal) at ${entry.timestamp}');
    }
    
    // Debug: List all daily nutrition entries
    final allDaily = _dailyBox.values.toList();
    print('🚀 DatabaseService: All daily nutrition entries (${allDaily.length}):');
    for (final daily in allDaily) {
      print('🚀   - ${daily.id}: ${daily.totalCalories} cal on ${daily.date}');
    }
    
    await _migrateOldDateKeys();
    
    // Force rebuild all daily nutrition data from food entries
    await _rebuildAllDailyNutrition();
  }
  
  // Force rebuild all daily nutrition from existing food entries
  Future<void> _rebuildAllDailyNutrition() async {
    print('🔧 DatabaseService: Rebuilding all daily nutrition data...');
    
    // Get all food entries and group by date
    final allEntries = _foodBox.values.toList();
    final entriesByDate = <String, List<FoodEntry>>{};
    
    for (final entry in allEntries) {
      final dateKey = _generateDateKey(entry.timestamp);
      entriesByDate[dateKey] ??= [];
      entriesByDate[dateKey]!.add(entry);
    }
    
    print('🔧 DatabaseService: Found entries for ${entriesByDate.length} different dates');
    
    // Rebuild daily nutrition for each date
    for (final dateKey in entriesByDate.keys) {
      final entries = entriesByDate[dateKey]!;
      final date = entries.first.timestamp; // Use first entry's timestamp for the date
      
      final daily = DailyNutrition.fromEntries(date, entries);
      daily.id = dateKey;
      
      await _dailyBox.put(dateKey, daily);
      print('🔧 DatabaseService: Rebuilt $dateKey: ${daily.totalCalories} cal from ${entries.length} entries');
    }
    
    print('🔧 DatabaseService: Daily nutrition rebuild complete!');
  }
  
  // Food Entry operations
  Future<void> saveFoodEntry(FoodEntry entry) async {
    print('💾 DatabaseService: Starting to save food entry...');
    // Generate ID if not present
    entry.id ??= DateTime.now().millisecondsSinceEpoch.toString();
    print('💾 DatabaseService: Generated ID: ${entry.id}');
    
    print('💾 DatabaseService: Box name: ${_foodBox.name}, Box length before: ${_foodBox.length}');
    await _foodBox.put(entry.id, entry);
    print('💾 DatabaseService: Successfully put entry in box, Box length after: ${_foodBox.length}');
    
    await _updateDailyNutrition(entry.timestamp);
    print('💾 DatabaseService: Updated daily nutrition, Save complete!');
  }
  
  Future<void> deleteFoodEntry(String id) async {
    final entry = _foodBox.get(id);
    if (entry != null) {
      await _foodBox.delete(id);
      await _updateDailyNutrition(entry.timestamp);
    }
  }

  Future<void> updateFoodEntry(FoodEntry updatedEntry) async {
    if (updatedEntry.id == null) return;
    
    final oldEntry = _foodBox.get(updatedEntry.id);
    await _foodBox.put(updatedEntry.id, updatedEntry);
    
    // Update daily nutrition for both old and new dates in case date changed
    await _updateDailyNutrition(updatedEntry.timestamp);
    if (oldEntry != null && !_isSameDay(oldEntry.timestamp, updatedEntry.timestamp)) {
      await _updateDailyNutrition(oldEntry.timestamp);
    }
  }
  
  Future<List<FoodEntry>> getFoodEntriesForDate(DateTime date) async {
    final startOfDay = DateTime(date.year, date.month, date.day);
    final endOfDay = startOfDay.add(const Duration(days: 1));
    
    return _foodBox.values
        .where((entry) =>
            entry.timestamp.isAfter(startOfDay) &&
            entry.timestamp.isBefore(endOfDay))
        .toList()
      ..sort((a, b) => b.timestamp.compareTo(a.timestamp));
  }
  
  Stream<List<FoodEntry>> watchFoodEntries() {
    // Return a stream that emits when the box changes
    print('📡 DatabaseService: Setting up watchFoodEntries stream...');
    
    // Use Stream.periodic as fallback if Hive watch is not working
    return Stream.periodic(Duration(milliseconds: 500)).map((_) {
      print('📡 DatabaseService: Periodic check - Box length: ${_foodBox.length}');
      final entries = _foodBox.values.toList()
        ..sort((a, b) => b.timestamp.compareTo(a.timestamp));
      print('📡 DatabaseService: Returning ${entries.length} entries');
      return entries;
    }).distinct((prev, next) => prev.length == next.length && 
      (prev.isEmpty || next.isEmpty || prev.first.id == next.first.id));
  }
  
  Future<List<FoodEntry>> getFoodEntriesInRange(DateTime startDate, DateTime endDate) async {
    print('📊 DatabaseService: getFoodEntriesInRange from $startDate to $endDate');
    final entries = _foodBox.values
        .where((entry) =>
            entry.timestamp.isAtSameMomentAs(startDate) ||
            entry.timestamp.isAtSameMomentAs(endDate) ||
            (entry.timestamp.isAfter(startDate) && entry.timestamp.isBefore(endDate)))
        .toList()
      ..sort((a, b) => a.timestamp.compareTo(b.timestamp));
    print('📊 DatabaseService: Found ${entries.length} entries in range');
    for (final entry in entries) {
      print('📊 DatabaseService: Entry "${entry.name}" at ${entry.timestamp}');
    }
    return entries;
  }
  
  Stream<List<FoodEntry>> watchFoodEntriesInRange(DateTime startDate, DateTime endDate) {
    print('📊 DatabaseService: Setting up watchFoodEntriesInRange stream...');
    
    // Use periodic polling as workaround for Hive watch issues
    return Stream.periodic(Duration(milliseconds: 500)).map((_) {
      final entries = _foodBox.values
          .where((entry) =>
              entry.timestamp.isAtSameMomentAs(startDate) ||
              entry.timestamp.isAtSameMomentAs(endDate) ||
              (entry.timestamp.isAfter(startDate) && entry.timestamp.isBefore(endDate)))
          .toList()
        ..sort((a, b) => a.timestamp.compareTo(b.timestamp));
      print('📊 DatabaseService: Range entries check: ${entries.length} entries');
      return entries;
    }).distinct((prev, next) => prev.length == next.length && 
      (prev.isEmpty || next.isEmpty || prev.first.id == next.first.id));
  }
  
  // Daily Nutrition operations
  Future<DailyNutrition?> getDailyNutrition(DateTime date) async {
    final dateOnly = DateTime(date.year, date.month, date.day);
    final key = _generateDateKey(dateOnly);
    return _dailyBox.get(key);
  }
  
  Stream<DailyNutrition?> watchDailyNutrition(DateTime date) {
    final dateOnly = DateTime(date.year, date.month, date.day);
    final key = _generateDateKey(dateOnly);
    
    print('📊 DatabaseService: Setting up watchDailyNutrition stream for $key...');
    print('📊 DatabaseService: All daily box keys: ${_dailyBox.keys.toList()}');
    
    // Use periodic polling as workaround for Hive watch issues
    return Stream.periodic(Duration(milliseconds: 500)).map((_) {
      final nutrition = _dailyBox.get(key);
      print('📊 DatabaseService: Daily nutrition check for $key: ${nutrition?.totalCalories ?? 0} cal');
      if (nutrition == null) {
        print('📊 DatabaseService: No nutrition found for key $key, available keys: ${_dailyBox.keys.toList()}');
      }
      return nutrition;
    }).distinct((prev, next) => 
      (prev?.totalCalories ?? 0) == (next?.totalCalories ?? 0) &&
      (prev?.totalProtein ?? 0) == (next?.totalProtein ?? 0) &&
      (prev?.totalCarbs ?? 0) == (next?.totalCarbs ?? 0) &&
      (prev?.totalFat ?? 0) == (next?.totalFat ?? 0)
    );
  }
  
  // Public method to manually recalculate daily nutrition for a specific date
  Future<void> recalculateDailyNutrition(DateTime date) async {
    print('🔧 DatabaseService: Manually recalculating daily nutrition for $date');
    await _updateDailyNutrition(date);
  }
  
  // Private helper to update daily nutrition totals
  Future<void> _updateDailyNutrition(DateTime date) async {
    print('🧮 DatabaseService: Updating daily nutrition for $date');
    final entries = await getFoodEntriesForDate(date);
    print('🧮 DatabaseService: Found ${entries.length} entries for date');
    for (final entry in entries) {
      print('🧮 DatabaseService: Entry "${entry.name}": ${entry.effectiveCalories} cal');
    }
    
    final dateOnly = DateTime(date.year, date.month, date.day);
    final key = _generateDateKey(dateOnly);
    
    final daily = DailyNutrition.fromEntries(date, entries);
    daily.id = key;
    
    print('🧮 DatabaseService: Created daily nutrition - ${daily.totalCalories} cal, ${daily.mealCount} meals');
    print('🧮 DatabaseService: Saving to key: $key');
    
    await _dailyBox.put(key, daily);
    
    // Verify it was saved
    final saved = _dailyBox.get(key);
    print('🧮 DatabaseService: Verified saved daily nutrition: ${saved?.totalCalories ?? "null"} cal');
  }
  
  // Helper method to generate consistent date keys
  String _generateDateKey(DateTime date) {
    final dateOnly = DateTime(date.year, date.month, date.day);
    return '${dateOnly.year}-${dateOnly.month.toString().padLeft(2, '0')}-${dateOnly.day.toString().padLeft(2, '0')}';
  }
  
  // Migration helper: Check for old format keys and migrate them
  Future<void> _migrateOldDateKeys() async {
    print('🔄 DatabaseService: Checking for old date key format migration...');
    final oldKeys = _dailyBox.keys.where((key) => key.toString().contains(RegExp(r'\d{4}-\d{1,2}-\d{1,2}'))).toList();
    
    for (final oldKey in oldKeys) {
      final parts = oldKey.toString().split('-');
      if (parts.length == 3) {
        final year = parts[0];
        final month = parts[1].padLeft(2, '0');
        final day = parts[2].padLeft(2, '0');
        final newKey = '$year-$month-$day';
        
        if (oldKey != newKey) {
          print('🔄 DatabaseService: Migrating $oldKey → $newKey');
          final nutrition = _dailyBox.get(oldKey);
          if (nutrition != null) {
            nutrition.id = newKey;
            await _dailyBox.put(newKey, nutrition);
            await _dailyBox.delete(oldKey);
          }
        }
      }
    }
  }

  bool _isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
           date1.month == date2.month &&
           date1.day == date2.day;
  }
}