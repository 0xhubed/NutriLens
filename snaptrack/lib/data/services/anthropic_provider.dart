import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'ai_provider.dart';
import 'secure_storage_fallback.dart';

class AnthropicProvider extends AIProvider {
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
  bool get isConfigured => true; // Will be updated after hasApiKey check

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
  Future<FoodAnalysis> analyzeImage(File imageFile) async {
    final apiKey = await getApiKey();
    if (apiKey == null || apiKey.isEmpty) {
      throw AIProviderException('Anthropic API key not configured', provider: this);
    }
    
    try {
      // For now, return mock data since we don't have a real API key
      // In a real implementation, this would call Anthropic Claude Vision API
      final mockData = _getMockAnalysis();
      return FoodAnalysis.fromJson(mockData);
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

  Map<String, dynamic> _getMockAnalysis() {
    // Mock data for testing with different results than OpenAI
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
      'cookingMethod': 'Mixed'
    };
  }

  Future<Map<String, dynamic>> _callAnthropicVision(File imageFile, String apiKey) async {
    try {
      // Convert image to base64
      final bytes = await imageFile.readAsBytes();
      final base64Image = base64Encode(bytes);
      
      final response = await _dio.post(
        '/messages',
        options: Options(
          headers: {
            'x-api-key': apiKey,
          },
        ),
        data: {
          'model': 'claude-3-sonnet-20240229',
          'max_tokens': 1000,
          'messages': [
            {
              'role': 'user',
              'content': [
                {
                  'type': 'text',
                  'text': '''
Analyze this food image and provide detailed nutrition and categorization information in JSON format:
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
  "cookingMethod": "Grilled|Fried|Steamed|Raw|Baked|etc"
}
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
      final jsonMatch = RegExp(r'\{.*?\}', dotAll: true).firstMatch(content);
      
      if (jsonMatch != null) {
        return jsonDecode(jsonMatch.group(0)!);
      } else {
        throw Exception('Could not parse nutrition data from response');
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
}