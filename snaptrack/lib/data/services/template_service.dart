import 'package:isar/isar.dart';
import '../models/meal_template.dart';
import '../models/food_entry.dart';
import 'ai_provider.dart';

class TemplateService {
  final Isar _isar;
  
  TemplateService(this._isar);
  
  // Create template from food entry
  Future<MealTemplate> createTemplate(FoodEntry entry, {String? customName}) async {
    final template = MealTemplate.fromFoodEntry(entry, customName: customName);
    
    await _isar.writeTxn(() async {
      await _isar.mealTemplates.put(template);
    });
    
    return template;
  }
  
  // Get all templates
  Future<List<MealTemplate>> getAllTemplates() async {
    return await _isar.mealTemplates.where().findAll();
  }
  
  // Get templates by meal type
  Future<List<MealTemplate>> getTemplatesByMealType(MealType mealType) async {
    return await _isar.mealTemplates
        .filter()
        .mealTypeEqualTo(mealType)
        .findAll();
  }
  
  // Get favorite templates
  Future<List<MealTemplate>> getFavoriteTemplates() async {
    return await _isar.mealTemplates
        .filter()
        .isFavoriteEqualTo(true)
        .findAll();
  }
  
  // Get most used templates
  Future<List<MealTemplate>> getMostUsedTemplates({int limit = 10}) async {
    return await _isar.mealTemplates
        .where()
        .sortByUsageCountDesc()
        .limit(limit)
        .findAll();
  }
  
  // Get recently used templates
  Future<List<MealTemplate>> getRecentlyUsedTemplates({int limit = 10}) async {
    return await _isar.mealTemplates
        .filter()
        .lastUsedIsNotNull()
        .sortByLastUsedDesc()
        .limit(limit)
        .findAll();
  }
  
  // Search templates
  Future<List<MealTemplate>> searchTemplates(String query) async {
    return await _isar.mealTemplates
        .filter()
        .nameContains(query, caseSensitive: false)
        .or()
        .descriptionContains(query, caseSensitive: false)
        .findAll();
  }
  
  // Use template to create food entry
  Future<FoodEntry> useTemplate(MealTemplate template, {Map<int, double>? itemMultipliers, DateTime? timestamp}) async {
    template.incrementUsage();
    
    // Update template usage
    await _isar.writeTxn(() async {
      await _isar.mealTemplates.put(template);
    });
    
    // Calculate totals with multipliers
    double totalCalories = 0;
    double totalProtein = 0;
    double totalCarbs = 0;
    double totalFat = 0;
    
    final detectedItems = <DetectedFoodItem>[];
    
    for (int i = 0; i < template.items.length; i++) {
      final item = template.items[i];
      final multiplier = itemMultipliers?[i] ?? item.multiplier;
      
      totalCalories += item.calories * multiplier;
      totalProtein += item.protein * multiplier;
      totalCarbs += item.carbs * multiplier;
      totalFat += item.fat * multiplier;
      
      detectedItems.add(DetectedFoodItem()
        ..name = item.name
        ..calories = item.calories * multiplier
        ..protein = item.protein * multiplier
        ..carbs = item.carbs * multiplier
        ..fat = item.fat * multiplier
        ..portion = item.portion);
    }
    
    // Create food entry from template
    final entry = FoodEntry()
      ..name = template.name
      ..imageBase64 = template.imageBase64 ?? ''
      ..calories = totalCalories
      ..protein = totalProtein
      ..carbs = totalCarbs
      ..fat = totalFat
      ..timestamp = timestamp ?? DateTime.now()
      ..mealType = template.mealType ?? FoodEntry.suggestMealTypeByTime(timestamp ?? DateTime.now())
      ..foodGroups = List.from(template.foodGroups)
      ..cuisine = template.cuisine
      ..dietaryTags = List.from(template.dietaryTags)
      ..detectedItems = detectedItems
      ..aiProvider = 'template';
    
    return entry;
  }
  
  // Update template
  Future<void> updateTemplate(MealTemplate template) async {
    await _isar.writeTxn(() async {
      await _isar.mealTemplates.put(template);
    });
  }
  
  // Delete template
  Future<void> deleteTemplate(int templateId) async {
    await _isar.writeTxn(() async {
      await _isar.mealTemplates.delete(templateId);
    });
  }
  
  // Toggle favorite
  Future<void> toggleFavorite(MealTemplate template) async {
    template.isFavorite = !template.isFavorite;
    await updateTemplate(template);
  }
  
  // Get template suggestions based on current meal type and recent entries
  Future<List<MealTemplate>> getSuggestedTemplates({MealType? mealType, int limit = 5}) async {
    final currentMealType = mealType ?? FoodEntry.suggestMealTypeByTime(DateTime.now());
    
    // Get templates for current meal type, prioritizing recently used and favorites
    final templates = await _isar.mealTemplates
        .filter()
        .mealTypeEqualTo(currentMealType)
        .findAll();
    
    // Sort by: favorites first, then by usage count, then by recent usage
    templates.sort((a, b) {
      if (a.isFavorite && !b.isFavorite) return -1;
      if (!a.isFavorite && b.isFavorite) return 1;
      
      final usageCompare = b.usageCount.compareTo(a.usageCount);
      if (usageCompare != 0) return usageCompare;
      
      if (a.lastUsed != null && b.lastUsed != null) {
        return b.lastUsed!.compareTo(a.lastUsed!);
      }
      
      return b.createdAt.compareTo(a.createdAt);
    });
    
    return templates.take(limit).toList();
  }
  
  // Get templates by dietary tags
  Future<List<MealTemplate>> getTemplatesByDietaryTags(List<DietaryTag> tags) async {
    if (tags.isEmpty) return [];
    
    final templates = await _isar.mealTemplates.where().findAll();
    
    return templates.where((template) {
      return tags.any((tag) => template.dietaryTags.contains(tag));
    }).toList();
  }
  
  // Get template statistics
  Future<Map<String, dynamic>> getTemplateStats() async {
    final templates = await _isar.mealTemplates.where().findAll();
    
    final totalTemplates = templates.length;
    final totalUsage = templates.fold<int>(0, (sum, t) => sum + t.usageCount);
    final favoriteCount = templates.where((t) => t.isFavorite).length;
    final mostUsed = templates.isNotEmpty 
        ? templates.reduce((a, b) => a.usageCount > b.usageCount ? a : b)
        : null;
    
    final mealTypeDistribution = <MealType, int>{};
    for (final template in templates) {
      if (template.mealType != null) {
        mealTypeDistribution[template.mealType!] = 
            (mealTypeDistribution[template.mealType!] ?? 0) + 1;
      }
    }
    
    return {
      'totalTemplates': totalTemplates,
      'totalUsage': totalUsage,
      'favoriteCount': favoriteCount,
      'averageUsage': totalTemplates > 0 ? totalUsage / totalTemplates : 0,
      'mostUsedTemplate': mostUsed?.name,
      'mealTypeDistribution': mealTypeDistribution,
    };
  }
}