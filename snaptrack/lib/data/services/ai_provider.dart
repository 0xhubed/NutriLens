import 'dart:io';
import '../models/food_entry.dart';

abstract class AIProvider {
  Future<FoodAnalysis> analyzeImage(File imageFile, {String? userHint});
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

  FoodSuggestion({
    required this.name,
    required this.calories,
    required this.protein,
    required this.carbs,
    required this.fat,
    this.estimatedWeight,
    this.description,
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
    );
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