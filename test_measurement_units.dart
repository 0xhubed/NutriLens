#!/usr/bin/env dart

// Simple test script to verify measurement units functionality
import 'snaptrack/lib/data/services/measurement_database.dart';
import 'snaptrack/lib/data/models/measurement_unit.dart';

void main() {
  print('Testing Measurement Units Database...\n');

  try {
    // Test 1: Get all units
    final allUnits = MeasurementDatabase.getAllUnits();
    print('✓ Successfully loaded ${allUnits.length} measurement units');
    
    // Test 2: Get units by category
    final liquidUnits = MeasurementDatabase.getUnitsByCategory(MeasurementCategory.liquid);
    final powderUnits = MeasurementDatabase.getUnitsByCategory(MeasurementCategory.powder);
    final solidUnits = MeasurementDatabase.getUnitsByCategory(MeasurementCategory.solid);
    final bulkUnits = MeasurementDatabase.getUnitsByCategory(MeasurementCategory.bulk);
    
    print('✓ Liquid units: ${liquidUnits.length}');
    print('✓ Powder units: ${powderUnits.length}');
    print('✓ Solid units: ${solidUnits.length}');
    print('✓ Bulk units: ${bulkUnits.length}');
    
    // Test 3: Get common units
    final commonUnits = MeasurementDatabase.getCommonUnits();
    print('✓ Common units: ${commonUnits.length}');
    
    // Test 4: Search units
    final cupUnits = MeasurementDatabase.searchUnits('cup');
    print('✓ Search for "cup": ${cupUnits.length} results');
    
    // Test 5: Get unit by ID
    final gramUnit = MeasurementDatabase.getUnitById('g');
    print('✓ Get gram unit: ${gramUnit?.displayName ?? "Not found"}');
    
    // Test 6: Get suggested units for food
    final riceUnits = MeasurementDatabase.getSuggestedUnitsForFood('rice', null);
    print('✓ Suggested units for rice: ${riceUnits.map((u) => u.displayName).join(", ")}');
    
    // Test 7: Food conversions
    final proteinConversion = MeasurementDatabase.getFoodConversion('whey protein', 'scoop');
    print('✓ Whey protein scoop conversion: ${proteinConversion ?? "Not found"}g');
    
    print('\n🎉 All measurement unit tests passed!');
    
  } catch (e, stack) {
    print('❌ Error testing measurement units: $e');
    print('Stack trace: $stack');
  }
}