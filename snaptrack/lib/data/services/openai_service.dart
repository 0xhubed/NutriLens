import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'ai_provider.dart';
import 'secure_storage_fallback.dart';

class OpenAIProvider extends AIProvider implements TextAnalysisCapable {
  static const String _apiKeyKey = 'openai_api_key';
  static const String _baseUrl = 'https://api.openai.com/v1';
  
  final Dio _dio = Dio();
  
  OpenAIProvider() {
    _dio.options.baseUrl = _baseUrl;
    _dio.options.headers = {
      'Content-Type': 'application/json',
    };
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
  
  @override
  String get name => 'OpenAI GPT-4 Vision';

  @override
  String get providerId => 'openai';

  @override
  bool get isConfigured => true; // Will be updated after hasApiKey check

  @override
  Map<String, String> get requiredConfigKeys => {'api_key': 'OpenAI API Key'};

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
  Future<FoodAnalysis> analyzeImage(File imageFile, {String? userHint, double? estimatedVolume}) async {
    return analyzeImageWithPortions(imageFile, userHint: userHint, requestPortions: false, estimatedVolume: estimatedVolume);
  }

  @override
  Future<FoodAnalysis> analyzeImageWithPortions(
    File imageFile, {
    String? userHint,
    bool requestPortions = true,
    double? estimatedVolume,
  }) async {
    final apiKey = await getApiKey();
    
    try {
      if (apiKey == null || apiKey.isEmpty) {
        // Fall back to mock data if no API key is configured
        print('OpenAI: No API key configured, using mock data');
        final mockData = _getMockAnalysis(requestPortions: requestPortions);
        return FoodAnalysis.fromJson(mockData);
      }
      
      // Make real API call to OpenAI Vision
      final analysisData = await _callOpenAIVision(imageFile, apiKey, userHint, requestPortions: requestPortions);
      return FoodAnalysis.fromJson(analysisData);
    } catch (e) {
      throw AIProviderException('Analysis failed: $e', provider: this, originalError: e);
    }
  }
  
  Map<String, dynamic> _getMockAnalysis({bool requestPortions = false}) {
    // Mock data for testing with enhanced categorization including weight estimation
    return {
      'name': 'Grilled Chicken Breast with Vegetables',
      'calories': 285,
      'protein': 35.0,
      'carbs': 8.0,
      'fat': 8.2,
      'estimatedWeight': 250,
      'detectedItems': [
        {
          'name': 'Grilled Chicken Breast',
          'calories': 185,
          'protein': 31.0,
          'carbs': 0.0,
          'fat': 6.2,
          'portion': '6 oz',
          'estimatedWeight': 170
        },
        {
          'name': 'Steamed Broccoli',
          'calories': 100,
          'protein': 4.0,
          'carbs': 8.0,
          'fat': 2.0,
          'portion': '1 cup',
          'estimatedWeight': 80
        }
      ],
      'mealType': 'dinner',
      'foodGroups': ['proteins', 'vegetables'],
      'cuisine': 'american',
      'dietaryTags': ['highProtein', 'lowCarb'],
      'portionSize': 'Medium',
      'cookingMethod': 'Grilled',
      'detectedPortions': requestPortions ? [
        {
          'foodName': 'Grilled Chicken Breast',
          'quantity': 6.0,
          'unitId': 'oz',
          'unitDisplayName': 'ounce',
          'estimatedGrams': 170.0
        },
        {
          'foodName': 'Steamed Broccoli',
          'quantity': 1.0,
          'unitId': 'cup',
          'unitDisplayName': 'cup',
          'estimatedGrams': 80.0
        }
      ] : null,
      'hasPortionData': requestPortions
    };
  }
  
  Future<Map<String, dynamic>> _callOpenAIVision(File imageFile, String apiKey, String? userHint, {bool requestPortions = false}) async {
    try {
      // Convert image to base64
      final bytes = await imageFile.readAsBytes();
      final base64Image = base64Encode(bytes);
      
      final response = await _dio.post(
        '/chat/completions',
        options: Options(
          headers: {
            'Authorization': 'Bearer $apiKey',
          },
        ),
        data: {
          'model': 'gpt-4o',
          'messages': [
            {
              'role': 'user',
              'content': [
                {
                  'type': 'text',
                  'text': '''
Analyze this food image and provide detailed nutrition and categorization information WITH WEIGHT ESTIMATION.
${userHint != null ? '\nUser description: "$userHint"\nPlease use this information to help identify the food accurately.\n' : ''}

IMPORTANT: Estimate the weight of the food items based on visual cues like plate size, portion size, and food density. Consider typical serving sizes and visual references.

Return ONLY a valid JSON object with no additional text, markdown formatting, or explanation. The JSON should follow this exact structure:
{
  "name": "Overall meal/food name",
  "calories": number,
  "protein": number (grams), 
  "carbs": number (grams),
  "fat": number (grams),
  "estimatedWeight": number (total estimated weight in grams),
  "detectedItems": [
    {
      "name": "Individual food item",
      "calories": number,
      "protein": number,
      "carbs": number,
      "fat": number,
      "portion": "size description",
      "estimatedWeight": number (estimated weight in grams)
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
                  'type': 'image_url',
                  'image_url': {
                    'url': 'data:image/jpeg;base64,$base64Image',
                  },
                },
              ],
            },
          ],
          'max_tokens': 1500,
        },
      );
      
      final content = response.data['choices'][0]['message']['content'];
      
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
        print('OpenAI: No API key configured, using mock data');
        return _getMockTextAnalysis(description);
      }

      // Make real API call to OpenAI
      final response = await _dio.post(
        '/chat/completions',
        options: Options(
          headers: {'Authorization': 'Bearer $apiKey'},
        ),
        data: {
          'model': 'gpt-4o',
          'messages': [
            {
              'role': 'system',
              'content': '''You are a nutrition expert. Analyze the food description and provide 2-3 food suggestions with estimated portions, units, and nutritional information.

IMPORTANT: Respond with valid JSON only, no additional text.

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
            },
            {
              'role': 'user',
              'content': 'Analyze this food description: $description'
            }
          ],
          'max_tokens': 1000,
          'temperature': 0.1,
        },
      );

      final content = response.data['choices'][0]['message']['content'] as String;
      
      // Parse JSON response
      final parsedResponse = jsonDecode(content);
      final suggestions = (parsedResponse['suggestions'] as List)
          .map((item) => FoodSuggestion.fromJson(item))
          .toList();

      return TextAnalysisResult(
        suggestions: suggestions,
        explanation: 'Analysis provided by OpenAI GPT-4o',
      );

    } on DioException catch (e) {
      print('OpenAI API Error: ${e.response?.data}');
      print('Status Code: ${e.response?.statusCode}');
      
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
    // Simple keyword-based mock suggestions
    final lowerDesc = description.toLowerCase();
    final suggestions = <FoodSuggestion>[];

    if (lowerDesc.contains('chicken')) {
      suggestions.add(FoodSuggestion(
        name: 'Grilled Chicken Breast',
        calories: 231,
        protein: 43.5,
        carbs: 0,
        fat: 5.0,
        estimatedWeight: 150,
        quantity: 1,
        unitId: 'serving',
        unitDisplayName: 'serving',
        description: 'Estimated 1 serving (150g)',
      ));
    }
    
    if (lowerDesc.contains('rice')) {
      suggestions.add(FoodSuggestion(
        name: 'Cooked White Rice',
        calories: 130,
        protein: 2.7,
        carbs: 28,
        fat: 0.3,
        estimatedWeight: 100,
        quantity: 0.5,
        unitId: 'cup',
        unitDisplayName: 'cup',
        description: 'Estimated 1/2 cup cooked rice',
      ));
    }

    if (lowerDesc.contains('apple')) {
      suggestions.add(FoodSuggestion(
        name: 'Medium Apple',
        calories: 95,
        protein: 0.5,
        carbs: 25,
        fat: 0.3,
        estimatedWeight: 182,
        quantity: 1,
        unitId: 'piece',
        unitDisplayName: 'medium apple',
        description: 'Estimated 1 medium apple',
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
        description: 'Generic 1 portion estimation',
      ));
    }

    return TextAnalysisResult(
      suggestions: suggestions,
      explanation: 'Mock analysis for testing purposes',
    );
  }
}