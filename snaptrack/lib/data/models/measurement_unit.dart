import 'package:isar/isar.dart';

part 'measurement_unit.g.dart';

enum MeasurementCategory {
  liquid,
  powder,
  solid,
  bulk,
  custom,
}

extension MeasurementCategoryExtension on MeasurementCategory {
  String get displayName {
    switch (this) {
      case MeasurementCategory.liquid:
        return 'Liquid';
      case MeasurementCategory.powder:
        return 'Powder';
      case MeasurementCategory.solid:
        return 'Solid';
      case MeasurementCategory.bulk:
        return 'Bulk';
      case MeasurementCategory.custom:
        return 'Custom';
    }
  }
}

@collection
class MeasurementUnit {
  Id id = Isar.autoIncrement;
  
  late String unitId; // 'tbsp', 'handful', 'scoop'
  late String displayName; // 'Tablespoon', 'Handful', 'Scoop'
  late String shortName; // 'tbsp', 'handful', 'scoop'
  
  @enumerated
  late MeasurementCategory category;
  
  double? gramEquivalent; // Standard conversion to grams
  String? description; // "Level tablespoon" vs "Heaped tablespoon"
  
  // Common conversions (ml for liquids, common food densities)
  double? mlEquivalent;
  
  // Display information
  String? symbol; // '℃', 'ml', 'g'
  bool isCommon = true; // Show in common suggestions
  
  MeasurementUnit();
  
  MeasurementUnit.create({
    required this.unitId,
    required this.displayName,
    required this.shortName,
    required this.category,
    this.gramEquivalent,
    this.mlEquivalent,
    this.description,
    this.symbol,
    this.isCommon = true,
  });
  
  // Helper methods
  bool get hasGramConversion => gramEquivalent != null;
  bool get hasVolumeConversion => mlEquivalent != null;
  
  String get displayText => symbol != null ? '$displayName ($symbol)' : displayName;
  
  double? convertToGrams({required String? foodName, double? density}) {
    // Direct gram conversion
    if (gramEquivalent != null) return gramEquivalent;
    
    // Volume to weight conversion using food density
    if (mlEquivalent != null && density != null) {
      return mlEquivalent! * density;
    }
    
    return null;
  }
}

@embedded
class FoodPortion {
  late String foodName;
  late double quantity;
  late String unitId; // Reference to MeasurementUnit.unitId
  late String unitDisplayName; // Cached for display
  
  double? estimatedGrams; // Calculated or user-provided weight
  double? userCorrectedGrams; // User's manual correction
  
  // Nutrition per portion (calculated from total nutrition)
  double calories = 0.0;
  double protein = 0.0;
  double carbs = 0.0;
  double fat = 0.0;
  
  String? notes; // "heaped", "level", "rounded"
  
  FoodPortion();
  
  FoodPortion.create({
    required this.foodName,
    required this.quantity,
    required this.unitId,
    required this.unitDisplayName,
    this.estimatedGrams,
    this.calories = 0.0,
    this.protein = 0.0,
    this.carbs = 0.0,
    this.fat = 0.0,
    this.notes,
  });
  
  factory FoodPortion.fromJson(Map<String, dynamic> json) {
    return FoodPortion.create(
      foodName: json['foodName'] ?? '',
      quantity: (json['quantity'] ?? 0.0).toDouble(),
      unitId: json['unitId'] ?? '',
      unitDisplayName: json['unitDisplayName'] ?? '',
      estimatedGrams: json['estimatedGrams']?.toDouble(),
      calories: (json['calories'] ?? 0.0).toDouble(),
      protein: (json['protein'] ?? 0.0).toDouble(),
      carbs: (json['carbs'] ?? 0.0).toDouble(),
      fat: (json['fat'] ?? 0.0).toDouble(),
      notes: json['notes'],
    );
  }
  
  double get effectiveGrams => userCorrectedGrams ?? estimatedGrams ?? 0.0;
  
  String get formattedQuantity {
    if (quantity == quantity.toInt()) {
      return '${quantity.toInt()} $unitDisplayName${quantity != 1 ? 's' : ''}';
    } else {
      return '${quantity.toStringAsFixed(1)} $unitDisplayName${quantity != 1 ? 's' : ''}';
    }
  }
  
  String get formattedWithWeight {
    final weightStr = estimatedGrams != null 
        ? ' (~${estimatedGrams!.toStringAsFixed(0)}g)'
        : '';
    return '$formattedQuantity$weightStr';
  }
}

// Food-specific conversion factors
@collection
class FoodConversion {
  Id id = Isar.autoIncrement;
  
  late String foodName; // "peanut butter", "whey protein"
  late String unitId; // "tbsp", "scoop"
  late double gramsPerUnit; // 32g per tbsp of peanut butter
  
  // Source information
  String? source; // "USDA", "user-measured", "manufacturer"
  bool isUserGenerated = false;
  DateTime? createdAt;
  
  // Confidence and usage
  double confidence = 1.0; // 0.0 to 1.0
  int usageCount = 0;
  
  FoodConversion();
  
  FoodConversion.create({
    required this.foodName,
    required this.unitId,
    required this.gramsPerUnit,
    this.source,
    this.isUserGenerated = false,
    this.confidence = 1.0,
  }) {
    createdAt = DateTime.now();
  }
}

// User's personal measurement preferences
@collection
class UserMeasurementPreference {
  Id id = Isar.autoIncrement;
  
  late String foodCategory; // "protein_powder", "nuts", "liquids"
  late String preferredUnitId;
  
  int usageCount = 1;
  DateTime lastUsed = DateTime.now();
  
  UserMeasurementPreference();
  
  UserMeasurementPreference.create({
    required this.foodCategory,
    required this.preferredUnitId,
  });
}