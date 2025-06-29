import 'package:hive/hive.dart';
import 'food_entry.dart';
import 'measurement_unit.dart';

part 'meal_template.g.dart';

@HiveType(typeId: 2)
class MealTemplate extends HiveObject {
  @HiveField(0)
  String? id;
  
  @HiveField(1)
  String name = '';
  
  @HiveField(2)
  String description = '';
  
  @HiveField(3)
  double calories = 0.0;
  
  @HiveField(4)
  double protein = 0.0;
  
  @HiveField(5)
  double carbs = 0.0;
  
  @HiveField(6)
  double fat = 0.0;
  
  @HiveField(7)
  DateTime createdAt = DateTime.now();
  
  // Categorization
  @HiveField(8)
  MealType mealType = MealType.snack;
  
  @HiveField(9)
  List<FoodGroup> foodGroups = [];
  
  @HiveField(10)
  CuisineType cuisine = CuisineType.other;
  
  @HiveField(11)
  List<DietaryTag> dietaryTags = [];
  
  // Template metadata
  @HiveField(12)
  int usageCount = 0;
  
  @HiveField(13)
  DateTime? lastUsed;
  
  @HiveField(14)
  bool isFavorite = false;
  
  @HiveField(15)
  List<String> tags = [];
  
  // Food items in this template (traditional)
  @HiveField(16)
  List<TemplateItem> items = [];
  
  // v1.4: Portion-based template ingredients
  @HiveField(17)
  bool usePortions = false;
  
  @HiveField(18)
  List<TemplateIngredient> ingredients = [];
  
  @HiveField(19)
  int servings = 1;
  
  @HiveField(20)
  String? instructions;
  
  @HiveField(21)
  int? prepTimeMinutes;
  
  @HiveField(22)
  int? cookTimeMinutes;
  
  // Optional image for template
  @HiveField(23)
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

  // Create portion-based template from portions
  static MealTemplate fromPortions({
    required String name,
    required List<FoodPortion> portions,
    String? description,
    String? instructions,
    int servings = 1,
    int? prepTimeMinutes,
    int? cookTimeMinutes,
    MealType mealType = MealType.snack,
    List<FoodGroup> foodGroups = const [],
    CuisineType cuisine = CuisineType.other,
    List<DietaryTag> dietaryTags = const [],
    List<String> tags = const [],
  }) {
    final template = MealTemplate()
      ..name = name
      ..description = description ?? 'Portion-based meal template'
      ..createdAt = DateTime.now()
      ..usePortions = true
      ..servings = servings
      ..instructions = instructions
      ..prepTimeMinutes = prepTimeMinutes
      ..cookTimeMinutes = cookTimeMinutes
      ..mealType = mealType
      ..foodGroups = List.from(foodGroups)
      ..cuisine = cuisine
      ..dietaryTags = List.from(dietaryTags)
      ..tags = List.from(tags);

    // Convert FoodPortions to TemplateIngredients
    template.ingredients = portions.map((portion) => TemplateIngredient.fromFoodPortion(portion)).toList();

    // Calculate total nutrition (rough estimation)
    double totalCalories = 0;
    double totalProtein = 0;
    double totalCarbs = 0;
    double totalFat = 0;

    for (final portion in portions) {
      // These would come from a food database in a real implementation
      final weight = portion.effectiveGrams;
      totalCalories += weight * 1.5; // ~150 cal per 100g average
      totalProtein += weight * 0.1;  // ~10g protein per 100g average
      totalCarbs += weight * 0.2;    // ~20g carbs per 100g average
      totalFat += weight * 0.05;     // ~5g fat per 100g average
    }

    template.calories = totalCalories / servings;
    template.protein = totalProtein / servings;
    template.carbs = totalCarbs / servings;
    template.fat = totalFat / servings;

    return template;
  }

  // Convert template to food portions for specific serving size
  List<FoodPortion> toFoodPortions([int? targetServings]) {
    if (!usePortions) return [];
    
    final scale = targetServings != null ? targetServings / servings : 1.0;
    
    return ingredients.map((ingredient) {
      return FoodPortion.create(
        foodName: ingredient.name,
        quantity: ingredient.quantity * scale,
        unitId: ingredient.unitId,
        unitDisplayName: ingredient.unitDisplayName,
        estimatedGrams: ingredient.estimatedGrams * scale,
      );
    }).toList();
  }

  // Scale template for different serving sizes
  MealTemplate scaleForServings(int newServings) {
    if (!usePortions) return this;
    
    final scale = newServings / servings;
    final scaledTemplate = MealTemplate()
      ..name = '$name (${newServings} servings)'
      ..description = description
      ..calories = calories
      ..protein = protein
      ..carbs = carbs
      ..fat = fat
      ..createdAt = createdAt
      ..mealType = mealType
      ..foodGroups = List.from(foodGroups)
      ..cuisine = cuisine
      ..dietaryTags = List.from(dietaryTags)
      ..tags = List.from(tags)
      ..usePortions = usePortions
      ..servings = newServings
      ..instructions = instructions
      ..prepTimeMinutes = prepTimeMinutes
      ..cookTimeMinutes = cookTimeMinutes
      ..ingredients = ingredients.map((ingredient) => ingredient.scale(scale)).toList();

    return scaledTemplate;
  }

  // Get total cooking time
  int? get totalTimeMinutes {
    if (prepTimeMinutes == null && cookTimeMinutes == null) return null;
    return (prepTimeMinutes ?? 0) + (cookTimeMinutes ?? 0);
  }

  // Get nutrition per serving for portion-based templates
  double get caloriesPerServing => usePortions ? calories : calories / servings;
  double get proteinPerServing => usePortions ? protein : protein / servings;
  double get carbsPerServing => usePortions ? carbs : carbs / servings;
  double get fatPerServing => usePortions ? fat : fat / servings;
}

@HiveType(typeId: 26)
class TemplateItem extends HiveObject {
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
  double multiplier = 1.0; // For portion adjustments
  
  @HiveField(7)
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

@HiveType(typeId: 27)
class TemplateIngredient extends HiveObject {
  @HiveField(0)
  String name = '';
  
  @HiveField(1)
  double quantity = 0.0;
  
  @HiveField(2)
  String unitId = '';
  
  @HiveField(3)
  String unitDisplayName = '';
  
  @HiveField(4)
  double estimatedGrams = 0.0;
  
  // Optional ingredient properties
  @HiveField(5)
  String? notes; // "optional", "to taste", etc.
  
  @HiveField(6)
  bool isOptional = false;
  
  @HiveField(7)
  String? substitutions; // alternative ingredients
  
  TemplateIngredient();
  
  factory TemplateIngredient.fromFoodPortion(FoodPortion portion) {
    return TemplateIngredient()
      ..name = portion.foodName
      ..quantity = portion.quantity
      ..unitId = portion.unitId
      ..unitDisplayName = portion.unitDisplayName
      ..estimatedGrams = portion.estimatedGrams ?? portion.effectiveGrams
      ..notes = null
      ..isOptional = false
      ..substitutions = null;
  }
  
  factory TemplateIngredient.create({
    required String name,
    required double quantity,
    required String unitId,
    required String unitDisplayName,
    required double estimatedGrams,
    String? notes,
    bool isOptional = false,
    String? substitutions,
  }) {
    return TemplateIngredient()
      ..name = name
      ..quantity = quantity
      ..unitId = unitId
      ..unitDisplayName = unitDisplayName
      ..estimatedGrams = estimatedGrams
      ..notes = notes
      ..isOptional = isOptional
      ..substitutions = substitutions;
  }
  
  // Scale ingredient for different serving sizes
  TemplateIngredient scale(double factor) {
    return TemplateIngredient.create(
      name: name,
      quantity: quantity * factor,
      unitId: unitId,
      unitDisplayName: unitDisplayName,
      estimatedGrams: estimatedGrams * factor,
      notes: notes,
      isOptional: isOptional,
      substitutions: substitutions,
    );
  }
  
  String get formattedQuantity {
    if (quantity == quantity.roundToDouble()) {
      return quantity.toInt().toString();
    } else if (quantity < 1) {
      // Show as fraction for quantities less than 1
      final numerator = (quantity * 4).round();
      if (numerator <= 4) {
        switch (numerator) {
          case 1: return '1/4';
          case 2: return '1/2';
          case 3: return '3/4';
          default: return quantity.toStringAsFixed(2);
        }
      }
    }
    return quantity.toStringAsFixed(1);
  }
  
  String get displayText {
    final baseText = '$formattedQuantity $unitDisplayName $name';
    if (notes != null) {
      return '$baseText ($notes)';
    }
    return baseText;
  }
}