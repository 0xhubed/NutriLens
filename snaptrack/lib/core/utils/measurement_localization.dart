import 'package:flutter/material.dart';
import '../../data/models/measurement_unit.dart';
import 'localization_extension.dart';

/// Extension to provide localized names for measurement units
extension MeasurementLocalization on MeasurementUnit {
  
  /// Get localized display name based on current locale
  String getLocalizedDisplayName(BuildContext context) {
    if (context.isGerman) {
      return _getGermanDisplayName();
    }
    return displayName; // Default to English
  }
  
  /// Get localized short name based on current locale
  String getLocalizedShortName(BuildContext context) {
    if (context.isGerman) {
      return _getGermanShortName();
    }
    return shortName; // Default to English
  }
  
  /// Get German display name for measurement unit
  String _getGermanDisplayName() {
    switch (unitId) {
      // Liquid measurements
      case 'ml':
        return 'Milliliter';
      case 'dl':
        return 'Deziliter';
      case 'l':
        return 'Liter';
      case 'cup':
        return 'Tasse';
      case 'glass':
        return 'Glas';
      case 'bottle':
        return 'Flasche';
      case 'mug':
        return 'Becher';
      case 'shot':
        return 'Schnapsglas';
      
      // Powder/fine measurements
      case 'tsp':
        return 'Teelöffel';
      case 'tbsp':
        return 'Esslöffel';
      case 'pinch':
        return 'Prise';
      case 'dash':
        return 'Spritzer';
      
      // Weight measurements
      case 'g':
        return 'Gramm';
      case 'kg':
        return 'Kilogramm';
      case 'oz':
        return 'Unze';
      case 'lb':
        return 'Pfund';
      
      // Pieces and portions
      case 'piece':
        return 'Stück';
      case 'slice':
        return 'Scheibe';
      case 'portion':
        return 'Portion';
      case 'handful':
        return 'Handvoll';
      case 'scoop':
        return 'Löffel';
      case 'serving':
        return 'Portion';
      
      // Size modifiers
      case 'piece_small':
        return 'Kleines Stück';
      case 'piece_medium':
        return 'Mittleres Stück';
      case 'piece_large':
        return 'Großes Stück';
      case 'slice_thin':
        return 'Dünne Scheibe';
      case 'slice_thick':
        return 'Dicke Scheibe';
      case 'handful_small':
        return 'Kleine Handvoll';
      case 'handful_large':
        return 'Große Handvoll';
      
      // Bowl and plate measurements
      case 'bowl':
        return 'Schüssel';
      case 'bowl_small':
        return 'Kleine Schüssel';
      case 'bowl_large':
        return 'Große Schüssel';
      case 'plate':
        return 'Teller';
      case 'plate_small':
        return 'Kleiner Teller';
      case 'plate_large':
        return 'Großer Teller';
      
      // Spoon measurements (already covered above but for completeness)
      case 'spoon':
        return 'Löffel';
      case 'ladle':
        return 'Schöpfkelle';
      
      // Food-specific
      case 'can':
        return 'Dose';
      case 'package':
        return 'Packung';
      case 'container':
        return 'Behälter';
      case 'jar':
        return 'Glas';
      case 'packet':
        return 'Päckchen';
      case 'bag':
        return 'Beutel';
      
      default:
        return displayName; // Fallback to original name
    }
  }
  
  /// Get German short name for measurement unit
  String _getGermanShortName() {
    switch (unitId) {
      // Keep metric units the same
      case 'ml':
      case 'dl':
      case 'l':
      case 'g':
      case 'kg':
        return shortName;
      
      // German abbreviations
      case 'tsp':
        return 'TL'; // Teelöffel
      case 'tbsp':
        return 'EL'; // Esslöffel
      case 'cup':
        return 'Tasse';
      case 'glass':
        return 'Glas';
      case 'piece':
        return 'Stk.'; // Stück
      case 'slice':
        return 'Scheibe';
      case 'portion':
        return 'Portion';
      
      default:
        return shortName; // Fallback to original short name
    }
  }
}

/// Extension to provide localized names for measurement categories
extension MeasurementCategoryLocalization on MeasurementCategory {
  
  /// Get localized category name
  String getLocalizedName(BuildContext context) {
    if (context.isGerman) {
      return _getGermanName();
    }
    return displayName; // Default to English
  }
  
  /// Get German category name
  String _getGermanName() {
    switch (this) {
      case MeasurementCategory.liquid:
        return 'Flüssigkeit';
      case MeasurementCategory.powder:
        return 'Pulver';
      case MeasurementCategory.solid:
        return 'Feststoff';
      case MeasurementCategory.bulk:
        return 'Schüttgut';
      case MeasurementCategory.custom:
        return 'Benutzerdefiniert';
    }
  }
}

/// Helper class for common German measurement conversions
class GermanMeasurementHelper {
  
  /// Common German measurement terms and their equivalents
  static const Map<String, String> germanToEnglishUnits = {
    'teelöffel': 'tsp',
    'tl': 'tsp',
    'esslöffel': 'tbsp',
    'el': 'tbsp',
    'tasse': 'cup',
    'glas': 'glass',
    'flasche': 'bottle',
    'becher': 'mug',
    'gramm': 'g',
    'kilogramm': 'kg',
    'liter': 'l',
    'milliliter': 'ml',
    'deziliter': 'dl',
    'stück': 'piece',
    'scheibe': 'slice',
    'portion': 'portion',
    'handvoll': 'handful',
    'löffel': 'scoop',
    'schüssel': 'bowl',
    'teller': 'plate',
    'dose': 'can',
    'packung': 'package',
    'päckchen': 'packet',
    'beutel': 'bag',
    'prise': 'pinch',
  };
  
  /// Convert German unit name to English unit ID
  static String? getUnitIdFromGerman(String germanName) {
    final lowerName = germanName.toLowerCase().trim();
    return germanToEnglishUnits[lowerName];
  }
  
  /// Check if a string contains German measurement terms
  static bool containsGermanMeasurement(String text) {
    final lowerText = text.toLowerCase();
    return germanToEnglishUnits.keys.any((term) => lowerText.contains(term));
  }
}