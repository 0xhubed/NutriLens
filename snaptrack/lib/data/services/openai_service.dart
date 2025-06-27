import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'ai_provider.dart';
import 'secure_storage_fallback.dart';

class OpenAIProvider extends AIProvider {
  static const String _apiKeyKey = 'openai_api_key';
  static const String _baseUrl = 'https://api.openai.com/v1';
  
  final Dio _dio = Dio();
  
  OpenAIService() {
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
  Future<FoodAnalysis> analyzeImage(File imageFile) async {
    final apiKey = await getApiKey();
    if (apiKey == null || apiKey.isEmpty) {
      throw AIProviderException('OpenAI API key not configured', provider: this);
    }
    
    try {
      // For now, return mock data since we don't have a real API key
      // In a real implementation, this would call OpenAI Vision API
      final mockData = _getMockAnalysis();
      return FoodAnalysis.fromJson(mockData);
    } catch (e) {
      throw AIProviderException('Analysis failed: $e', provider: this, originalError: e);
    }
  }
  
  Map<String, dynamic> _getMockAnalysis() {
    // Mock data for testing with enhanced categorization
    return {
      'name': 'Grilled Chicken Breast with Vegetables',
      'calories': 285,
      'protein': 35.0,
      'carbs': 8.0,
      'fat': 8.2,
      'detectedItems': [
        {
          'name': 'Grilled Chicken Breast',
          'calories': 185,
          'protein': 31.0,
          'carbs': 0.0,
          'fat': 6.2,
          'portion': '6 oz'
        },
        {
          'name': 'Steamed Broccoli',
          'calories': 100,
          'protein': 4.0,
          'carbs': 8.0,
          'fat': 2.0,
          'portion': '1 cup'
        }
      ],
      'mealType': 'dinner',
      'foodGroups': ['proteins', 'vegetables'],
      'cuisine': 'american',
      'dietaryTags': ['highProtein', 'lowCarb'],
      'portionSize': 'Medium',
      'cookingMethod': 'Grilled'
    };
  }
  
  Future<Map<String, dynamic>> _callOpenAIVision(File imageFile, String apiKey) async {
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
          'model': 'gpt-4-vision-preview',
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
                  'type': 'image_url',
                  'image_url': {
                    'url': 'data:image/jpeg;base64,$base64Image',
                  },
                },
              ],
            },
          ],
          'max_tokens': 300,
        },
      );
      
      final content = response.data['choices'][0]['message']['content'];
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