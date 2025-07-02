import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'ai_provider.dart';
import 'secure_storage_fallback.dart';

class AnthropicProvider extends AIProvider implements TextAnalysisCapable {
  static const String _apiKeyKey = 'anthropic_api_key';
  static const String _baseUrl = 'https://api.anthropic.com/v1';
  
  final Dio _dio = Dio();
  
  AnthropicProvider() {
    _dio.options.baseUrl = _baseUrl;
    _dio.options.headers = {
      'Content-Type': 'application/json',
      'anthropic-version': '2023-06-01',
    };
  }

  @override
  String get name => 'Anthropic Claude Vision';

  @override
  String get providerId => 'anthropic';

  @override
  bool get isConfigured => true; // Dynamically checked via validateConfiguration()

  @override
  Map<String, String> get requiredConfigKeys => {'api_key': 'Anthropic API Key'};

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
        print('Anthropic: No API key configured, using mock data');
        final mockData = _getMockAnalysis(userHint, requestPortions: requestPortions, estimatedVolume: estimatedVolume);
        return FoodAnalysis.fromJson(mockData);
      }
      
      // Make real API call to Anthropic Claude Vision
      final analysisData = await _callAnthropicVision(imageFile, apiKey, userHint, requestPortions: requestPortions, estimatedVolume: estimatedVolume);
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

  Map<String, dynamic> _getMockAnalysis(String? userHint, {bool requestPortions = false, double? estimatedVolume}) {
    // Adjust nutrition based on volume if provided
    double volumeMultiplier = 1.0;
    if (estimatedVolume != null) {
      // Assume standard portion is 8 oz, adjust accordingly
      volumeMultiplier = estimatedVolume / 8.0;
    }
    
    // Mock data for testing different hint scenarios
    if (userHint != null) {
      final lowerHint = userHint.toLowerCase();
      
      // Handle partial corrections (e.g., "without fruits")
      if (lowerHint.contains('without fruits') || lowerHint.contains('no fruits')) {
        return {
          'name': 'Plain Porridge',
          'calories': (185 * volumeMultiplier).round(),
          'protein': (6.0 * volumeMultiplier),
          'carbs': (32.0 * volumeMultiplier),
          'fat': (3.5 * volumeMultiplier),
          'measuredVolume': estimatedVolume,
          'detectedItems': [
            {
              'name': 'Oatmeal Porridge',
              'calories': 150,
              'protein': 5.0,
              'carbs': 27.0,
              'fat': 3.0,
              'portion': '1 cup cooked'
            },
            {
              'name': 'Milk',
              'calories': 35,
              'protein': 1.0,
              'carbs': 5.0,
              'fat': 0.5,
              'portion': '1/4 cup'
            }
          ],
          'mealType': 'breakfast',
          'foodGroups': ['grains', 'dairy'],
          'cuisine': 'other',
          'dietaryTags': ['vegetarian'],
          'portionSize': 'Medium',
          'cookingMethod': 'Boiled',
          'detectedPortions': requestPortions ? [
            {
              'foodName': 'Oatmeal Porridge',
              'quantity': 1.0,
              'unitId': 'cup_cooked',
              'unitDisplayName': 'cup (cooked)',
              'estimatedGrams': 240.0
            },
            {
              'foodName': 'Milk',
              'quantity': 0.25,
              'unitId': 'cup',
              'unitDisplayName': 'cup',
              'estimatedGrams': 60.0
            }
          ] : null,
          'hasPortionData': requestPortions
        };
      }
      
      // Handle partial corrections that mention specific changes
      if (lowerHint.contains('correction:') || lowerHint.contains('adjust')) {
        // This is likely a partial correction - use the corrected name if available
        if (lowerHint.contains('plain porridge') || (lowerHint.contains('porridge') && lowerHint.contains('without'))) {
          return {
            'name': 'Plain Porridge',
            'calories': 185,
            'protein': 6.0,
            'carbs': 32.0,
            'fat': 3.5,
            'detectedItems': [
              {
                'name': 'Oatmeal Porridge',
                'calories': 150,
                'protein': 5.0,
                'carbs': 27.0,
                'fat': 3.0,
                'portion': '1 cup cooked'
              },
              {
                'name': 'Milk',
                'calories': 35,
                'protein': 1.0,
                'carbs': 5.0,
                'fat': 0.5,
                'portion': '1/4 cup'
              }
            ],
            'mealType': 'breakfast',
            'foodGroups': ['grains', 'dairy'],
            'cuisine': 'other',
            'dietaryTags': ['vegetarian'],
            'portionSize': 'Medium',
            'cookingMethod': 'Boiled',
            'detectedPortions': requestPortions ? [
              {
                'foodName': 'Oatmeal Porridge',
                'quantity': 1.0,
                'unitId': 'cup_cooked',
                'unitDisplayName': 'cup (cooked)',
                'estimatedGrams': 240.0
              },
              {
                'foodName': 'Milk',
                'quantity': 0.25,
                'unitId': 'cup',
                'unitDisplayName': 'cup',
                'estimatedGrams': 60.0
              }
            ] : null,
            'hasPortionData': requestPortions
          };
        }
      }
      
      // Handle general porridge hints
      if (lowerHint.contains('porridge')) {
        return {
          'name': 'Porridge with Berries and Honey',
          'calories': 285,
          'protein': 8.5,
          'carbs': 52.0,
          'fat': 6.0,
          'detectedItems': [
          {
            'name': 'Oatmeal Porridge',
            'calories': 150,
            'protein': 5.0,
            'carbs': 27.0,
            'fat': 3.0,
            'portion': '1 cup cooked'
          },
          {
            'name': 'Mixed Berries',
            'calories': 60,
            'protein': 1.0,
            'carbs': 15.0,
            'fat': 0.5,
            'portion': '1/2 cup'
          },
          {
            'name': 'Honey',
            'calories': 64,
            'protein': 0.1,
            'carbs': 17.0,
            'fat': 0.0,
            'portion': '1 tablespoon'
          },
          {
            'name': 'Milk',
            'calories': 11,
            'protein': 2.4,
            'carbs': 3.0,
            'fat': 2.5,
            'portion': '2 tablespoons'
          }
        ],
        'mealType': 'breakfast',
        'foodGroups': ['grains', 'fruits', 'dairy'],
        'cuisine': 'other',
        'dietaryTags': ['vegetarian'],
        'portionSize': 'Medium',
        'cookingMethod': 'Boiled',
        'detectedPortions': requestPortions ? [
          {
            'foodName': 'Oatmeal Porridge',
            'quantity': 1.0,
            'unitId': 'cup_cooked',
            'unitDisplayName': 'cup (cooked)',
            'estimatedGrams': 240.0
          },
          {
            'foodName': 'Mixed Berries',
            'quantity': 0.5,
            'unitId': 'cup',
            'unitDisplayName': 'cup',
            'estimatedGrams': 75.0
          },
          {
            'foodName': 'Honey',
            'quantity': 1.0,
            'unitId': 'tbsp',
            'unitDisplayName': 'tablespoon',
            'estimatedGrams': 21.0
          },
          {
            'foodName': 'Milk',
            'quantity': 2.0,
            'unitId': 'tbsp',
            'unitDisplayName': 'tablespoon',
            'estimatedGrams': 30.0
          }
        ] : null,
        'hasPortionData': requestPortions
        };
      }
    }
    
    // Default mock data - Mediterranean bowl
    return {
      'name': 'Mediterranean Quinoa Bowl',
      'calories': 420,
      'protein': 18.0,
      'carbs': 52.0,
      'fat': 16.0,
      'detectedItems': [
        {
          'name': 'Quinoa',
          'calories': 220,
          'protein': 8.0,
          'carbs': 39.0,
          'fat': 4.0,
          'portion': '1 cup cooked'
        },
        {
          'name': 'Chickpeas',
          'calories': 120,
          'protein': 6.0,
          'carbs': 20.0,
          'fat': 2.0,
          'portion': '1/2 cup'
        },
        {
          'name': 'Feta Cheese',
          'calories': 80,
          'protein': 4.0,
          'carbs': 1.0,
          'fat': 6.0,
          'portion': '1 oz'
        }
      ],
      'mealType': 'lunch',
      'foodGroups': ['grains', 'proteins', 'vegetables', 'dairy'],
      'cuisine': 'mediterranean',
      'dietaryTags': ['vegetarian', 'highProtein'],
      'portionSize': 'Large',
      'cookingMethod': 'Mixed',
      'detectedPortions': requestPortions ? [
        {
          'foodName': 'Quinoa',
          'quantity': 1.0,
          'unitId': 'cup_cooked',
          'unitDisplayName': 'cup (cooked)',
          'estimatedGrams': 185.0
        },
        {
          'foodName': 'Chickpeas',
          'quantity': 0.5,
          'unitId': 'cup',
          'unitDisplayName': 'cup',
          'estimatedGrams': 82.0
        },
        {
          'foodName': 'Feta Cheese',
          'quantity': 1.0,
          'unitId': 'oz',
          'unitDisplayName': 'ounce',
          'estimatedGrams': 28.0
        }
      ] : null,
      'hasPortionData': requestPortions
    };
  }

  Future<Map<String, dynamic>> _callAnthropicVision(File imageFile, String apiKey, String? userHint, {bool requestPortions = false, double? estimatedVolume}) async {
    try {
      // Convert image to base64
      final bytes = await imageFile.readAsBytes();
      final base64Image = base64Encode(bytes);
      
      final response = await _dio.post(
        '/messages',
        options: Options(
          headers: {
            'x-api-key': apiKey,
            'anthropic-version': '2023-06-01',
            'Content-Type': 'application/json',
          },
        ),
        data: {
          'model': 'claude-3-5-sonnet-20241022',
          'max_tokens': 2000,
          'messages': [
            {
              'role': 'user',
              'content': [
                {
                  'type': 'text',
                  'text': '''
Analyze this food image and provide detailed nutrition and categorization information.
${userHint != null ? '\nUser description: "$userHint"\nPlease use this information to help identify the food accurately.\n' : ''}
${estimatedVolume != null ? '\nAR-measured volume: ${estimatedVolume.toStringAsFixed(1)} oz\nPlease use this volume measurement to provide more accurate portion sizes and nutrition estimates.\n' : ''}
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
                  'type': 'image',
                  'source': {
                    'type': 'base64',
                    'media_type': 'image/jpeg',
                    'data': base64Image,
                  },
                },
              ],
            },
          ],
        },
      );
      
      final content = response.data['content'][0]['text'];
      
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
        print('Anthropic: No API key configured, using mock data for text analysis');
        return _getMockTextAnalysis(description);
      }

      // Make real API call to Anthropic
      final response = await _dio.post(
        '/messages',
        options: Options(
          headers: {
            'x-api-key': apiKey,
            'anthropic-version': '2023-06-01',
            'Content-Type': 'application/json',
          },
        ),
        data: {
          'model': 'claude-3-5-sonnet-20241022',
          'max_tokens': 1000,
          'messages': [
            {
              'role': 'user',
              'content': '''You are a nutrition expert. Analyze the following food description and provide 2-3 food suggestions with estimated portions, units, and nutritional information.

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
      );

      final content = response.data['content'][0]['text'];
      
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
        explanation: 'Analysis provided by Anthropic Claude',
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

    if (lowerDesc.contains('porridge') || lowerDesc.contains('oatmeal')) {
      suggestions.add(FoodSuggestion(
        name: 'Oatmeal Porridge',
        calories: 150,
        protein: 5.0,
        carbs: 27.0,
        fat: 3.0,
        estimatedWeight: 240,
        quantity: 1,
        unitId: 'cup_cooked',
        unitDisplayName: 'cup (cooked)',
        description: 'Estimated 1 cup cooked porridge',
      ));
    }
    
    if (lowerDesc.contains('salad')) {
      suggestions.add(FoodSuggestion(
        name: 'Garden Salad',
        calories: 120,
        protein: 3.0,
        carbs: 15.0,
        fat: 7.0,
        estimatedWeight: 200,
        quantity: 1,
        unitId: 'bowl',
        unitDisplayName: 'bowl',
        description: 'Estimated 1 medium bowl',
      ));
    }

    if (lowerDesc.contains('protein shake') || lowerDesc.contains('smoothie')) {
      suggestions.add(FoodSuggestion(
        name: 'Protein Shake',
        calories: 200,
        protein: 25.0,
        carbs: 15.0,
        fat: 5.0,
        estimatedWeight: 350,
        quantity: 1,
        unitId: 'glass',
        unitDisplayName: 'glass',
        description: 'Estimated 1 glass (350ml)',
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
        unitId: 'serving',
        unitDisplayName: 'serving',
        description: 'Generic serving estimation',
      ));
    }

    return TextAnalysisResult(
      suggestions: suggestions,
      explanation: 'Mock analysis for testing purposes',
    );
  }
}