import 'dart:io';
import '../models/food_entry.dart';
import '../models/measurement_unit.dart';

abstract class AIProvider {
  Future<FoodAnalysis> analyzeImage(File imageFile, {String? userHint, double? estimatedVolume});
  
  // v1.4: Portion-based analysis
  Future<FoodAnalysis> analyzeImageWithPortions(
    File imageFile, {
    String? userHint,
    bool requestPortions = true,
    double? estimatedVolume,
  });
  
  String get name;
  String get providerId;
  bool get isConfigured;
  Future<bool> validateConfiguration();
  Future<void> configure(Map<String, String> config);
  Map<String, String> get requiredConfigKeys;
}

class FoodAnalysis {
  final String name;
  final double calories;
  final double protein;
  final double carbs;
  final double fat;
  final double? estimatedWeight;
  final List<FoodItem>? detectedItems;
  final MealType suggestedMealType;
  final List<FoodGroup> suggestedFoodGroups;
  final CuisineType suggestedCuisine;
  final List<DietaryTag> suggestedDietaryTags;
  final String? portionSize;
  final String? cookingMethod;
  
  // v1.4: Portion-based analysis support
  final List<FoodPortion>? detectedPortions;
  final bool hasPortionData;
  
  // v1.5: AR measurement support
  final double? measuredVolume;

  FoodAnalysis({
    required this.name,
    required this.calories,
    required this.protein,
    required this.carbs,
    required this.fat,
    this.estimatedWeight,
    this.detectedItems,
    this.suggestedMealType = MealType.snack,
    this.suggestedFoodGroups = const [],
    this.suggestedCuisine = CuisineType.other,
    this.suggestedDietaryTags = const [],
    this.portionSize,
    this.cookingMethod,
    this.detectedPortions,
    this.hasPortionData = false,
    this.measuredVolume,
  });

  factory FoodAnalysis.fromJson(Map<String, dynamic> json) {
    return FoodAnalysis(
      name: json['name'] ?? 'Unknown Food',
      calories: (json['calories'] ?? 0).toDouble(),
      protein: (json['protein'] ?? 0).toDouble(),
      carbs: (json['carbs'] ?? 0).toDouble(),
      fat: (json['fat'] ?? 0).toDouble(),
      estimatedWeight: json['estimatedWeight'] != null ? (json['estimatedWeight'] as num).toDouble() : null,
      detectedItems: json['detectedItems'] != null
          ? (json['detectedItems'] as List)
              .map((item) => FoodItem.fromJson(item))
              .toList()
          : null,
      suggestedMealType: json['mealType'] != null
          ? MealType.values.firstWhere(
              (e) => e.name == json['mealType'],
              orElse: () => MealType.snack,
            )
          : MealType.snack,
      suggestedFoodGroups: json['foodGroups'] != null
          ? (json['foodGroups'] as List)
              .map((group) => FoodGroup.values.firstWhere(
                    (e) => e.name == group,
                    orElse: () => FoodGroup.other,
                  ))
              .toList()
          : [],
      suggestedCuisine: json['cuisine'] != null
          ? CuisineType.values.firstWhere(
              (e) => e.name == json['cuisine'],
              orElse: () => CuisineType.other,
            )
          : CuisineType.other,
      suggestedDietaryTags: json['dietaryTags'] != null
          ? (json['dietaryTags'] as List)
              .map((tag) => DietaryTag.values.firstWhere(
                    (e) => e.name == tag,
                    orElse: () => DietaryTag.none,
                  ))
              .toList()
          : [],
      portionSize: json['portionSize'],
      cookingMethod: json['cookingMethod'],
      detectedPortions: json['detectedPortions'] != null
          ? (json['detectedPortions'] as List)
              .map((portion) => FoodPortion.fromJson(portion))
              .toList()
          : null,
      hasPortionData: json['hasPortionData'] ?? false,
    );
  }
}



class AIProviderException implements Exception {
  final String message;
  final AIProvider? provider;
  final Object? originalError;

  AIProviderException(
    this.message, {
    this.provider,
    this.originalError,
  });

  @override
  String toString() => 'AIProviderException: $message';
}

// Interface for providers that support text-based food analysis
abstract class TextAnalysisCapable {
  Future<TextAnalysisResult> analyzeTextDescription(String description);
}

class FoodSuggestion {
  final String name;
  final double calories;
  final double protein;
  final double carbs;
  final double fat;
  final double? estimatedWeight;
  final String? description;
  
  // Unit information
  final double? quantity;
  final String? unitId;
  final String? unitDisplayName;

  FoodSuggestion({
    required this.name,
    required this.calories,
    required this.protein,
    required this.carbs,
    required this.fat,
    this.estimatedWeight,
    this.description,
    this.quantity,
    this.unitId,
    this.unitDisplayName,
  });

  factory FoodSuggestion.fromJson(Map<String, dynamic> json) {
    return FoodSuggestion(
      name: json['name'] ?? '',
      calories: (json['calories'] ?? 0).toDouble(),
      protein: (json['protein'] ?? 0).toDouble(),
      carbs: (json['carbs'] ?? 0).toDouble(),
      fat: (json['fat'] ?? 0).toDouble(),
      estimatedWeight: json['weight'] != null ? (json['weight'] as num).toDouble() : null,
      description: json['description'],
      quantity: json['quantity'] != null ? (json['quantity'] as num).toDouble() : null,
      unitId: json['unitId'],
      unitDisplayName: json['unitDisplayName'],
    );
  }
  
  String get portionDescription {
    if (quantity != null && unitDisplayName != null) {
      final quantityStr = quantity == quantity!.toInt() 
          ? quantity!.toInt().toString() 
          : quantity!.toStringAsFixed(1);
      return '$quantityStr $unitDisplayName';
    }
    return estimatedWeight != null ? '${estimatedWeight!.toStringAsFixed(0)}g' : '';
  }
}

class TextAnalysisResult {
  final List<FoodSuggestion> suggestions;
  final String? explanation;

  TextAnalysisResult({
    required this.suggestions,
    this.explanation,
  });
}