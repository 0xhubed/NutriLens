import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/german_food_database.dart';

/// Provider for accessing German food database
final germanFoodDatabaseProvider = Provider<GermanFoodDatabase>((ref) {
  return GermanFoodDatabase();
});

/// Provider for searching German foods
final germanFoodSearchProvider = Provider.family<List<GermanFoodItem>, String>((ref, query) {
  if (query.trim().isEmpty) {
    return GermanFoodDatabase.getCommonGermanFoods().take(10).toList();
  }
  return GermanFoodDatabase.searchFoods(query);
});

/// Provider for getting all common German foods
final commonGermanFoodsProvider = Provider<List<GermanFoodItem>>((ref) {
  return GermanFoodDatabase.getCommonGermanFoods();
});