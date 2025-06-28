import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/measurement_unit.dart';
import '../services/measurement_database.dart';
import '../services/conversion_service.dart';

/// Fallback provider that always works, even when database is not available
final fallbackMeasurementProvider = Provider<FallbackMeasurementService>((ref) {
  return FallbackMeasurementService();
});

class FallbackMeasurementService {
  /// Get suggested units for a food with guaranteed fallback
  List<MeasurementUnit> getSuggestedUnits(String foodName) {
    try {
      return MeasurementDatabase.getSuggestedUnitsForFood(foodName, null);
    } catch (e) {
      // If even static database fails, return basic units
      return _getBasicUnits();
    }
  }
  
  /// Get all available units with fallback
  List<MeasurementUnit> getAllUnits() {
    try {
      return MeasurementDatabase.getAllUnits();
    } catch (e) {
      return _getBasicUnits();
    }
  }
  
  /// Get common units with fallback
  List<MeasurementUnit> getCommonUnits() {
    try {
      return MeasurementDatabase.getCommonUnits();
    } catch (e) {
      return _getBasicUnits();
    }
  }
  
  /// Get unit by ID with fallback
  MeasurementUnit? getUnitById(String unitId) {
    try {
      return MeasurementDatabase.getUnitById(unitId);
    } catch (e) {
      return _getBasicUnits().where((unit) => unit.unitId == unitId).firstOrNull;
    }
  }
  
  /// Basic weight conversion without database
  ConversionResult convertToGrams({
    required double quantity,
    required String unitId,
    required String foodName,
  }) {
    try {
      // Try food-specific conversion first
      final foodConversion = MeasurementDatabase.getFoodConversion(foodName, unitId);
      if (foodConversion != null) {
        return ConversionResult(
          grams: quantity * foodConversion,
          confidence: ConversionConfidence.high,
          source: 'Food-specific conversion',
        );
      }
      
      // Try unit conversion
      final unit = getUnitById(unitId);
      if (unit?.gramEquivalent != null) {
        return ConversionResult(
          grams: quantity * unit!.gramEquivalent!,
          confidence: ConversionConfidence.medium,
          source: 'Standard conversion',
        );
      }
      
      // Basic fallback conversions
      final basicConversion = _getBasicConversion(unitId);
      if (basicConversion != null) {
        return ConversionResult(
          grams: quantity * basicConversion,
          confidence: ConversionConfidence.low,
          source: 'Basic fallback',
        );
      }
      
    } catch (e) {
      // Silent fail
    }
    
    return ConversionResult(
      grams: 0,
      confidence: ConversionConfidence.unknown,
      source: 'No conversion available',
    );
  }
  
  /// Basic units that should always work
  List<MeasurementUnit> _getBasicUnits() {
    return [
      MeasurementUnit.create(
        unitId: 'g',
        displayName: 'Gram',
        shortName: 'g',
        category: MeasurementCategory.solid,
        gramEquivalent: 1.0,
        symbol: 'g',
      ),
      MeasurementUnit.create(
        unitId: 'ml',
        displayName: 'Milliliter',
        shortName: 'ml',
        category: MeasurementCategory.liquid,
        gramEquivalent: 1.0,
        symbol: 'ml',
      ),
      MeasurementUnit.create(
        unitId: 'cup',
        displayName: 'Cup',
        shortName: 'cup',
        category: MeasurementCategory.liquid,
        gramEquivalent: 240.0,
      ),
      MeasurementUnit.create(
        unitId: 'tbsp',
        displayName: 'Tablespoon',
        shortName: 'tbsp',
        category: MeasurementCategory.powder,
        gramEquivalent: 15.0,
      ),
      MeasurementUnit.create(
        unitId: 'tsp',
        displayName: 'Teaspoon',
        shortName: 'tsp',
        category: MeasurementCategory.powder,
        gramEquivalent: 5.0,
      ),
      MeasurementUnit.create(
        unitId: 'piece',
        displayName: 'Piece',
        shortName: 'piece',
        category: MeasurementCategory.solid,
        gramEquivalent: 100.0,
      ),
    ];
  }
  
  /// Basic conversion factors
  double? _getBasicConversion(String unitId) {
    const basicConversions = {
      'g': 1.0,
      'kg': 1000.0,
      'ml': 1.0,
      'l': 1000.0,
      'cup': 240.0,
      'tbsp': 15.0,
      'tsp': 5.0,
      'piece': 100.0,
      'slice': 30.0,
      'handful': 25.0,
    };
    
    return basicConversions[unitId];
  }
}

/// Provider that always returns units, even in error cases
final guaranteedUnitsProvider = Provider.family<List<MeasurementUnit>, String>((ref, foodName) {
  try {
    // Try to get from main database first
    final allUnits = MeasurementDatabase.getAllUnits();
    if (allUnits.isNotEmpty) {
      return MeasurementDatabase.getSuggestedUnitsForFood(foodName, null);
    }
  } catch (e) {
    // Fall through to fallback
  }
  
  // Use fallback service
  final fallbackService = ref.read(fallbackMeasurementProvider);
  return fallbackService.getSuggestedUnits(foodName);
});

extension on Iterable<MeasurementUnit> {
  MeasurementUnit? get firstOrNull => isEmpty ? null : first;
}