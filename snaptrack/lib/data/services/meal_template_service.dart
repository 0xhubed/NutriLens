import 'package:isar/isar.dart';
import '../models/meal_template.dart';
import '../models/food_entry.dart';
import '../models/measurement_unit.dart';

class MealTemplateService {
  final Isar isar;

  MealTemplateService(this.isar);

  /// Save a meal template
  Future<void> saveTemplate(MealTemplate template) async {
    await isar.writeTxn(() async {
      await isar.mealTemplates.put(template);
    });
  }

  /// Get all templates
  Future<List<MealTemplate>> getAllTemplates() async {
    return await isar.mealTemplates.where().findAll();
  }

  /// Get templates by category
  Future<List<MealTemplate>> getTemplatesByCategory(MealType category) async {
    return await isar.mealTemplates
        .filter()
        .mealTypeEqualTo(category)
        .findAll();
  }

  /// Get recent templates
  Future<List<MealTemplate>> getRecentTemplates({int limit = 10}) async {
    return await isar.mealTemplates
        .where()
        .sortByLastUsedDesc()
        .limit(limit)
        .findAll();
  }

  /// Get popular templates
  Future<List<MealTemplate>> getPopularTemplates({int limit = 10}) async {
    return await isar.mealTemplates
        .where()
        .sortByUsageCountDesc()
        .limit(limit)
        .findAll();
  }

  /// Get favorite templates
  Future<List<MealTemplate>> getFavoriteTemplates() async {
    return await isar.mealTemplates
        .filter()
        .isFavoriteEqualTo(true)
        .findAll();
  }

  /// Search templates
  Future<List<MealTemplate>> searchTemplates(String query) async {
    final lowerQuery = query.toLowerCase();
    
    return await isar.mealTemplates
        .filter()
        .nameContains(query, caseSensitive: false)
        .or()
        .descriptionContains(query, caseSensitive: false)
        .or()
        .tagsElementContains(lowerQuery)
        .findAll();
  }

  /// Get templates with specific dietary tags
  Future<List<MealTemplate>> getTemplatesByDietaryTags(List<DietaryTag> tags) async {
    var query = isar.mealTemplates.filter();
    
    for (final tag in tags) {
      query = query.dietaryTagsElementEqualTo(tag);
    }
    
    return await query.findAll();
  }

  /// Toggle favorite status
  Future<void> toggleFavorite(int templateId) async {
    await isar.writeTxn(() async {
      final template = await isar.mealTemplates.get(templateId);
      if (template != null) {
        template.isFavorite = !template.isFavorite;
        await isar.mealTemplates.put(template);
      }
    });
  }

  /// Mark template as used
  Future<void> markAsUsed(int templateId) async {
    await isar.writeTxn(() async {
      final template = await isar.mealTemplates.get(templateId);
      if (template != null) {
        template.incrementUsage();
        await isar.mealTemplates.put(template);
      }
    });
  }

  /// Delete template
  Future<void> deleteTemplate(int templateId) async {
    await isar.writeTxn(() async {
      await isar.mealTemplates.delete(templateId);
    });
  }

  /// Create template from food entry
  Future<MealTemplate> createTemplateFromFoodEntry(
    FoodEntry entry, {
    String? customName,
    String? instructions,
    int? prepTimeMinutes,
    int? cookTimeMinutes,
  }) async {
    MealTemplate template;
    
    if (entry.usePortions && entry.portions.isNotEmpty) {
      // Create portion-based template
      template = MealTemplate.fromPortions(
        name: customName ?? entry.name,
        portions: entry.portions,
        description: 'Created from ${entry.name}',
        instructions: instructions,
        servings: 1,
        prepTimeMinutes: prepTimeMinutes,
        cookTimeMinutes: cookTimeMinutes,
        mealType: entry.mealType,
        foodGroups: entry.foodGroups,
        cuisine: entry.cuisine,
        dietaryTags: entry.dietaryTags,
      );
    } else {
      // Create traditional template
      template = MealTemplate.fromFoodEntry(entry, customName: customName);
      template.instructions = instructions;
      template.prepTimeMinutes = prepTimeMinutes;
      template.cookTimeMinutes = cookTimeMinutes;
    }
    
    await saveTemplate(template);
    return template;
  }

  /// Create food entry from template
  Future<FoodEntry> createFoodEntryFromTemplate(
    MealTemplate template, {
    int? servings,
    DateTime? timestamp,
  }) async {
    await markAsUsed(template.id);
    
    final targetServings = servings ?? template.servings;
    final entry = FoodEntry()
      ..name = template.name
      ..timestamp = timestamp ?? DateTime.now()
      ..mealType = template.mealType
      ..foodGroups = List.from(template.foodGroups)
      ..cuisine = template.cuisine
      ..dietaryTags = List.from(template.dietaryTags)
      ..imageBase64 = template.imageBase64 ?? '';

    if (template.usePortions && template.ingredients.isNotEmpty) {
      // Create portion-based entry
      final portions = template.toFoodPortions(targetServings);
      
      entry.usePortions = true;
      entry.portions = portions;
      
      // Calculate nutrition from portions (simplified)
      double totalCalories = template.calories * (targetServings / template.servings);
      double totalProtein = template.protein * (targetServings / template.servings);
      double totalCarbs = template.carbs * (targetServings / template.servings);
      double totalFat = template.fat * (targetServings / template.servings);
      
      entry.calories = totalCalories;
      entry.protein = totalProtein;
      entry.carbs = totalCarbs;
      entry.fat = totalFat;
    } else {
      // Create traditional entry
      final scale = targetServings / template.servings;
      
      entry.calories = template.calories * scale;
      entry.protein = template.protein * scale;
      entry.carbs = template.carbs * scale;
      entry.fat = template.fat * scale;
      entry.usePortions = false;
      entry.portions = [];
      
      // Scale template items
      entry.detectedItems = template.items.map((item) {
        return DetectedFoodItem()
          ..name = item.name
          ..calories = item.adjustedCalories * scale
          ..protein = item.adjustedProtein * scale
          ..carbs = item.adjustedCarbs * scale
          ..fat = item.adjustedFat * scale
          ..portion = item.portion;
      }).toList();
    }
    
    return entry;
  }

  /// Get predefined templates
  Future<void> seedPredefinedTemplates() async {
    final existingCount = await isar.mealTemplates.count();
    if (existingCount > 0) return; // Already seeded
    
    final templates = _getPredefinedTemplates();
    
    await isar.writeTxn(() async {
      await isar.mealTemplates.putAll(templates);
    });
  }

  List<MealTemplate> _getPredefinedTemplates() {
    return [
      // Breakfast templates
      MealTemplate.fromPortions(
        name: 'Protein Smoothie',
        portions: [
          FoodPortion.create(
            foodName: 'Protein Powder',
            quantity: 1.0,
            unitId: 'scoop',
            unitDisplayName: 'scoop',
            estimatedGrams: 30.0,
          ),
          FoodPortion.create(
            foodName: 'Banana',
            quantity: 1.0,
            unitId: 'piece_medium',
            unitDisplayName: 'medium',
            estimatedGrams: 120.0,
          ),
          FoodPortion.create(
            foodName: 'Almond Milk',
            quantity: 1.0,
            unitId: 'cup',
            unitDisplayName: 'cup',
            estimatedGrams: 240.0,
          ),
          FoodPortion.create(
            foodName: 'Spinach',
            quantity: 1.0,
            unitId: 'handful',
            unitDisplayName: 'handful',
            estimatedGrams: 30.0,
          ),
        ],
        description: 'High-protein smoothie perfect for post-workout',
        instructions: '1. Add all ingredients to blender\n2. Blend until smooth\n3. Serve immediately',
        servings: 1,
        prepTimeMinutes: 5,
        mealType: MealType.breakfast,
        foodGroups: [FoodGroup.proteins, FoodGroup.fruits, FoodGroup.vegetables],
        dietaryTags: [DietaryTag.highProtein, DietaryTag.vegetarian],
        tags: ['smoothie', 'protein', 'quick', 'healthy'],
      ),

      MealTemplate.fromPortions(
        name: 'Overnight Oats',
        portions: [
          FoodPortion.create(
            foodName: 'Rolled Oats',
            quantity: 0.5,
            unitId: 'cup',
            unitDisplayName: 'cup',
            estimatedGrams: 40.0,
          ),
          FoodPortion.create(
            foodName: 'Greek Yogurt',
            quantity: 0.25,
            unitId: 'cup',
            unitDisplayName: 'cup',
            estimatedGrams: 60.0,
          ),
          FoodPortion.create(
            foodName: 'Milk',
            quantity: 0.5,
            unitId: 'cup',
            unitDisplayName: 'cup',
            estimatedGrams: 120.0,
          ),
          FoodPortion.create(
            foodName: 'Berries',
            quantity: 0.25,
            unitId: 'cup',
            unitDisplayName: 'cup',
            estimatedGrams: 35.0,
          ),
          FoodPortion.create(
            foodName: 'Honey',
            quantity: 1.0,
            unitId: 'tsp',
            unitDisplayName: 'teaspoon',
            estimatedGrams: 7.0,
          ),
        ],
        description: 'Make-ahead breakfast that\'s ready when you wake up',
        instructions: '1. Mix oats, yogurt, and milk in jar\n2. Add honey and stir\n3. Top with berries\n4. Refrigerate overnight',
        servings: 1,
        prepTimeMinutes: 5,
        mealType: MealType.breakfast,
        foodGroups: [FoodGroup.grains, FoodGroup.dairy, FoodGroup.fruits],
        dietaryTags: [DietaryTag.vegetarian],
        tags: ['meal-prep', 'overnight', 'easy'],
      ),

      // Lunch templates
      MealTemplate.fromPortions(
        name: 'Buddha Bowl',
        portions: [
          FoodPortion.create(
            foodName: 'Quinoa',
            quantity: 0.75,
            unitId: 'cup_cooked',
            unitDisplayName: 'cup (cooked)',
            estimatedGrams: 140.0,
          ),
          FoodPortion.create(
            foodName: 'Chickpeas',
            quantity: 0.5,
            unitId: 'cup',
            unitDisplayName: 'cup',
            estimatedGrams: 82.0,
          ),
          FoodPortion.create(
            foodName: 'Avocado',
            quantity: 0.5,
            unitId: 'piece_medium',
            unitDisplayName: 'medium',
            estimatedGrams: 100.0,
          ),
          FoodPortion.create(
            foodName: 'Mixed Greens',
            quantity: 2.0,
            unitId: 'cup',
            unitDisplayName: 'cups',
            estimatedGrams: 60.0,
          ),
          FoodPortion.create(
            foodName: 'Tahini',
            quantity: 2.0,
            unitId: 'tbsp',
            unitDisplayName: 'tablespoons',
            estimatedGrams: 30.0,
          ),
        ],
        description: 'Nutritious bowl with plant-based protein and healthy fats',
        instructions: '1. Cook quinoa according to package\n2. Arrange ingredients in bowl\n3. Drizzle with tahini\n4. Season to taste',
        servings: 1,
        prepTimeMinutes: 15,
        cookTimeMinutes: 15,
        mealType: MealType.lunch,
        foodGroups: [FoodGroup.grains, FoodGroup.proteins, FoodGroup.vegetables, FoodGroup.fats],
        dietaryTags: [DietaryTag.vegan, DietaryTag.glutenFree, DietaryTag.highProtein],
        tags: ['bowl', 'healthy', 'vegan', 'protein'],
      ),

      // Dinner templates
      MealTemplate.fromPortions(
        name: 'Salmon & Vegetables',
        portions: [
          FoodPortion.create(
            foodName: 'Salmon Fillet',
            quantity: 6.0,
            unitId: 'oz',
            unitDisplayName: 'ounces',
            estimatedGrams: 170.0,
          ),
          FoodPortion.create(
            foodName: 'Broccoli',
            quantity: 1.0,
            unitId: 'cup',
            unitDisplayName: 'cup',
            estimatedGrams: 90.0,
          ),
          FoodPortion.create(
            foodName: 'Sweet Potato',
            quantity: 1.0,
            unitId: 'piece_medium',
            unitDisplayName: 'medium',
            estimatedGrams: 130.0,
          ),
          FoodPortion.create(
            foodName: 'Olive Oil',
            quantity: 1.0,
            unitId: 'tbsp',
            unitDisplayName: 'tablespoon',
            estimatedGrams: 14.0,
          ),
        ],
        description: 'High-protein dinner with omega-3s and complex carbs',
        instructions: '1. Preheat oven to 425°F\n2. Season salmon and vegetables\n3. Drizzle with olive oil\n4. Bake for 20-25 minutes',
        servings: 1,
        prepTimeMinutes: 10,
        cookTimeMinutes: 25,
        mealType: MealType.dinner,
        foodGroups: [FoodGroup.proteins, FoodGroup.vegetables],
        dietaryTags: [DietaryTag.highProtein, DietaryTag.paleo],
        tags: ['salmon', 'baked', 'omega3', 'dinner'],
      ),
    ];
  }
}