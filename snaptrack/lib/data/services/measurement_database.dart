import '../models/measurement_unit.dart';

class MeasurementDatabase {
  static const List<Map<String, dynamic>> _units = [
    // === LIQUID MEASUREMENTS ===
    {
      'unitId': 'ml',
      'displayName': 'Milliliter',
      'shortName': 'ml',
      'category': 'liquid',
      'mlEquivalent': 1.0,
      'gramEquivalent': 1.0, // Water density
      'symbol': 'ml',
      'isCommon': true,
      'description': 'Standard metric liquid measurement'
    },
    {
      'unitId': 'dl',
      'displayName': 'Deciliter',
      'shortName': 'dl',
      'category': 'liquid',
      'mlEquivalent': 100.0,
      'gramEquivalent': 100.0,
      'symbol': 'dl',
      'isCommon': true,
      'description': '100 milliliters'
    },
    {
      'unitId': 'l',
      'displayName': 'Liter',
      'shortName': 'l',
      'category': 'liquid',
      'mlEquivalent': 1000.0,
      'gramEquivalent': 1000.0,
      'symbol': 'L',
      'isCommon': true,
      'description': '1000 milliliters'
    },
    {
      'unitId': 'cup',
      'displayName': 'Cup',
      'shortName': 'cup',
      'category': 'liquid',
      'mlEquivalent': 240.0,
      'gramEquivalent': 240.0,
      'symbol': 'cup',
      'isCommon': true,
      'description': 'Standard US cup (240ml)'
    },
    {
      'unitId': 'glass',
      'displayName': 'Glass',
      'shortName': 'glass',
      'category': 'liquid',
      'mlEquivalent': 200.0,
      'gramEquivalent': 200.0,
      'isCommon': true,
      'description': 'Standard drinking glass'
    },
    {
      'unitId': 'bottle',
      'displayName': 'Bottle',
      'shortName': 'bottle',
      'category': 'liquid',
      'mlEquivalent': 500.0,
      'gramEquivalent': 500.0,
      'isCommon': true,
      'description': 'Standard water bottle'
    },
    {
      'unitId': 'mug',
      'displayName': 'Mug',
      'shortName': 'mug',
      'category': 'liquid',
      'mlEquivalent': 300.0,
      'gramEquivalent': 300.0,
      'isCommon': true,
      'description': 'Coffee/tea mug'
    },
    {
      'unitId': 'shot',
      'displayName': 'Shot',
      'shortName': 'shot',
      'category': 'liquid',
      'mlEquivalent': 30.0,
      'gramEquivalent': 30.0,
      'isCommon': false,
      'description': 'Shot glass (30ml)'
    },

    // === POWDER/FINE MEASUREMENTS ===
    {
      'unitId': 'tsp',
      'displayName': 'Teaspoon',
      'shortName': 'tsp',
      'category': 'powder',
      'mlEquivalent': 5.0,
      'gramEquivalent': 4.0, // Average for powders
      'symbol': 'tsp',
      'isCommon': true,
      'description': 'Standard teaspoon (5ml)'
    },
    {
      'unitId': 'tbsp',
      'displayName': 'Tablespoon',
      'shortName': 'tbsp',
      'category': 'powder',
      'mlEquivalent': 15.0,
      'gramEquivalent': 12.0, // Average for powders
      'symbol': 'tbsp',
      'isCommon': true,
      'description': 'Standard tablespoon (15ml)'
    },
    {
      'unitId': 'scoop',
      'displayName': 'Scoop',
      'shortName': 'scoop',
      'category': 'powder',
      'gramEquivalent': 30.0, // Typical protein scoop
      'isCommon': true,
      'description': 'Standard protein powder scoop'
    },
    {
      'unitId': 'sachet',
      'displayName': 'Sachet',
      'shortName': 'sachet',
      'category': 'powder',
      'gramEquivalent': 5.0,
      'isCommon': true,
      'description': 'Small packet (sugar, salt, etc.)'
    },
    {
      'unitId': 'pinch',
      'displayName': 'Pinch',
      'shortName': 'pinch',
      'category': 'powder',
      'gramEquivalent': 0.5,
      'isCommon': true,
      'description': 'Small pinch between fingers'
    },
    {
      'unitId': 'dash',
      'displayName': 'Dash',
      'shortName': 'dash',
      'category': 'powder',
      'gramEquivalent': 1.0,
      'isCommon': false,
      'description': 'Quick shake from container'
    },

    // === SOLID MEASUREMENTS ===
    {
      'unitId': 'piece',
      'displayName': 'Piece',
      'shortName': 'piece',
      'category': 'solid',
      'isCommon': true,
      'description': 'Individual item'
    },
    {
      'unitId': 'slice',
      'displayName': 'Slice',
      'shortName': 'slice',
      'category': 'solid',
      'gramEquivalent': 30.0, // Average bread slice
      'isCommon': true,
      'description': 'Single slice'
    },
    {
      'unitId': 'handful',
      'displayName': 'Handful',
      'shortName': 'handful',
      'category': 'solid',
      'gramEquivalent': 25.0, // Average for nuts
      'isCommon': true,
      'description': 'Amount that fits in cupped hand'
    },
    {
      'unitId': 'serving',
      'displayName': 'Serving',
      'shortName': 'serving',
      'category': 'solid',
      'isCommon': true,
      'description': 'Standard serving portion'
    },
    {
      'unitId': 'portion',
      'displayName': 'Portion',
      'shortName': 'portion',
      'category': 'solid',
      'isCommon': true,
      'description': 'Individual portion'
    },
    {
      'unitId': 'stick',
      'displayName': 'Stick',
      'shortName': 'stick',
      'category': 'solid',
      'gramEquivalent': 113.0, // Butter stick
      'isCommon': false,
      'description': 'Stick (butter, etc.)'
    },
    {
      'unitId': 'cube',
      'displayName': 'Cube',
      'shortName': 'cube',
      'category': 'solid',
      'gramEquivalent': 5.0, // Sugar cube
      'isCommon': false,
      'description': 'Small cube'
    },

    // === BULK MEASUREMENTS ===
    {
      'unitId': 'bowl',
      'displayName': 'Bowl',
      'shortName': 'bowl',
      'category': 'bulk',
      'gramEquivalent': 200.0, // Average serving bowl
      'isCommon': true,
      'description': 'Standard serving bowl'
    },
    {
      'unitId': 'plate',
      'displayName': 'Plate',
      'shortName': 'plate',
      'category': 'bulk',
      'gramEquivalent': 300.0, // Average dinner plate serving
      'isCommon': true,
      'description': 'Dinner plate portion'
    },
    {
      'unitId': 'container',
      'displayName': 'Container',
      'shortName': 'container',
      'category': 'bulk',
      'gramEquivalent': 150.0, // Average container
      'isCommon': true,
      'description': 'Food container'
    },
    {
      'unitId': 'can',
      'displayName': 'Can',
      'shortName': 'can',
      'category': 'bulk',
      'gramEquivalent': 400.0, // Standard food can
      'isCommon': true,
      'description': 'Standard food can (400g)'
    },
    {
      'unitId': 'package',
      'displayName': 'Package',
      'shortName': 'package',
      'category': 'bulk',
      'isCommon': true,
      'description': 'Manufacturer package'
    },
    {
      'unitId': 'jar',
      'displayName': 'Jar',
      'shortName': 'jar',
      'category': 'bulk',
      'gramEquivalent': 300.0, // Average jar content
      'isCommon': false,
      'description': 'Glass jar content'
    },

    // === WEIGHT MEASUREMENTS ===
    {
      'unitId': 'g',
      'displayName': 'Gram',
      'shortName': 'g',
      'category': 'solid',
      'gramEquivalent': 1.0,
      'symbol': 'g',
      'isCommon': true,
      'description': 'Metric weight unit'
    },
    {
      'unitId': 'kg',
      'displayName': 'Kilogram',
      'shortName': 'kg',
      'category': 'bulk',
      'gramEquivalent': 1000.0,
      'symbol': 'kg',
      'isCommon': false,
      'description': '1000 grams'
    },
    {
      'unitId': 'oz',
      'displayName': 'Ounce',
      'shortName': 'oz',
      'category': 'solid',
      'gramEquivalent': 28.35,
      'symbol': 'oz',
      'isCommon': false,
      'description': 'Imperial weight unit'
    },
    {
      'unitId': 'lb',
      'displayName': 'Pound',
      'shortName': 'lb',
      'category': 'bulk',
      'gramEquivalent': 453.6,
      'symbol': 'lb',
      'isCommon': false,
      'description': 'Imperial weight unit (16 oz)'
    },
  ];

  static List<MeasurementUnit> getAllUnits() {
    return _units.map((data) {
      return MeasurementUnit.create(
        unitId: data['unitId'] as String,
        displayName: data['displayName'] as String,
        shortName: data['shortName'] as String,
        category: _parseCategory(data['category'] as String),
        gramEquivalent: data['gramEquivalent']?.toDouble(),
        mlEquivalent: data['mlEquivalent']?.toDouble(),
        description: data['description'] as String?,
        symbol: data['symbol'] as String?,
        isCommon: data['isCommon'] as bool? ?? true,
      );
    }).toList();
  }

  static List<MeasurementUnit> getUnitsByCategory(MeasurementCategory category) {
    return getAllUnits()
        .where((unit) => unit.category == category)
        .toList();
  }

  static List<MeasurementUnit> getCommonUnits() {
    return getAllUnits()
        .where((unit) => unit.isCommon)
        .toList();
  }

  static List<MeasurementUnit> searchUnits(String query) {
    if (query.isEmpty) return getCommonUnits();
    
    final lowercaseQuery = query.toLowerCase();
    return getAllUnits()
        .where((unit) =>
            unit.displayName.toLowerCase().contains(lowercaseQuery) ||
            unit.shortName.toLowerCase().contains(lowercaseQuery) ||
            unit.unitId.toLowerCase().contains(lowercaseQuery))
        .toList();
  }

  static MeasurementUnit? getUnitById(String unitId) {
    try {
      return getAllUnits()
          .firstWhere((unit) => unit.unitId == unitId);
    } catch (e) {
      return null;
    }
  }

  static List<MeasurementUnit> getSuggestedUnitsForFood(String foodName, String? category) {
    final allUnits = getAllUnits();
    
    // Food-specific suggestions
    final lowerFoodName = foodName.toLowerCase();
    
    if (lowerFoodName.contains('protein') || lowerFoodName.contains('powder')) {
      return allUnits.where((u) => ['scoop', 'tbsp', 'g'].contains(u.unitId)).toList();
    }
    
    if (lowerFoodName.contains('milk') || lowerFoodName.contains('juice') || 
        lowerFoodName.contains('water') || lowerFoodName.contains('drink')) {
      return allUnits.where((u) => ['ml', 'dl', 'cup', 'glass', 'bottle'].contains(u.unitId)).toList();
    }
    
    if (lowerFoodName.contains('nuts') || lowerFoodName.contains('berry') ||
        lowerFoodName.contains('grain')) {
      return allUnits.where((u) => ['handful', 'tbsp', 'cup', 'g'].contains(u.unitId)).toList();
    }
    
    if (lowerFoodName.contains('bread') || lowerFoodName.contains('toast')) {
      return allUnits.where((u) => ['slice', 'piece', 'g'].contains(u.unitId)).toList();
    }
    
    if (lowerFoodName.contains('soup') || lowerFoodName.contains('cereal') ||
        lowerFoodName.contains('oatmeal') || lowerFoodName.contains('porridge')) {
      return allUnits.where((u) => ['bowl', 'cup', 'ml', 'g'].contains(u.unitId)).toList();
    }
    
    // Category-based fallback
    if (category != null) {
      switch (category.toLowerCase()) {
        case 'liquid':
          return getUnitsByCategory(MeasurementCategory.liquid);
        case 'powder':
          return getUnitsByCategory(MeasurementCategory.powder);
        case 'solid':
          return getUnitsByCategory(MeasurementCategory.solid);
        case 'bulk':
          return getUnitsByCategory(MeasurementCategory.bulk);
      }
    }
    
    // Default common units
    return getCommonUnits().take(8).toList();
  }

  static MeasurementCategory _parseCategory(String category) {
    switch (category.toLowerCase()) {
      case 'liquid':
        return MeasurementCategory.liquid;
      case 'powder':
        return MeasurementCategory.powder;
      case 'solid':
        return MeasurementCategory.solid;
      case 'bulk':
        return MeasurementCategory.bulk;
      case 'custom':
        return MeasurementCategory.custom;
      default:
        return MeasurementCategory.solid;
    }
  }

  static Map<MeasurementCategory, List<MeasurementUnit>> getUnitsGroupedByCategory() {
    final grouped = <MeasurementCategory, List<MeasurementUnit>>{};
    
    for (final category in MeasurementCategory.values) {
      grouped[category] = getUnitsByCategory(category);
    }
    
    return grouped;
  }

  // Food-specific conversion database
  static const Map<String, Map<String, double>> _foodConversions = {
    'whey protein': {
      'scoop': 30.0,
      'tbsp': 10.0,
    },
    'peanut butter': {
      'tbsp': 32.0,
      'tsp': 11.0,
    },
    'honey': {
      'tbsp': 21.0,
      'tsp': 7.0,
    },
    'olive oil': {
      'tbsp': 14.0,
      'tsp': 5.0,
    },
    'flour': {
      'cup': 120.0,
      'tbsp': 8.0,
      'tsp': 3.0,
    },
    'sugar': {
      'cup': 200.0,
      'tbsp': 12.5,
      'tsp': 4.0,
    },
    'oats': {
      'cup': 80.0,
      'tbsp': 5.0,
    },
    'rice': {
      'cup': 185.0, // cooked
      'tbsp': 12.0,
    },
    'pasta': {
      'cup': 140.0, // cooked
      'portion': 80.0, // dry
    },
    'almonds': {
      'handful': 28.0,
      'piece': 1.2,
    },
    'walnuts': {
      'handful': 30.0,
      'piece': 3.0,
    },
    'banana': {
      'piece': 120.0,
      'slice': 10.0,
    },
    'apple': {
      'piece': 180.0,
      'slice': 15.0,
    },
    'bread': {
      'slice': 30.0,
      'piece': 25.0,
    },
    'cheese': {
      'slice': 20.0,
      'cube': 15.0,
    },
    'butter': {
      'tbsp': 14.0,
      'tsp': 5.0,
      'stick': 113.0,
    },
  };

  static double? getFoodConversion(String foodName, String unitId) {
    final lowerFoodName = foodName.toLowerCase();
    
    for (final foodKey in _foodConversions.keys) {
      if (lowerFoodName.contains(foodKey)) {
        return _foodConversions[foodKey]?[unitId];
      }
    }
    
    return null;
  }

  static List<String> getSupportedFoodsForUnit(String unitId) {
    final foods = <String>[];
    
    for (final entry in _foodConversions.entries) {
      if (entry.value.containsKey(unitId)) {
        foods.add(entry.key);
      }
    }
    
    return foods;
  }
}