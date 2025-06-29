import 'package:hive/hive.dart';

part 'measurement_unit.g.dart';

@HiveType(typeId: 34)
enum MeasurementCategory {
  @HiveField(0)
  liquid,
  @HiveField(1)
  powder,
  @HiveField(2)
  solid,
  @HiveField(3)
  bulk,
  @HiveField(4)
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

@HiveType(typeId: 5)
class MeasurementUnit extends HiveObject {
  @HiveField(0)
  String? id;
  
  @HiveField(1)
  String unitId = ''; // 'tbsp', 'handful', 'scoop'
  
  @HiveField(2)
  String displayName = ''; // 'Tablespoon', 'Handful', 'Scoop'
  
  @HiveField(3)
  String shortName = ''; // 'tbsp', 'handful', 'scoop'
  
  @HiveField(4)
  MeasurementCategory category = MeasurementCategory.custom;
  
  @HiveField(5)
  double? gramEquivalent; // Standard conversion to grams
  
  @HiveField(6)
  String? description; // "Level tablespoon" vs "Heaped tablespoon"
  
  // Common conversions (ml for liquids, common food densities)
  @HiveField(7)
  double? mlEquivalent;
  
  // Display information
  @HiveField(8)
  String? symbol; // '℃', 'ml', 'g'
  
  @HiveField(9)
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

@HiveType(typeId: 22)
class FoodPortion extends HiveObject {
  @HiveField(0)
  String foodName = '';
  
  @HiveField(1)
  double quantity = 0.0;
  
  @HiveField(2)
  String unitId = ''; // Reference to MeasurementUnit.unitId
  
  @HiveField(3)
  String unitDisplayName = ''; // Cached for display
  
  @HiveField(4)
  double? estimatedGrams; // Calculated or user-provided weight
  
  @HiveField(5)
  double? userCorrectedGrams; // User's manual correction
  
  // Nutrition per portion (calculated from total nutrition)
  @HiveField(6)
  double calories = 0.0;
  
  @HiveField(7)
  double protein = 0.0;
  
  @HiveField(8)
  double carbs = 0.0;
  
  @HiveField(9)
  double fat = 0.0;
  
  @HiveField(10)
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
@HiveType(typeId: 23)
class FoodConversion extends HiveObject {
  @HiveField(0)
  String? id;
  
  @HiveField(1)
  String foodName = ''; // "peanut butter", "whey protein"
  
  @HiveField(2)
  String unitId = ''; // "tbsp", "scoop"
  
  @HiveField(3)
  double gramsPerUnit = 0.0; // 32g per tbsp of peanut butter
  
  // Source information
  @HiveField(4)
  String? source; // "USDA", "user-measured", "manufacturer"
  
  @HiveField(5)
  bool isUserGenerated = false;
  
  @HiveField(6)
  DateTime? createdAt;
  
  // Confidence and usage
  @HiveField(7)
  double confidence = 1.0; // 0.0 to 1.0
  
  @HiveField(8)
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
@HiveType(typeId: 24)
class UserMeasurementPreference extends HiveObject {
  @HiveField(0)
  String? id;
  
  @HiveField(1)
  String foodCategory = ''; // "protein_powder", "nuts", "liquids"
  
  @HiveField(2)
  String preferredUnitId = '';
  
  @HiveField(3)
  int usageCount = 1;
  
  @HiveField(4)
  DateTime lastUsed = DateTime.now();
  
  UserMeasurementPreference();
  
  UserMeasurementPreference.create({
    required this.foodCategory,
    required this.preferredUnitId,
  });
}