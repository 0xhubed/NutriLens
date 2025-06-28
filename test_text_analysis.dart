import 'snaptrack/lib/data/services/ai_provider.dart';
import 'snaptrack/lib/data/services/openai_service.dart';
import 'snaptrack/lib/data/services/anthropic_provider.dart';
import 'snaptrack/lib/data/services/gemini_provider.dart';

void main() async {
  print('Testing Text Analysis with Unit Information\n');
  
  // Test descriptions
  final testDescriptions = [
    'chicken breast with rice',
    'porridge with berries',
    'pasta with tomato sauce',
    'protein shake',
    'apple',
  ];
  
  // Test OpenAI Provider
  print('=== Testing OpenAI Provider ===');
  final openAI = OpenAIProvider();
  await testProvider(openAI, testDescriptions);
  
  // Test Anthropic Provider
  print('\n=== Testing Anthropic Provider ===');
  final anthropic = AnthropicProvider();
  await testProvider(anthropic, testDescriptions);
  
  // Test Gemini Provider
  print('\n=== Testing Gemini Provider ===');
  final gemini = GeminiProvider();
  await testProvider(gemini, testDescriptions);
}

Future<void> testProvider(dynamic provider, List<String> descriptions) async {
  if (provider is! TextAnalysisCapable) {
    print('Provider does not support text analysis');
    return;
  }
  
  for (final description in descriptions) {
    print('\nAnalyzing: "$description"');
    try {
      final result = await provider.analyzeTextDescription(description);
      
      for (final suggestion in result.suggestions) {
        print('  ${suggestion.name}:');
        print('    Nutrition: ${suggestion.calories.toStringAsFixed(0)} kcal, '
              'P: ${suggestion.protein.toStringAsFixed(1)}g, '
              'C: ${suggestion.carbs.toStringAsFixed(1)}g, '
              'F: ${suggestion.fat.toStringAsFixed(1)}g');
        print('    Portion: ${suggestion.portionDescription}');
        if (suggestion.description != null) {
          print('    Description: ${suggestion.description}');
        }
      }
    } catch (e) {
      print('  Error: $e');
    }
  }
}