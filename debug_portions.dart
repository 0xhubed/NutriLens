// Debug script to test portion display
import 'snaptrack/lib/data/models/food_entry.dart';
import 'snaptrack/lib/data/models/measurement_unit.dart';

void main() {
  print('Testing FoodEntry portion display...');
  
  // Test 1: Entry with portions
  final entryWithPortions = FoodEntry()
    ..name = 'Test Oatmeal'
    ..usePortions = true
    ..portions = [
      FoodPortion.create(
        foodName: 'Oatmeal',
        quantity: 1,
        unitId: 'cup',
        unitDisplayName: 'cup',
        estimatedGrams: 240,
        calories: 150,
        protein: 5,
        carbs: 27,
        fat: 3,
      )
    ];
  
  print('Entry with portions:');
  print('  - Name: ${entryWithPortions.name}');
  print('  - usePortions: ${entryWithPortions.usePortions}');
  print('  - portions.length: ${entryWithPortions.portions.length}');
  print('  - portionSummary: "${entryWithPortions.portionSummary}"');
  print('  - Display: "${entryWithPortions.portions.isNotEmpty ? '${entryWithPortions.name} (${entryWithPortions.portionSummary})' : entryWithPortions.name}"');
  
  // Test 2: Entry without portions
  final entryWithoutPortions = FoodEntry()
    ..name = 'Test Chicken'
    ..estimatedWeight = 150;
  
  print('\nEntry without portions:');
  print('  - Name: ${entryWithoutPortions.name}');
  print('  - usePortions: ${entryWithoutPortions.usePortions}');
  print('  - portions.length: ${entryWithoutPortions.portions.length}');
  print('  - portionSummary: "${entryWithoutPortions.portionSummary}"');
  print('  - Display: "${entryWithoutPortions.portions.isNotEmpty ? '${entryWithoutPortions.name} (${entryWithoutPortions.portionSummary})' : entryWithoutPortions.name}"');
}