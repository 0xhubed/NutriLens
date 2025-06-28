import 'dart:io';
import 'snaptrack/lib/data/services/anthropic_provider.dart';

void main() async {
  final provider = AnthropicProvider();
  
  try {
    print('Testing text analysis with unit information...');
    
    final result = await provider.analyzeTextDescription('2 cups of cooked rice with chicken');
    
    print('\nAnalysis results:');
    for (final suggestion in result.suggestions) {
      print('Food: ${suggestion.name}');
      print('Portion: ${suggestion.portionDescription}');
      print('Calories: ${suggestion.calories}');
      print('Weight: ${suggestion.estimatedWeight}g');
      if (suggestion.description != null) {
        print('Description: ${suggestion.description}');
      }
      print('---');
    }
  } catch (e) {
    print('Test failed: $e');
  }
}