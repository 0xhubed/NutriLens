import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'ai_provider.dart';
import 'secure_storage_fallback.dart';

class GeminiProvider extends AIProvider implements TextAnalysisCapable {
  static const String _apiKeyKey = 'gemini_api_key';
  static const String _baseUrl = 'https://generativelanguage.googleapis.com/v1';
  
  final Dio _dio = Dio();
  
  GeminiProvider() {
    _dio.options.baseUrl = _baseUrl;
    _dio.options.headers = {
      'Content-Type': 'application/json',
    };
  }

  @override
  String get name => 'Google Gemini Vision';

  @override
  String get providerId => 'gemini';

  @override
  bool get isConfigured => true; // Will be updated after hasApiKey check

  @override
  Map<String, String> get requiredConfigKeys => {'api_key': 'Google Gemini API Key'};

  @override
  Future<bool> validateConfiguration() async {
    return await hasApiKey();
  }

  @override
  Future<void> configure(Map<String, String> config) async {
    final apiKey = config['api_key'];
    if (apiKey != null && apiKey.isNotEmpty) {
      await setApiKey(apiKey);
    }
  }

  @override
  Future<FoodAnalysis> analyzeImage(File imageFile, {String? userHint}) async {
    return analyzeImageWithPortions(imageFile, userHint: userHint, requestPortions: false);
  }

  @override
  Future<FoodAnalysis> analyzeImageWithPortions(
    File imageFile, {
    String? userHint,
    bool requestPortions = true,
  }) async {
    final apiKey = await getApiKey();
    
    try {
      if (apiKey == null || apiKey.isEmpty) {
        // Fall back to mock data if no API key is configured
        print('Gemini: No API key configured, using mock data');
        final mockData = _getMockAnalysis(requestPortions: requestPortions);
        return FoodAnalysis.fromJson(mockData);
      }
      
      // Make real API call to Gemini Vision
      final analysisData = await _callGeminiVision(imageFile, apiKey, userHint, requestPortions: requestPortions);
      return FoodAnalysis.fromJson(analysisData);
    } catch (e) {
      throw AIProviderException('Analysis failed: $e', provider: this, originalError: e);
    }
  }

  Future<String?> getApiKey() async {
    return await SecureStorageFallback.read(key: _apiKeyKey);
  }
  
  Future<void> setApiKey(String apiKey) async {
    await SecureStorageFallback.write(key: _apiKeyKey, value: apiKey);
  }
  
  Future<bool> hasApiKey() async {
    final apiKey = await getApiKey();
    return apiKey != null && apiKey.isNotEmpty;
  }

  Map<String, dynamic> _getMockAnalysis({bool requestPortions = false}) {
    // Mock data for testing with different results than other providers
    return {
      'name': 'Asian Stir-Fry with Rice',
      'calories': 380,
      'protein': 22.0,
      'carbs': 45.0,
      'fat': 12.0,
      'detectedItems': [
        {
          'name': 'Brown Rice',
          'calories': 220,
          'protein': 5.0,
          'carbs': 45.0,
          'fat': 2.0,
          'portion': '1 cup cooked'
        },
        {
          'name': 'Mixed Vegetables',
          'calories': 80,
          'protein': 4.0,
          'carbs': 15.0,
          'fat': 1.0,
          'portion': '1 cup'
        },
        {
          'name': 'Tofu',
          'calories': 80,
          'protein': 8.0,
          'carbs': 2.0,
          'fat': 5.0,
          'portion': '3 oz'
        }
      ],
      'mealType': 'dinner',
      'foodGroups': ['grains', 'vegetables', 'proteins'],
      'cuisine': 'asian',
      'dietaryTags': ['vegetarian', 'vegan'],
      'portionSize': 'Medium',
      'cookingMethod': 'Stir-fried',
      'detectedPortions': requestPortions ? [
        {
          'foodName': 'Brown Rice',
          'quantity': 1.0,
          'unitId': 'cup_cooked',
          'unitDisplayName': 'cup (cooked)',
          'estimatedGrams': 195.0
        },
        {
          'foodName': 'Mixed Vegetables',
          'quantity': 1.0,
          'unitId': 'cup',
          'unitDisplayName': 'cup',
          'estimatedGrams': 150.0
        },
        {
          'foodName': 'Tofu',
          'quantity': 3.0,
          'unitId': 'oz',
          'unitDisplayName': 'ounce',
          'estimatedGrams': 85.0
        }
      ] : null,
      'hasPortionData': requestPortions
    };
  }

  Future<Map<String, dynamic>> _callGeminiVision(File imageFile, String apiKey, String? userHint, {bool requestPortions = false}) async {
    try {
      // Convert image to base64
      final bytes = await imageFile.readAsBytes();
      final base64Image = base64Encode(bytes);
      
      final response = await _dio.post(
        '/models/gemini-1.5-flash:generateContent?key=$apiKey',
        data: {
          'contents': [
            {
              'parts': [
                {
                  'text': '''
Analyze this food image and provide detailed nutrition and categorization information.
${userHint != null ? '\nUser description: "$userHint"\nPlease use this information to help identify the food accurately.\n' : ''}
Return ONLY a valid JSON object with no additional text, markdown formatting, or explanation. The JSON should follow this exact structure:
{
  "name": "Overall meal/food name",
  "calories": number,
  "protein": number (grams),
  "carbs": number (grams),
  "fat": number (grams),
  "detectedItems": [
    {
      "name": "Individual food item",
      "calories": number,
      "protein": number,
      "carbs": number,
      "fat": number,
      "portion": "size description"
    }
  ],
  "mealType": "breakfast|lunch|dinner|snack",
  "foodGroups": ["proteins", "grains", "vegetables", "fruits", "dairy", "fats"],
  "cuisine": "italian|asian|american|mexican|indian|mediterranean|other",
  "dietaryTags": ["vegetarian", "vegan", "glutenFree", "ketoFriendly", "lowCarb", "highProtein"],
  "portionSize": "Small|Medium|Large",
  "cookingMethod": "Grilled|Fried|Steamed|Raw|Baked|etc"${requestPortions ? ',\n  "detectedPortions": [\n    {\n      "foodName": "Individual food item name",\n      "quantity": number,\n      "unitId": "unit identifier (e.g., cup, tbsp, oz, piece)",\n      "unitDisplayName": "unit display name",\n      "estimatedGrams": number\n    }\n  ],\n  "hasPortionData": true' : ''}\n}
                  ''',
                },
                {
                  'inline_data': {
                    'mime_type': 'image/jpeg',
                    'data': base64Image,
                  },
                },
              ],
            },
          ],
        },
      );
      
      final content = response.data['candidates'][0]['content']['parts'][0]['text'];
      
      // Try to extract JSON from the response
      // First, try to find a complete JSON object
      final jsonStartIndex = content.indexOf('{');
      if (jsonStartIndex == -1) {
        throw Exception('No JSON found in response');
      }
      
      // Find the matching closing brace
      int braceCount = 0;
      int jsonEndIndex = -1;
      for (int i = jsonStartIndex; i < content.length; i++) {
        if (content[i] == '{') braceCount++;
        if (content[i] == '}') braceCount--;
        if (braceCount == 0) {
          jsonEndIndex = i + 1;
          break;
        }
      }
      
      if (jsonEndIndex == -1) {
        throw Exception('Incomplete JSON in response');
      }
      
      final jsonString = content.substring(jsonStartIndex, jsonEndIndex);
      
      try {
        return jsonDecode(jsonString);
      } catch (e) {
        // If parsing fails, log the content for debugging
        print('Failed to parse JSON: $jsonString');
        print('Full response: $content');
        throw Exception('Invalid JSON format: $e');
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        throw Exception('Invalid API key');
      } else if (e.response?.statusCode == 429) {
        throw Exception('Rate limit exceeded');
      } else {
        throw Exception('Network error: ${e.message}');
      }
    } catch (e) {
      throw Exception('Analysis failed: $e');
    }
  }

  @override
  Future<TextAnalysisResult> analyzeTextDescription(String description) async {
    final apiKey = await getApiKey();
    
    try {
      if (apiKey == null || apiKey.isEmpty) {
        // Return mock data if no API key is configured
        print('Gemini: No API key configured, using mock data for text analysis');
        return _getMockTextAnalysis(description);
      }

      // Make real API call to Gemini
      final response = await _dio.post(
        '/models/gemini-1.5-flash:generateContent?key=$apiKey',
        data: {
          'contents': [
            {
              'parts': [
                {
                  'text': '''You are a nutrition expert. Analyze the following food description and provide 2-3 food suggestions with estimated portions, units, and nutritional information.

Food description: $description

IMPORTANT: Respond with valid JSON only, no additional text or markdown formatting.

For each food suggestion, provide:
1. Name: Specific, clear food name
2. Weight: Estimated weight in grams
3. Portion data: Quantity and appropriate unit (e.g., 1 cup, 2 tbsp, 3 oz)
4. Nutrition for the total portion

Common units to use:
- Liquids: cup, ml, dl, l, glass, bottle, mug
- Powders: tsp, tbsp, cup, scoop
- Solids: piece, slice, oz, g, portion, serving
- Bulk: handful, cup, bowl

Response format:
{
  "suggestions": [
    {
      "name": "Food name",
      "weight": estimated_weight_in_grams,
      "calories": calories_for_this_portion,
      "protein": protein_for_this_portion,
      "carbs": carbs_for_this_portion,
      "fat": fat_for_this_portion,
      "quantity": number,
      "unitId": "unit_id",
      "unitDisplayName": "unit display name",
      "description": "Brief explanation including portion size"
    }
  ]
}'''
                }
              ],
            },
          ],
        },
      );

      final content = response.data['candidates'][0]['content']['parts'][0]['text'];
      
      // Extract JSON from response
      final jsonStartIndex = content.indexOf('{');
      if (jsonStartIndex == -1) {
        throw Exception('No JSON found in response');
      }
      
      // Find the matching closing brace
      int braceCount = 0;
      int jsonEndIndex = -1;
      for (int i = jsonStartIndex; i < content.length; i++) {
        if (content[i] == '{') braceCount++;
        if (content[i] == '}') braceCount--;
        if (braceCount == 0) {
          jsonEndIndex = i + 1;
          break;
        }
      }
      
      if (jsonEndIndex == -1) {
        throw Exception('Incomplete JSON in response');
      }
      
      final jsonString = content.substring(jsonStartIndex, jsonEndIndex);
      final parsedResponse = jsonDecode(jsonString);
      
      final suggestions = (parsedResponse['suggestions'] as List)
          .map((item) => FoodSuggestion.fromJson(item))
          .toList();

      return TextAnalysisResult(
        suggestions: suggestions,
        explanation: 'Analysis provided by Google Gemini',
      );

    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        throw Exception('Invalid API key');
      } else if (e.response?.statusCode == 429) {
        throw Exception('Rate limit exceeded');
      } else {
        throw Exception('Network error: ${e.message}');
      }
    } catch (e) {
      throw Exception('Text analysis failed: $e');
    }
  }

  TextAnalysisResult _getMockTextAnalysis(String description) {
    // Keyword-based mock suggestions
    final lowerDesc = description.toLowerCase();
    final suggestions = <FoodSuggestion>[];

    if (lowerDesc.contains('pasta')) {
      suggestions.add(FoodSuggestion(
        name: 'Spaghetti with Tomato Sauce',
        calories: 330,
        protein: 10.0,
        carbs: 60.0,
        fat: 5.0,
        estimatedWeight: 300,
        quantity: 1,
        unitId: 'plate',
        unitDisplayName: 'plate',
        description: 'Estimated 1 plate of pasta',
      ));
    }
    
    if (lowerDesc.contains('sandwich')) {
      suggestions.add(FoodSuggestion(
        name: 'Club Sandwich',
        calories: 380,
        protein: 20.0,
        carbs: 35.0,
        fat: 18.0,
        estimatedWeight: 200,
        quantity: 1,
        unitId: 'sandwich',
        unitDisplayName: 'sandwich',
        description: 'Estimated 1 whole sandwich',
      ));
    }

    if (lowerDesc.contains('soup')) {
      suggestions.add(FoodSuggestion(
        name: 'Vegetable Soup',
        calories: 120,
        protein: 5.0,
        carbs: 20.0,
        fat: 3.0,
        estimatedWeight: 300,
        quantity: 1,
        unitId: 'bowl',
        unitDisplayName: 'bowl',
        description: 'Estimated 1 bowl (300ml)',
      ));
    }

    // Default suggestion if no keywords match
    if (suggestions.isEmpty) {
      suggestions.add(FoodSuggestion(
        name: 'Mixed Food Item',
        calories: 250,
        protein: 15,
        carbs: 30,
        fat: 8,
        estimatedWeight: 150,
        quantity: 1,
        unitId: 'portion',
        unitDisplayName: 'portion',
        description: 'Generic portion estimation',
      ));
    }

    return TextAnalysisResult(
      suggestions: suggestions,
      explanation: 'Mock analysis for testing purposes',
    );
  }
}