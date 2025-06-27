import '../models/measurement_unit.dart';
import 'measurement_database.dart';

/// Service for parsing natural language ingredient descriptions into structured portions
class IngredientParser {
  
  /// Parse a natural language description into a FoodPortion
  /// 
  /// Examples:
  /// - "2 cups of rice" -> FoodPortion(quantity: 2.0, unitId: 'cup', foodName: 'rice')
  /// - "1 tbsp olive oil" -> FoodPortion(quantity: 1.0, unitId: 'tbsp', foodName: 'olive oil')
  /// - "3 medium apples" -> FoodPortion(quantity: 3.0, unitId: 'piece_medium', foodName: 'apples')
  /// - "half cup milk" -> FoodPortion(quantity: 0.5, unitId: 'cup', foodName: 'milk')
  static FoodPortion? parseIngredient(String description) {
    if (description.trim().isEmpty) return null;
    
    final result = _parseDescription(description.trim().toLowerCase());
    if (result == null) return null;
    
    final unit = MeasurementDatabase.getUnitById(result.unitId);
    if (unit == null) return null;
    
    return FoodPortion.create(
      foodName: result.foodName,
      quantity: result.quantity,
      unitId: result.unitId,
      unitDisplayName: unit.displayName,
      estimatedGrams: 0.0, // Will be calculated by conversion service
    );
  }
  
  /// Parse multiple ingredient lines
  static List<FoodPortion> parseIngredientList(String text) {
    final lines = text.split('\n')
        .map((line) => line.trim())
        .where((line) => line.isNotEmpty);
    
    final portions = <FoodPortion>[];
    for (final line in lines) {
      final portion = parseIngredient(line);
      if (portion != null) {
        portions.add(portion);
      }
    }
    
    return portions;
  }
  
  /// Internal parsing result
  static _ParseResult? _parseDescription(String description) {
    // Remove common prefixes
    description = description
        .replaceAll(RegExp(r'^(add|use|include|take)\s+'), '')
        .replaceAll(RegExp(r'\s+(of|for)\s+'), ' ');
    
    // Try different parsing patterns in order of specificity
    return _tryFractionPattern(description) ??
           _tryDecimalPattern(description) ??
           _tryWordNumberPattern(description) ??
           _trySimplePattern(description);
  }
  
  /// Pattern: "1/2 cup rice", "3 1/4 cups flour"
  static _ParseResult? _tryFractionPattern(String description) {
    final fractionRegex = RegExp(
      r'^(\d+\s+)?(\d+)/(\d+)\s+(\w+)\s+(.+)$'
    );
    final match = fractionRegex.firstMatch(description);
    if (match == null) return null;
    
    final wholeStr = match.group(1)?.trim();
    final numerator = int.tryParse(match.group(2) ?? '');
    final denominator = int.tryParse(match.group(3) ?? '');
    final unitText = match.group(4)!;
    final foodName = match.group(5)!.trim();
    
    if (numerator == null || denominator == null || denominator == 0) return null;
    
    double quantity = numerator / denominator;
    if (wholeStr != null && wholeStr.isNotEmpty) {
      final whole = int.tryParse(wholeStr);
      if (whole != null) quantity += whole;
    }
    
    final unitId = _findUnitId(unitText);
    if (unitId == null) return null;
    
    return _ParseResult(
      quantity: quantity,
      unitId: unitId,
      foodName: _cleanFoodName(foodName),
    );
  }
  
  /// Pattern: "2.5 cups rice", "1.25 tbsp oil"
  static _ParseResult? _tryDecimalPattern(String description) {
    final decimalRegex = RegExp(
      r'^(\d+\.?\d*)\s+(\w+)\s+(.+)$'
    );
    final match = decimalRegex.firstMatch(description);
    if (match == null) return null;
    
    final quantity = double.tryParse(match.group(1)!);
    final unitText = match.group(2)!;
    final foodName = match.group(3)!.trim();
    
    if (quantity == null || quantity <= 0) return null;
    
    final unitId = _findUnitId(unitText);
    if (unitId == null) return null;
    
    return _ParseResult(
      quantity: quantity,
      unitId: unitId,
      foodName: _cleanFoodName(foodName),
    );
  }
  
  /// Pattern: "two cups rice", "half cup milk", "a dozen eggs"
  static _ParseResult? _tryWordNumberPattern(String description) {
    final wordRegex = RegExp(
      r'^(a\s+|an\s+)?(half|quarter|third|two|three|four|five|six|seven|eight|nine|ten|dozen)\s+(\w+)\s+(.+)$'
    );
    final match = wordRegex.firstMatch(description);
    if (match == null) return null;
    
    final prefix = match.group(1);
    final quantityWord = match.group(2)!;
    final unitText = match.group(3)!;
    final foodName = match.group(4)!.trim();
    
    final quantity = _wordToNumber(quantityWord, prefix);
    if (quantity == null) return null;
    
    final unitId = _findUnitId(unitText);
    if (unitId == null) return null;
    
    return _ParseResult(
      quantity: quantity,
      unitId: unitId,
      foodName: _cleanFoodName(foodName),
    );
  }
  
  /// Pattern: "rice", "chicken breast" (assumes 1 piece/serving)
  static _ParseResult? _trySimplePattern(String description) {
    // If no quantity or unit detected, assume 1 piece/serving
    if (!RegExp(r'\d').hasMatch(description) && 
        !_containsUnit(description)) {
      return _ParseResult(
        quantity: 1.0,
        unitId: 'piece',
        foodName: _cleanFoodName(description),
      );
    }
    return null;
  }
  
  /// Find unit ID from text (handles plurals and abbreviations)
  static String? _findUnitId(String unitText) {
    // Direct lookup first
    final unit = MeasurementDatabase.searchUnits(unitText).firstOrNull;
    if (unit != null) return unit.unitId;
    
    // Common abbreviations and plurals
    final unitMappings = {
      // Volume
      'cup': 'cup', 'cups': 'cup', 'c': 'cup',
      'tablespoon': 'tbsp', 'tablespoons': 'tbsp', 'tbsp': 'tbsp', 'tbs': 'tbsp',
      'teaspoon': 'tsp', 'teaspoons': 'tsp', 'tsp': 'tsp',
      'ml': 'ml', 'milliliter': 'ml', 'milliliters': 'ml',
      'liter': 'l', 'liters': 'l', 'l': 'l',
      'pint': 'pint', 'pints': 'pint', 'pt': 'pint',
      'quart': 'quart', 'quarts': 'quart', 'qt': 'quart',
      'gallon': 'gallon', 'gallons': 'gallon', 'gal': 'gallon',
      'fluid_oz': 'fl_oz', 'fl_oz': 'fl_oz', 'floz': 'fl_oz',
      
      // Weight
      'gram': 'g', 'grams': 'g', 'g': 'g',
      'kilogram': 'kg', 'kilograms': 'kg', 'kg': 'kg',
      'pound': 'lb', 'pounds': 'lb', 'lb': 'lb', 'lbs': 'lb',
      'ounce': 'oz', 'ounces': 'oz', 'oz': 'oz',
      
      // Count
      'piece': 'piece', 'pieces': 'piece', 'pc': 'piece',
      'item': 'piece', 'items': 'piece',
      'slice': 'slice', 'slices': 'slice',
      'clove': 'clove', 'cloves': 'clove',
      'dozen': 'dozen',
      
      // Size-based pieces
      'small': 'piece_small', 'medium': 'piece_medium', 'large': 'piece_large',
      
      // Handfuls and scoops
      'handful': 'handful', 'handfuls': 'handful',
      'scoop': 'scoop', 'scoops': 'scoop',
      'pinch': 'pinch', 'pinches': 'pinch',
      'dash': 'dash', 'dashes': 'dash',
    };
    
    return unitMappings[unitText.toLowerCase()];
  }
  
  /// Convert word numbers to decimal values
  static double? _wordToNumber(String word, String? prefix) {
    final multiplier = (prefix?.contains('a') == true) ? 1.0 : 1.0;
    
    switch (word.toLowerCase()) {
      case 'half': return 0.5 * multiplier;
      case 'quarter': return 0.25 * multiplier;
      case 'third': return 0.33 * multiplier;
      case 'two': return 2.0 * multiplier;
      case 'three': return 3.0 * multiplier;
      case 'four': return 4.0 * multiplier;
      case 'five': return 5.0 * multiplier;
      case 'six': return 6.0 * multiplier;
      case 'seven': return 7.0 * multiplier;
      case 'eight': return 8.0 * multiplier;
      case 'nine': return 9.0 * multiplier;
      case 'ten': return 10.0 * multiplier;
      case 'dozen': return 12.0 * multiplier;
      default: return null;
    }
  }
  
  /// Check if text contains unit indicators
  static bool _containsUnit(String text) {
    final unitWords = [
      'cup', 'cups', 'tablespoon', 'tablespoons', 'tbsp', 'teaspoon', 'teaspoons', 'tsp',
      'gram', 'grams', 'kilogram', 'kilograms', 'pound', 'pounds', 'ounce', 'ounces',
      'piece', 'pieces', 'slice', 'slices', 'handful', 'handfuls', 'scoop', 'scoops',
      'small', 'medium', 'large', 'ml', 'liter', 'liters'
    ];
    
    return unitWords.any((unit) => text.toLowerCase().contains(unit));
  }
  
  /// Clean and normalize food name
  static String _cleanFoodName(String foodName) {
    return foodName
        .replaceAll(RegExp(r'^(of|for)\s+'), '')
        .replaceAll(RegExp(r'\s+(chopped|diced|sliced|minced|fresh|dried)$'), '')
        .trim();
  }
  
  /// Get parsing suggestions for partial input
  static List<String> getSuggestions(String partialInput) {
    final suggestions = <String>[];
    
    // If input starts with a number, suggest units
    if (RegExp(r'^\d+\.?\d*\s*$').hasMatch(partialInput.trim())) {
      suggestions.addAll([
        '${partialInput.trim()} cups',
        '${partialInput.trim()} tablespoons',
        '${partialInput.trim()} teaspoons',
        '${partialInput.trim()} pieces',
        '${partialInput.trim()} ounces',
      ]);
    }
    
    // If input has number and unit, suggest foods
    final numberUnitRegex = RegExp(r'^(\d+\.?\d*)\s+(\w+)\s*$');
    final match = numberUnitRegex.firstMatch(partialInput.trim());
    if (match != null) {
      final quantity = match.group(1)!;
      final unit = match.group(2)!;
      
      final commonFoods = [
        'rice', 'pasta', 'chicken breast', 'ground beef', 'salmon',
        'olive oil', 'butter', 'milk', 'eggs', 'flour',
        'sugar', 'salt', 'pepper', 'onion', 'garlic',
      ];
      
      suggestions.addAll(
        commonFoods.map((food) => '$quantity $unit $food')
      );
    }
    
    return suggestions.take(5).toList();
  }
  
  /// Validate if a description can be parsed
  static bool canParse(String description) {
    return parseIngredient(description) != null;
  }
}

/// Internal class for parsing results
class _ParseResult {
  final double quantity;
  final String unitId;
  final String foodName;
  
  _ParseResult({
    required this.quantity,
    required this.unitId,
    required this.foodName,
  });
}

/// Extension to add firstOrNull to Iterable
extension IterableExtension<T> on Iterable<T> {
  T? get firstOrNull => isEmpty ? null : first;
}