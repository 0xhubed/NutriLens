import 'package:hive/hive.dart';
import 'measurement_unit.dart';

part 'food_entry.g.dart';

@HiveType(typeId: 30)
enum MealType {
  @HiveField(0)
  breakfast,
  @HiveField(1)
  lunch,
  @HiveField(2)
  dinner,
  @HiveField(3)
  snack,
}

@HiveType(typeId: 31)
enum FoodGroup {
  @HiveField(0)
  proteins,
  @HiveField(1)
  grains,
  @HiveField(2)
  vegetables,
  @HiveField(3)
  fruits,
  @HiveField(4)
  dairy,
  @HiveField(5)
  fats,
  @HiveField(6)
  other,
}

@HiveType(typeId: 32)
enum CuisineType {
  @HiveField(0)
  italian,
  @HiveField(1)
  asian,
  @HiveField(2)
  american,
  @HiveField(3)
  mexican,
  @HiveField(4)
  indian,
  @HiveField(5)
  mediterranean,
  @HiveField(6)
  other,
}

@HiveType(typeId: 33)
enum DietaryTag {
  @HiveField(0)
  vegetarian,
  @HiveField(1)
  vegan,
  @HiveField(2)
  glutenFree,
  @HiveField(3)
  ketoFriendly,
  @HiveField(4)
  lowCarb,
  @HiveField(5)
  highProtein,
  @HiveField(6)
  none,
}

@HiveType(typeId: 0)
class FoodEntry extends HiveObject {
  @HiveField(0)
  String? id;
  
  @HiveField(1)
  String name = '';
  
  @HiveField(2)
  String imageBase64 = '';
  
  @HiveField(3)
  double calories = 0.0;
  
  @HiveField(4)
  double protein = 0.0;
  
  @HiveField(5)
  double carbs = 0.0;
  
  @HiveField(6)
  double fat = 0.0;
  
  @HiveField(7)
  DateTime timestamp = DateTime.now();
  
  // Weight information
  @HiveField(8)
  double? estimatedWeight; // in grams
  
  @HiveField(9)
  double? userWeight; // user-provided weight in grams
  
  double get actualWeight => userWeight ?? estimatedWeight ?? 100.0; // fallback to 100g
  
  // Optional fields
  @HiveField(10)
  String? notes;
  
  // New categorization fields
  @HiveField(11)
  MealType mealType = MealType.snack;
  
  @HiveField(12)
  List<FoodGroup> foodGroups = [];
  
  @HiveField(13)
  CuisineType cuisine = CuisineType.other;
  
  @HiveField(14)
  List<DietaryTag> dietaryTags = [];
  
  @HiveField(15)
  String? portionSize;
  
  @HiveField(16)
  String? cookingMethod;
  
  // Enhanced detection fields
  @HiveField(17)
  List<DetectedFoodItem> detectedItems = [];
  
  @HiveField(18)
  String? aiProvider; // Which provider was used for analysis
  
  // v1.4: Measurement Units and Portions Support
  @HiveField(19)
  bool usePortions = false; // Flag to indicate if using portion-based input
  
  @HiveField(20)
  List<FoodPortion> portions = []; // List of food portions with units
  
  // Backward compatibility - computed from portions when usePortions = true
  double get totalPortionWeight {
    if (!usePortions || portions.isEmpty) return actualWeight;
    return portions.fold(0.0, (sum, portion) => sum + portion.effectiveGrams);
  }
  
  // Computed nutrition from portions
  double get portionCalories {
    if (!usePortions) return calories;
    return portions.fold(0.0, (sum, portion) => sum + portion.calories);
  }
  
  double get portionProtein {
    if (!usePortions) return protein;
    return portions.fold(0.0, (sum, portion) => sum + portion.protein);
  }
  
  double get portionCarbs {
    if (!usePortions) return carbs;
    return portions.fold(0.0, (sum, portion) => sum + portion.carbs);
  }
  
  double get portionFat {
    if (!usePortions) return fat;
    return portions.fold(0.0, (sum, portion) => sum + portion.fat);
  }
  
  // Effective values (use portions if available, fallback to traditional)
  double get effectiveCalories => usePortions ? portionCalories : calories;
  double get effectiveProtein => usePortions ? portionProtein : protein;
  double get effectiveCarbs => usePortions ? portionCarbs : carbs;
  double get effectiveFat => usePortions ? portionFat : fat;
  double get effectiveWeight => usePortions ? totalPortionWeight : actualWeight;
  
  // Computed property for total macros
  double get totalMacros => effectiveProtein + effectiveCarbs + effectiveFat;
  
  // Helper methods for portions
  void addPortion(FoodPortion portion) {
    portions.add(portion);
    if (!usePortions) usePortions = true;
  }
  
  void removePortion(int index) {
    if (index >= 0 && index < portions.length) {
      portions.removeAt(index);
      if (portions.isEmpty) usePortions = false;
    }
  }
  
  void clearPortions() {
    portions.clear();
    usePortions = false;
  }
  
  String get portionSummary {
    if (!usePortions || portions.isEmpty) {
      return '${actualWeight.toStringAsFixed(0)}g';
    }
    
    if (portions.length == 1) {
      return portions.first.formattedQuantity;
    }
    
    return '${portions.length} items (${totalPortionWeight.toStringAsFixed(0)}g)';
  }
  
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
  final double? weight; // in grams

  FoodItem({
    required this.name,
    required this.calories,
    required this.protein,
    required this.carbs,
    required this.fat,
    this.portion,
    this.weight,
  });

  factory FoodItem.fromJson(Map<String, dynamic> json) {
    return FoodItem(
      name: json['name'] ?? 'Unknown',
      calories: (json['calories'] ?? 0).toDouble(),
      protein: (json['protein'] ?? 0).toDouble(),
      carbs: (json['carbs'] ?? 0).toDouble(),
      fat: (json['fat'] ?? 0).toDouble(),
      portion: json['portion'],
      weight: json['estimatedWeight'] != null ? (json['estimatedWeight'] as num).toDouble() : null,
    );
  }
}

@HiveType(typeId: 21)
class DetectedFoodItem extends HiveObject {
  @HiveField(0)
  String name = '';
  
  @HiveField(1)
  double calories = 0.0;
  
  @HiveField(2)
  double protein = 0.0;
  
  @HiveField(3)
  double carbs = 0.0;
  
  @HiveField(4)
  double fat = 0.0;
  
  @HiveField(5)
  String? portion;
  
  @HiveField(6)
  double? weight; // in grams
  
  DetectedFoodItem();
  
  DetectedFoodItem.fromFoodItem(FoodItem item) {
    name = item.name;
    calories = item.calories;
    protein = item.protein;
    carbs = item.carbs;
    fat = item.fat;
    portion = item.portion;
    weight = item.weight;
  }
}