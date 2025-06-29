import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

import '../models/measurement_unit.dart';
import 'measurement_database.dart';

// Note: conversionServiceProvider is defined in measurement_providers.dart
// This is kept here for reference but should not be used

class ConversionService {
  Box<FoodConversion> get _conversionBox => Hive.box<FoodConversion>('foodConversions');
  Box<UserMeasurementPreference> get _preferenceBox => Hive.box<UserMeasurementPreference>('userMeasurementPreferences');
  
  ConversionService();

  /// Convert a quantity from one unit to grams
  Future<ConversionResult> convertToGrams({
    required double quantity,
    required String unitId,
    required String foodName,
    double? userWeight, // User-provided weight for this specific instance
  }) async {
    // If user provided a weight for this instance, use it
    if (userWeight != null) {
      return ConversionResult(
        grams: userWeight,
        confidence: ConversionConfidence.userProvided,
        source: 'User provided',
      );
    }

    // Check for user's personal conversions first
    final userConversion = await _getUserConversion(foodName, unitId);
    if (userConversion != null) {
      return ConversionResult(
        grams: quantity * userConversion.gramsPerUnit,
        confidence: ConversionConfidence.high,
        source: 'Personal conversion',
      );
    }

    // Check food-specific conversions
    final foodSpecific = MeasurementDatabase.getFoodConversion(foodName, unitId);
    if (foodSpecific != null) {
      return ConversionResult(
        grams: quantity * foodSpecific,
        confidence: ConversionConfidence.high,
        source: 'Food-specific database',
      );
    }

    // Get unit from database
    final unit = MeasurementDatabase.getUnitById(unitId);
    if (unit == null) {
      return ConversionResult(
        grams: 0,
        confidence: ConversionConfidence.unknown,
        source: 'Unit not found',
      );
    }

    // Use standard unit conversion
    if (unit.gramEquivalent != null) {
      return ConversionResult(
        grams: quantity * unit.gramEquivalent!,
        confidence: ConversionConfidence.medium,
        source: 'Standard conversion',
      );
    }

    // Try volume-to-weight conversion with estimated density
    if (unit.mlEquivalent != null) {
      final density = _estimateFoodDensity(foodName);
      if (density != null) {
        return ConversionResult(
          grams: quantity * unit.mlEquivalent! * density,
          confidence: ConversionConfidence.low,
          source: 'Volume + estimated density',
        );
      }
    }

    // No conversion available
    return ConversionResult(
      grams: 0,
      confidence: ConversionConfidence.unknown,
      source: 'No conversion available',
    );
  }

  /// Get suggested units for a specific food with smart prioritization
  Future<List<MeasurementUnit>> getSuggestedUnits(String foodName) async {
    // Get recent user preferences for this food category
    final recentUnits = await getRecentUnitsForFood(foodName);
    
    // Get frequently used units across all foods
    final frequentUnits = await getFrequentlyUsedUnits();
    
    // Get database suggestions based on food type
    final dbSuggestions = MeasurementDatabase.getSuggestedUnitsForFood(foodName, null);
    
    // Smart ranking algorithm
    final unitScores = <String, double>{};
    final allUnits = <String, MeasurementUnit>{};
    
    // Score recent units for this food category (highest priority)
    for (int i = 0; i < recentUnits.length; i++) {
      final unit = recentUnits[i];
      allUnits[unit.unitId] = unit;
      unitScores[unit.unitId] = 100.0 - (i * 10); // Decreasing score by recency
    }
    
    // Score frequently used units globally (medium priority)
    for (int i = 0; i < frequentUnits.length; i++) {
      final unit = frequentUnits[i];
      allUnits[unit.unitId] = unit;
      unitScores[unit.unitId] = (unitScores[unit.unitId] ?? 0) + (50.0 - (i * 5));
    }
    
    // Score database suggestions (base priority)
    for (int i = 0; i < dbSuggestions.length; i++) {
      final unit = dbSuggestions[i];
      allUnits[unit.unitId] = unit;
      unitScores[unit.unitId] = (unitScores[unit.unitId] ?? 0) + (30.0 - (i * 3));
    }
    
    // Apply food-specific boost
    _applyFoodSpecificBoost(foodName, unitScores);
    
    // Sort by score and return top suggestions
    final sortedUnits = allUnits.values.toList();
    sortedUnits.sort((a, b) => 
      (unitScores[b.unitId] ?? 0).compareTo(unitScores[a.unitId] ?? 0)
    );
    
    return sortedUnits.take(8).toList(); // Return top 8 suggestions
  }

  /// Get frequently used units across all foods
  Future<List<MeasurementUnit>> getFrequentlyUsedUnits() async {
    final preferences = _preferenceBox.values
        .where((pref) => pref.usageCount > 0)
        .toList()
      ..sort((a, b) => b.usageCount.compareTo(a.usageCount));
    
    final limitedPrefs = preferences.take(10).toList();

    final units = <MeasurementUnit>[];
    for (final pref in limitedPrefs) {
      final unit = MeasurementDatabase.getUnitById(pref.preferredUnitId);
      if (unit != null) {
        units.add(unit);
      }
    }
    
    return units;
  }

  /// Apply food-specific scoring boosts
  void _applyFoodSpecificBoost(String foodName, Map<String, double> unitScores) {
    final lower = foodName.toLowerCase();
    
    // Liquid foods prefer volume units
    if (_isLiquidFood(lower)) {
      _boostUnits(['ml', 'l', 'cup', 'fl_oz', 'tbsp', 'tsp'], unitScores, 20.0);
    }
    
    // Powder foods prefer scoops and spoons
    if (_isPowderFood(lower)) {
      _boostUnits(['scoop', 'tbsp', 'tsp', 'cup'], unitScores, 15.0);
    }
    
    // Small ingredients prefer small units
    if (_isSmallIngredient(lower)) {
      _boostUnits(['tsp', 'pinch', 'dash', 'clove'], unitScores, 25.0);
    }
    
    // Whole foods prefer piece-based units
    if (_isWholeFood(lower)) {
      _boostUnits(['piece', 'piece_small', 'piece_medium', 'piece_large', 'slice'], unitScores, 20.0);
    }
    
    // Bulk foods prefer weight units
    if (_isBulkFood(lower)) {
      _boostUnits(['kg', 'lb', 'g', 'oz'], unitScores, 15.0);
    }
  }

  void _boostUnits(List<String> unitIds, Map<String, double> scores, double boost) {
    for (final unitId in unitIds) {
      if (scores.containsKey(unitId)) {
        scores[unitId] = scores[unitId]! + boost;
      }
    }
  }

  bool _isLiquidFood(String foodName) {
    return foodName.contains('milk') || foodName.contains('juice') || 
           foodName.contains('water') || foodName.contains('oil') ||
           foodName.contains('sauce') || foodName.contains('soup') ||
           foodName.contains('broth') || foodName.contains('liquid');
  }

  bool _isPowderFood(String foodName) {
    return foodName.contains('protein') || foodName.contains('powder') ||
           foodName.contains('flour') || foodName.contains('sugar') ||
           foodName.contains('cocoa') || foodName.contains('spice');
  }

  bool _isSmallIngredient(String foodName) {
    return foodName.contains('salt') || foodName.contains('pepper') ||
           foodName.contains('garlic') || foodName.contains('herb') ||
           foodName.contains('spice') || foodName.contains('vanilla') ||
           foodName.contains('extract');
  }

  bool _isWholeFood(String foodName) {
    return foodName.contains('apple') || foodName.contains('banana') ||
           foodName.contains('egg') || foodName.contains('potato') ||
           foodName.contains('onion') || foodName.contains('tomato') ||
           foodName.contains('chicken breast') || foodName.contains('bread');
  }

  bool _isBulkFood(String foodName) {
    return foodName.contains('rice') || foodName.contains('pasta') ||
           foodName.contains('quinoa') || foodName.contains('meat') ||
           foodName.contains('fish') || foodName.contains('nuts');
  }

  /// Save a user's custom conversion
  Future<void> saveUserConversion({
    required String foodName,
    required String unitId,
    required double gramsPerUnit,
    String? source,
  }) async {
    final conversion = FoodConversion.create(
      foodName: foodName.toLowerCase(),
      unitId: unitId,
      gramsPerUnit: gramsPerUnit,
      source: source ?? 'user-measured',
      isUserGenerated: true,
    );

    // Generate ID if not present
    conversion.id ??= DateTime.now().millisecondsSinceEpoch.toString();
    await _conversionBox.put(conversion.id, conversion);
  }

  /// Record unit usage for suggestions
  Future<void> recordUnitUsage({
    required String foodName,
    required String unitId,
  }) async {
    final category = categorizeFoodName(foodName);
    
    // Check if preference exists
    final existing = _preferenceBox.values
        .where((pref) => 
            pref.foodCategory == category &&
            pref.preferredUnitId == unitId)
        .firstOrNull;

    if (existing != null) {
      // Update existing
      existing.usageCount++;
      existing.lastUsed = DateTime.now();
      
      await _preferenceBox.put(existing.id, existing);
    } else {
      // Create new preference
      final preference = UserMeasurementPreference.create(
        foodCategory: category,
        preferredUnitId: unitId,
      );
      
      // Generate ID if not present
      preference.id ??= DateTime.now().millisecondsSinceEpoch.toString();
      await _preferenceBox.put(preference.id, preference);
    }
  }

  /// Get conversion confidence indicator
  Future<ConversionConfidence> getConversionConfidence({
    required String unitId,
    required String foodName,
  }) async {
    // Check user conversions
    final userConversion = await _getUserConversion(foodName, unitId);
    if (userConversion != null) return ConversionConfidence.high;

    // Check food-specific conversions
    final foodSpecific = MeasurementDatabase.getFoodConversion(foodName, unitId);
    if (foodSpecific != null) return ConversionConfidence.high;

    // Check standard unit conversion
    final unit = MeasurementDatabase.getUnitById(unitId);
    if (unit?.gramEquivalent != null) return ConversionConfidence.medium;

    // Volume conversion available
    if (unit?.mlEquivalent != null) return ConversionConfidence.low;

    return ConversionConfidence.unknown;
  }

  /// Calculate nutrition per portion based on total nutrition and weight
  FoodPortion calculatePortionNutrition({
    required FoodPortion portion,
    required double totalCalories,
    required double totalProtein,
    required double totalCarbs,
    required double totalFat,
    required double totalWeight,
  }) {
    if (totalWeight <= 0 || portion.effectiveGrams <= 0) {
      return portion; // Return unchanged if no valid weights
    }

    final ratio = portion.effectiveGrams / totalWeight;
    
    portion.calories = totalCalories * ratio;
    portion.protein = totalProtein * ratio;
    portion.carbs = totalCarbs * ratio;
    portion.fat = totalFat * ratio;
    
    return portion;
  }

  /// Private helper methods
  
  Future<FoodConversion?> _getUserConversion(String foodName, String unitId) async {
    final conversions = _conversionBox.values
        .where((conv) => 
            conv.foodName == foodName.toLowerCase() &&
            conv.unitId == unitId &&
            conv.isUserGenerated)
        .toList()
      ..sort((a, b) => b.usageCount.compareTo(a.usageCount));
    
    return conversions.isNotEmpty ? conversions.first : null;
  }

  Future<List<MeasurementUnit>> getRecentUnitsForFood(String foodName) async {
    final category = categorizeFoodName(foodName);
    
    final preferences = _preferenceBox.values
        .where((pref) => pref.foodCategory == category)
        .toList()
      ..sort((a, b) => b.usageCount.compareTo(a.usageCount));
    
    final limitedPrefs = preferences.take(5).toList();

    final units = <MeasurementUnit>[];
    for (final pref in limitedPrefs) {
      final unit = MeasurementDatabase.getUnitById(pref.preferredUnitId);
      if (unit != null) {
        units.add(unit);
      }
    }
    
    return units;
  }

  String categorizeFoodName(String foodName) {
    final lower = foodName.toLowerCase();
    
    if (lower.contains('protein') || lower.contains('powder')) return 'protein_powder';
    if (lower.contains('milk') || lower.contains('juice') || lower.contains('water')) return 'liquids';
    if (lower.contains('nuts') || lower.contains('almond') || lower.contains('walnut')) return 'nuts';
    if (lower.contains('bread') || lower.contains('toast')) return 'bread';
    if (lower.contains('fruit') || lower.contains('apple') || lower.contains('banana')) return 'fruits';
    if (lower.contains('vegetable') || lower.contains('carrot') || lower.contains('broccoli')) return 'vegetables';
    if (lower.contains('meat') || lower.contains('chicken') || lower.contains('beef')) return 'meat';
    if (lower.contains('fish') || lower.contains('salmon') || lower.contains('tuna')) return 'fish';
    if (lower.contains('oil') || lower.contains('butter')) return 'fats';
    if (lower.contains('grain') || lower.contains('rice') || lower.contains('oat')) return 'grains';
    
    return 'other';
  }

  double? _estimateFoodDensity(String foodName) {
    final lower = foodName.toLowerCase();
    
    // Common food densities (g/ml)
    if (lower.contains('milk')) return 1.03;
    if (lower.contains('juice')) return 1.05;
    if (lower.contains('oil')) return 0.92;
    if (lower.contains('honey')) return 1.4;
    if (lower.contains('yogurt')) return 1.1;
    if (lower.contains('soup')) return 1.0;
    if (lower.contains('water')) return 1.0;
    
    // Default water density for unknown liquids
    return 1.0;
  }
}

class ConversionResult {
  final double grams;
  final ConversionConfidence confidence;
  final String source;

  ConversionResult({
    required this.grams,
    required this.confidence,
    required this.source,
  });

  bool get isReliable => confidence.index >= ConversionConfidence.medium.index;
  
  String get confidenceDescription {
    switch (confidence) {
      case ConversionConfidence.userProvided:
        return 'User provided weight';
      case ConversionConfidence.high:
        return 'High confidence conversion';
      case ConversionConfidence.medium:
        return 'Standard conversion';
      case ConversionConfidence.low:
        return 'Estimated conversion';
      case ConversionConfidence.unknown:
        return 'Unable to convert';
    }
  }
}

enum ConversionConfidence {
  unknown,
  low,
  medium,
  high,
  userProvided,
}

extension ConversionConfidenceExtension on ConversionConfidence {
  String get displayName {
    switch (this) {
      case ConversionConfidence.userProvided:
        return 'User Provided';
      case ConversionConfidence.high:
        return 'High';
      case ConversionConfidence.medium:
        return 'Medium';
      case ConversionConfidence.low:
        return 'Low';
      case ConversionConfidence.unknown:
        return 'Unknown';
    }
  }

  String get icon {
    switch (this) {
      case ConversionConfidence.userProvided:
        return '🎯';
      case ConversionConfidence.high:
        return '✅';
      case ConversionConfidence.medium:
        return '⚡';
      case ConversionConfidence.low:
        return '⚠️';
      case ConversionConfidence.unknown:
        return '❓';
    }
  }
}