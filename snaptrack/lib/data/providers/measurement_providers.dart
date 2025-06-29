import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/measurement_unit.dart';
import '../services/conversion_service.dart';
import '../services/measurement_database.dart';
import '../services/ingredient_parser.dart';
import '../services/database_service.dart';
import '../../ui/widgets/multi_unit_input_widget.dart';

// Conversion Service Provider
final conversionServiceProvider = Provider<ConversionService>((ref) {
  return ConversionService();
});

// All measurement units
final allMeasurementUnitsProvider = Provider<List<MeasurementUnit>>((ref) {
  return MeasurementDatabase.getAllUnits();
});

// Units by category
final unitsByCategoryProvider = Provider<Map<MeasurementCategory, List<MeasurementUnit>>>((ref) {
  return MeasurementDatabase.getUnitsGroupedByCategory();
});

// Common units
final commonUnitsProvider = Provider<List<MeasurementUnit>>((ref) {
  return MeasurementDatabase.getCommonUnits();
});

// Static fallback for unit suggestions (doesn't require database)
final staticSuggestedUnitsProvider = Provider.family<List<MeasurementUnit>, String>((ref, foodName) {
  return MeasurementDatabase.getSuggestedUnitsForFood(foodName, null);
});

// Suggested units for specific food (with smart features if database available)
final suggestedUnitsProvider = FutureProvider.family<List<MeasurementUnit>, String>((ref, foodName) async {
  try {
    final conversionService = ref.watch(conversionServiceProvider);
    final result = await conversionService.getSuggestedUnits(foodName);
    print('✓ Successfully loaded ${result.length} suggested units for "$foodName"');
    return result;
  } catch (e, stack) {
    // Fallback to static suggestions if service fails
    print('❌ Error loading suggested units for "$foodName": $e');
    print('Stack: $stack');
    
    try {
      final fallback = ref.read(staticSuggestedUnitsProvider(foodName));
      print('✓ Using static fallback: ${fallback.length} units');
      return fallback;
    } catch (fallbackError) {
      print('❌ Static fallback also failed: $fallbackError');
      // Final fallback - basic units
      final basic = [
        MeasurementUnit.create(
          unitId: 'g',
          displayName: 'Gram',
          shortName: 'g',
          category: MeasurementCategory.solid,
          gramEquivalent: 1.0,
        ),
        MeasurementUnit.create(
          unitId: 'ml',
          displayName: 'Milliliter', 
          shortName: 'ml',
          category: MeasurementCategory.liquid,
          gramEquivalent: 1.0,
        ),
      ];
      print('✓ Using basic fallback: ${basic.length} units');
      return basic;
    }
  }
});

// Unit search
final unitSearchProvider = StateProvider<String>((ref) => '');

final filteredUnitsProvider = Provider<List<MeasurementUnit>>((ref) {
  final searchQuery = ref.watch(unitSearchProvider);
  return MeasurementDatabase.searchUnits(searchQuery);
});

// Conversion result for specific request
final conversionResultProvider = FutureProvider.family<ConversionResult, ConversionRequest>((ref, request) async {
  try {
    final conversionService = ref.watch(conversionServiceProvider);
    return await conversionService.convertToGrams(
      quantity: request.quantity,
      unitId: request.unitId,
      foodName: request.foodName,
    );
  } catch (e) {
    // Fallback to basic conversion if service fails
    print('Error converting ${request.quantity} ${request.unitId} of ${request.foodName}: $e');
    
    // Try to get unit from static database
    final unit = MeasurementDatabase.getUnitById(request.unitId);
    if (unit?.gramEquivalent != null) {
      return ConversionResult(
        grams: request.quantity * unit!.gramEquivalent!,
        confidence: ConversionConfidence.medium,
        source: 'Fallback conversion',
      );
    }
    
    // Return unknown conversion
    return ConversionResult(
      grams: 0,
      confidence: ConversionConfidence.unknown,
      source: 'Service unavailable',
    );
  }
});

// Conversion confidence for specific unit and food
final conversionConfidenceProvider = FutureProvider.family<ConversionConfidence, ConversionConfidenceRequest>((ref, request) async {
  final conversionService = ref.watch(conversionServiceProvider);
  return await conversionService.getConversionConfidence(
    unitId: request.unitId,
    foodName: request.foodName,
  );
});

// Multi-portion state management
final multiPortionStateProvider = StateNotifierProvider<MultiPortionNotifier, MultiPortionState>((ref) {
  return MultiPortionNotifier(ref.watch(conversionServiceProvider));
});

class MultiPortionNotifier extends StateNotifier<MultiPortionState> {
  final ConversionService _conversionService;
  
  MultiPortionNotifier(this._conversionService) : super(MultiPortionState());

  void setFoodName(String foodName) {
    state = state.copyWith(foodName: foodName);
  }

  void addPortion(FoodPortion portion) {
    final updatedPortions = [...state.portions, portion];
    state = state.copyWith(portions: updatedPortions);
    _recordUnitUsage(portion);
  }

  void updatePortion(int index, FoodPortion portion) {
    if (index >= 0 && index < state.portions.length) {
      final updatedPortions = [...state.portions];
      updatedPortions[index] = portion;
      state = state.copyWith(portions: updatedPortions);
      _recordUnitUsage(portion);
    }
  }

  void removePortion(int index) {
    if (index >= 0 && index < state.portions.length) {
      final updatedPortions = [...state.portions];
      updatedPortions.removeAt(index);
      state = state.copyWith(portions: updatedPortions);
    }
  }

  void clearPortions() {
    state = state.copyWith(portions: []);
  }

  Future<void> calculateAllWeights() async {
    final updatedPortions = <FoodPortion>[];
    
    for (final portion in state.portions) {
      final result = await _conversionService.convertToGrams(
        quantity: portion.quantity,
        unitId: portion.unitId,
        foodName: portion.foodName,
        userWeight: portion.userCorrectedGrams,
      );
      
      portion.estimatedGrams = result.grams;
      updatedPortions.add(portion);
    }
    
    state = state.copyWith(portions: updatedPortions);
  }

  void _recordUnitUsage(FoodPortion portion) {
    _conversionService.recordUnitUsage(
      foodName: portion.foodName,
      unitId: portion.unitId,
    );
  }
}

class MultiPortionState {
  final String foodName;
  final List<FoodPortion> portions;
  final bool isLoading;
  final String? error;

  MultiPortionState({
    this.foodName = '',
    this.portions = const [],
    this.isLoading = false,
    this.error,
  });

  MultiPortionState copyWith({
    String? foodName,
    List<FoodPortion>? portions,
    bool? isLoading,
    String? error,
  }) {
    return MultiPortionState(
      foodName: foodName ?? this.foodName,
      portions: portions ?? this.portions,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }

  double get totalWeight {
    return portions.fold(0.0, (sum, portion) => sum + portion.effectiveGrams);
  }

  double get totalCalories {
    return portions.fold(0.0, (sum, portion) => sum + portion.calories);
  }

  double get totalProtein {
    return portions.fold(0.0, (sum, portion) => sum + portion.protein);
  }

  double get totalCarbs {
    return portions.fold(0.0, (sum, portion) => sum + portion.carbs);
  }

  double get totalFat {
    return portions.fold(0.0, (sum, portion) => sum + portion.fat);
  }
}

// User preferences for measurements
final measurementPreferencesProvider = FutureProvider<List<UserMeasurementPreference>>((ref) async {
  // This would typically come from the database
  // For now, return empty list
  return <UserMeasurementPreference>[];
});

// Recently used units with smart prioritization
final recentUnitsProvider = FutureProvider.family<List<MeasurementUnit>, String>((ref, foodName) async {
  final conversionService = ref.watch(conversionServiceProvider);
  return await conversionService.getSuggestedUnits(foodName);
});

// Global frequently used units
final frequentUnitsProvider = FutureProvider<List<MeasurementUnit>>((ref) async {
  final conversionService = ref.watch(conversionServiceProvider);
  return await conversionService.getFrequentlyUsedUnits();
});

// Smart unit suggestions based on current input
final smartUnitSuggestionsProvider = FutureProvider.family<SmartUnitSuggestions, SmartUnitRequest>((ref, request) async {
  final conversionService = ref.watch(conversionServiceProvider);
  
  // Get suggestions for the specific food
  final foodSuggestions = await conversionService.getSuggestedUnits(request.foodName);
  
  // Get recent units for this food category
  final category = conversionService.categorizeFoodName(request.foodName);
  final recentUnits = await conversionService.getRecentUnitsForFood(request.foodName);
  
  // Get global frequent units
  final frequentUnits = await conversionService.getFrequentlyUsedUnits();
  
  // Get common units for fallback
  final commonUnits = MeasurementDatabase.getCommonUnits();
  
  return SmartUnitSuggestions(
    primary: foodSuggestions.take(4).toList(),
    recent: recentUnits.take(3).toList(),
    frequent: frequentUnits.take(3).toList(),
    common: commonUnits.take(6).toList(),
    category: category,
  );
});

class SmartUnitSuggestions {
  final List<MeasurementUnit> primary;
  final List<MeasurementUnit> recent;
  final List<MeasurementUnit> frequent;
  final List<MeasurementUnit> common;
  final String category;

  SmartUnitSuggestions({
    required this.primary,
    required this.recent,
    required this.frequent,
    required this.common,
    required this.category,
  });

  List<MeasurementUnit> get allSuggestions {
    final seen = <String>{};
    final result = <MeasurementUnit>[];
    
    // Add in priority order, avoiding duplicates
    for (final list in [primary, recent, frequent, common]) {
      for (final unit in list) {
        if (!seen.contains(unit.unitId)) {
          seen.add(unit.unitId);
          result.add(unit);
        }
      }
    }
    
    return result;
  }
}

class SmartUnitRequest {
  final String foodName;
  final String? context; // 'cooking', 'baking', 'serving', etc.

  SmartUnitRequest({
    required this.foodName,
    this.context,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SmartUnitRequest &&
          runtimeType == other.runtimeType &&
          foodName == other.foodName &&
          context == other.context;

  @override
  int get hashCode => foodName.hashCode ^ context.hashCode;
}

// Ingredient Parser Providers
final ingredientParserProvider = Provider<IngredientParser>((ref) => IngredientParser());

// Parse single ingredient description
final parseIngredientProvider = Provider.family<FoodPortion?, String>((ref, description) {
  return IngredientParser.parseIngredient(description);
});

// Parse multiple ingredient lines
final parseIngredientListProvider = Provider.family<List<FoodPortion>, String>((ref, text) {
  return IngredientParser.parseIngredientList(text);
});

// Get parsing suggestions for partial input
final ingredientSuggestionsProvider = Provider.family<List<String>, String>((ref, partialInput) {
  return IngredientParser.getSuggestions(partialInput);
});

// Validate if description can be parsed
final canParseIngredientProvider = Provider.family<bool, String>((ref, description) {
  return IngredientParser.canParse(description);
});

// Natural language input state
final naturalLanguageInputProvider = StateNotifierProvider<NaturalLanguageInputNotifier, NaturalLanguageInputState>((ref) {
  final conversionService = ref.watch(conversionServiceProvider);
  return NaturalLanguageInputNotifier(conversionService);
});

class NaturalLanguageInputNotifier extends StateNotifier<NaturalLanguageInputState> {
  final ConversionService _conversionService;
  
  NaturalLanguageInputNotifier(this._conversionService) : super(NaturalLanguageInputState());

  void setInput(String input) {
    state = state.copyWith(input: input, isValid: false, parsedPortion: null);
    
    if (input.trim().isEmpty) return;
    
    final parsed = IngredientParser.parseIngredient(input);
    if (parsed != null) {
      state = state.copyWith(
        isValid: true,
        parsedPortion: parsed,
        suggestions: [],
      );
    } else {
      final suggestions = IngredientParser.getSuggestions(input);
      state = state.copyWith(
        isValid: false,
        suggestions: suggestions,
      );
    }
  }

  void selectSuggestion(String suggestion) {
    setInput(suggestion);
  }

  void clear() {
    state = NaturalLanguageInputState();
  }

  Future<FoodPortion?> parseAndConvert() async {
    if (!state.isValid || state.parsedPortion == null) return null;
    
    final portion = state.parsedPortion!;
    
    // Calculate weight estimation
    final result = await _conversionService.convertToGrams(
      quantity: portion.quantity,
      unitId: portion.unitId,
      foodName: portion.foodName,
    );
    
    portion.estimatedGrams = result.grams;
    return portion;
  }
}

class NaturalLanguageInputState {
  final String input;
  final bool isValid;
  final FoodPortion? parsedPortion;
  final List<String> suggestions;
  final bool isLoading;

  NaturalLanguageInputState({
    this.input = '',
    this.isValid = false,
    this.parsedPortion,
    this.suggestions = const [],
    this.isLoading = false,
  });

  NaturalLanguageInputState copyWith({
    String? input,
    bool? isValid,
    FoodPortion? parsedPortion,
    List<String>? suggestions,
    bool? isLoading,
  }) {
    return NaturalLanguageInputState(
      input: input ?? this.input,
      isValid: isValid ?? this.isValid,
      parsedPortion: parsedPortion,
      suggestions: suggestions ?? this.suggestions,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

// Request classes for providers
class ConversionConfidenceRequest {
  final String unitId;
  final String foodName;

  ConversionConfidenceRequest({
    required this.unitId,
    required this.foodName,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ConversionConfidenceRequest &&
          runtimeType == other.runtimeType &&
          unitId == other.unitId &&
          foodName == other.foodName;

  @override
  int get hashCode => unitId.hashCode ^ foodName.hashCode;
}

// Portion-based food entry state
final portionFoodEntryProvider = StateNotifierProvider<PortionFoodEntryNotifier, PortionFoodEntryState>((ref) {
  return PortionFoodEntryNotifier(ref.watch(conversionServiceProvider));
});

class PortionFoodEntryNotifier extends StateNotifier<PortionFoodEntryState> {
  final ConversionService _conversionService;
  
  PortionFoodEntryNotifier(this._conversionService) : super(PortionFoodEntryState());

  void setBasicInfo({
    required String name,
    required String imageBase64,
    DateTime? timestamp,
  }) {
    state = state.copyWith(
      name: name,
      imageBase64: imageBase64,
      timestamp: timestamp ?? DateTime.now(),
    );
  }

  void setPortions(List<FoodPortion> portions) {
    state = state.copyWith(portions: portions);
  }

  void setTotalNutrition({
    required double totalCalories,
    required double totalProtein,
    required double totalCarbs,
    required double totalFat,
  }) {
    state = state.copyWith(
      totalCalories: totalCalories,
      totalProtein: totalProtein,
      totalCarbs: totalCarbs,
      totalFat: totalFat,
    );
    
    // Distribute nutrition across portions
    _distributeNutrition();
  }

  void _distributeNutrition() {
    final totalWeight = state.totalWeight;
    if (totalWeight <= 0) return;

    final updatedPortions = state.portions.map((portion) {
      return _conversionService.calculatePortionNutrition(
        portion: portion,
        totalCalories: state.totalCalories,
        totalProtein: state.totalProtein,
        totalCarbs: state.totalCarbs,
        totalFat: state.totalFat,
        totalWeight: totalWeight,
      );
    }).toList();

    state = state.copyWith(portions: updatedPortions);
  }

  void reset() {
    state = PortionFoodEntryState();
  }
}

class PortionFoodEntryState {
  final String name;
  final String imageBase64;
  final DateTime timestamp;
  final List<FoodPortion> portions;
  final double totalCalories;
  final double totalProtein;
  final double totalCarbs;
  final double totalFat;

  PortionFoodEntryState({
    this.name = '',
    this.imageBase64 = '',
    DateTime? timestamp,
    this.portions = const [],
    this.totalCalories = 0.0,
    this.totalProtein = 0.0,
    this.totalCarbs = 0.0,
    this.totalFat = 0.0,
  }) : timestamp = timestamp ?? DateTime.now();

  PortionFoodEntryState copyWith({
    String? name,
    String? imageBase64,
    DateTime? timestamp,
    List<FoodPortion>? portions,
    double? totalCalories,
    double? totalProtein,
    double? totalCarbs,
    double? totalFat,
  }) {
    return PortionFoodEntryState(
      name: name ?? this.name,
      imageBase64: imageBase64 ?? this.imageBase64,
      timestamp: timestamp ?? this.timestamp,
      portions: portions ?? this.portions,
      totalCalories: totalCalories ?? this.totalCalories,
      totalProtein: totalProtein ?? this.totalProtein,
      totalCarbs: totalCarbs ?? this.totalCarbs,
      totalFat: totalFat ?? this.totalFat,
    );
  }

  double get totalWeight {
    return portions.fold(0.0, (sum, portion) => sum + portion.effectiveGrams);
  }

  bool get isValid {
    return name.isNotEmpty && portions.isNotEmpty && totalWeight > 0;
  }
}