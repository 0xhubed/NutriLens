import 'package:isar/isar.dart';

part 'food_entry.g.dart';

enum MealType {
  breakfast,
  lunch,
  dinner,
  snack,
}

enum FoodGroup {
  proteins,
  grains,
  vegetables,
  fruits,
  dairy,
  fats,
  other,
}

enum CuisineType {
  italian,
  asian,
  american,
  mexican,
  indian,
  mediterranean,
  other,
}

enum DietaryTag {
  vegetarian,
  vegan,
  glutenFree,
  ketoFriendly,
  lowCarb,
  highProtein,
  none,
}

@collection
class FoodEntry {
  Id id = Isar.autoIncrement;
  
  late String name;
  late String imageBase64;
  late double calories;
  late double protein;
  late double carbs;
  late double fat;
  late DateTime timestamp;
  
  // Optional fields
  String? notes;
  
  // New categorization fields
  @enumerated
  MealType mealType = MealType.snack;
  
  @enumerated
  List<FoodGroup> foodGroups = [];
  
  @enumerated
  CuisineType cuisine = CuisineType.other;
  
  @enumerated
  List<DietaryTag> dietaryTags = [];
  
  String? portionSize;
  String? cookingMethod;
  
  // Enhanced detection fields
  List<DetectedFoodItem> detectedItems = [];
  
  String? aiProvider; // Which provider was used for analysis
  
  // Computed property for total macros
  double get totalMacros => protein + carbs + fat;
  
  // Helper methods for categorization
  bool hasTag(DietaryTag tag) => dietaryTags.contains(tag);
  bool hasFoodGroup(FoodGroup group) => foodGroups.contains(group);
  
  // Smart meal type suggestion based on time
  static MealType suggestMealTypeByTime(DateTime time) {
    final hour = time.hour;
    if (hour >= 5 && hour < 11) return MealType.breakfast;
    if (hour >= 11 && hour < 16) return MealType.lunch;
    if (hour >= 16 && hour < 21) return MealType.dinner;
    return MealType.snack;
  }
}

class FoodItem {
  final String name;
  final double calories;
  final double protein;
  final double carbs;
  final double fat;
  final String? portion;

  FoodItem({
    required this.name,
    required this.calories,
    required this.protein,
    required this.carbs,
    required this.fat,
    this.portion,
  });

  factory FoodItem.fromJson(Map<String, dynamic> json) {
    return FoodItem(
      name: json['name'] ?? 'Unknown',
      calories: (json['calories'] ?? 0).toDouble(),
      protein: (json['protein'] ?? 0).toDouble(),
      carbs: (json['carbs'] ?? 0).toDouble(),
      fat: (json['fat'] ?? 0).toDouble(),
      portion: json['portion'],
    );
  }
}

@embedded
class DetectedFoodItem {
  late String name;
  late double calories;
  late double protein;
  late double carbs;
  late double fat;
  String? portion;
  
  DetectedFoodItem();
  
  DetectedFoodItem.fromFoodItem(FoodItem item) {
    name = item.name;
    calories = item.calories;
    protein = item.protein;
    carbs = item.carbs;
    fat = item.fat;
    portion = item.portion;
  }
}