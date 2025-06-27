import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'ai_provider.dart';
import 'secure_storage_fallback.dart';

class GeminiProvider extends AIProvider {
  static const String _apiKeyKey = 'gemini_api_key';
  static const String _baseUrl = 'https://generativelanguage.googleapis.com/v1beta';
  
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
  Future<FoodAnalysis> analyzeImage(File imageFile) async {
    final apiKey = await getApiKey();
    if (apiKey == null || apiKey.isEmpty) {
      throw AIProviderException('Gemini API key not configured', provider: this);
    }
    
    try {
      // For now, return mock data since we don't have a real API key
      // In a real implementation, this would call Google Gemini Vision API
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
      'cookingMethod': 'Stir-fried'
    };
  }

  Future<Map<String, dynamic>> _callGeminiVision(File imageFile, String apiKey) async {
    try {
      // Convert image to base64
      final bytes = await imageFile.readAsBytes();
      final base64Image = base64Encode(bytes);
      
      final response = await _dio.post(
        '/models/gemini-pro-vision:generateContent?key=$apiKey',
        data: {
          'contents': [
            {
              'parts': [
                {
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