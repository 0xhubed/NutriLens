// Quick test to debug unit functionality
import 'snaptrack/lib/data/services/ai_provider.dart';

void main() {
  // Test the FoodSuggestion class with unit data
  final suggestion = FoodSuggestion(
    name: 'Test Food',
    calories: 100,
    protein: 10,
    carbs: 15,
    fat: 5,
    estimatedWeight: 150,
    quantity: 2,
    unitId: 'cup',
    unitDisplayName: 'cups',
    description: 'Test description'
  );
  
  print('Portion Description: "${suggestion.portionDescription}"');
  print('Quantity: ${suggestion.quantity}');
  print('Unit ID: ${suggestion.unitId}');
  print('Unit Display Name: ${suggestion.unitDisplayName}');
  print('Estimated Weight: ${suggestion.estimatedWeight}');
  print('Description: ${suggestion.description}');
  
  // Test with null values
  final suggestionNoUnits = FoodSuggestion(
    name: 'Test Food No Units',
    calories: 100,
    protein: 10,
    carbs: 15,
    fat: 5,
    estimatedWeight: 150,
  );
  
  print('\nWithout units:');
  print('Portion Description: "${suggestionNoUnits.portionDescription}"');
}