import 'package:isar/isar.dart';
import 'food_entry.dart';

part 'meal_template.g.dart';

@collection
class MealTemplate {
  Id id = Isar.autoIncrement;
  
  late String name;
  late String description;
  late double calories;
  late double protein;
  late double carbs;
  late double fat;
  late DateTime createdAt;
  
  // Categorization
  @enumerated
  MealType mealType = MealType.snack;
  
  @enumerated
  List<FoodGroup> foodGroups = [];
  
  @enumerated
  CuisineType cuisine = CuisineType.other;
  
  @enumerated
  List<DietaryTag> dietaryTags = [];
  
  // Template metadata
  int usageCount = 0;
  DateTime? lastUsed;
  bool isFavorite = false;
  List<String> tags = [];
  
  // Food items in this template
  List<TemplateItem> items = [];
  
  // Optional image for template
  String? imageBase64;
  
  // Computed properties
  double get totalMacros => protein + carbs + fat;
  
  // Helper methods
  bool hasTag(DietaryTag tag) => dietaryTags.contains(tag);
  bool hasFoodGroup(FoodGroup group) => foodGroups.contains(group);
  
  void incrementUsage() {
    usageCount++;
    lastUsed = DateTime.now();
  }
  
  // Create template from food entry
  static MealTemplate fromFoodEntry(FoodEntry entry, {String? customName}) {
    final template = MealTemplate()
      ..name = customName ?? entry.name
      ..description = 'Created from ${entry.name}'
      ..calories = entry.calories
      ..protein = entry.protein
      ..carbs = entry.carbs
      ..fat = entry.fat
      ..createdAt = DateTime.now()
      ..mealType = entry.mealType
      ..foodGroups = List.from(entry.foodGroups)
      ..cuisine = entry.cuisine
      ..dietaryTags = List.from(entry.dietaryTags)
      ..imageBase64 = entry.imageBase64;
    
    // Convert detected items to template items
    template.items = entry.detectedItems
        .map((item) => TemplateItem.fromDetectedItem(item))
        .toList();
    
    // If no detected items, create one from the main entry
    if (template.items.isEmpty) {
      template.items = [
        TemplateItem()
          ..name = entry.name
          ..calories = entry.calories
          ..protein = entry.protein
          ..carbs = entry.carbs
          ..fat = entry.fat
          ..portion = entry.portionSize ?? 'Standard'
          ..isAdjustable = true
      ];
    }
    
    return template;
  }
}

@embedded
class TemplateItem {
  late String name;
  late double calories;
  late double protein;
  late double carbs;
  late double fat;
  String? portion;
  double multiplier = 1.0; // For portion adjustments
  bool isAdjustable = true; // Can user adjust this item's quantity?
  
  TemplateItem();
  
  TemplateItem.fromDetectedItem(DetectedFoodItem item) {
    name = item.name;
    calories = item.calories;
    protein = item.protein;
    carbs = item.carbs;
    fat = item.fat;
    portion = item.portion;
    multiplier = 1.0;
    isAdjustable = true;
  }
  
  // Get adjusted values based on multiplier
  double get adjustedCalories => calories * multiplier;
  double get adjustedProtein => protein * multiplier;
  double get adjustedCarbs => carbs * multiplier;
  double get adjustedFat => fat * multiplier;
}