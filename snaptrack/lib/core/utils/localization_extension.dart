import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import '../../generated/l10n/app_localizations.dart';

/// Extension to easily access localizations
extension LocalizationExtension on BuildContext {
  /// Access app localizations
  AppLocalizations get l10n => AppLocalizations.of(this);
  
  /// Get current locale
  Locale get currentLocale => Localizations.localeOf(this);
  
  /// Check if current locale is German
  bool get isGerman => currentLocale.languageCode == 'de';
  
  /// Check if current locale is English
  bool get isEnglish => currentLocale.languageCode == 'en';
}

/// Localization configuration helper
class LocalizationConfig {
  static const List<Locale> supportedLocales = AppLocalizations.supportedLocales;
  
  static const List<LocalizationsDelegate> localizationsDelegates = AppLocalizations.localizationsDelegates;
  
  /// Locale resolution callback
  static Locale? localeResolutionCallback(
    Locale? locale,
    Iterable<Locale> supportedLocales,
  ) {
    // Check if the current device locale is supported
    if (locale != null) {
      for (Locale supportedLocale in supportedLocales) {
        if (locale.languageCode == supportedLocale.languageCode) {
          return supportedLocale;
        }
      }
    }
    
    // Fallback to German if no match found
    return const Locale('de', '');
  }
}

/// Temporary localization helper until generated files are ready
class TempLocalizations {
  static final Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'appTitle': 'NutriLens',
      'goodMorning': 'Good Morning!',
      'goodAfternoon': 'Good Afternoon!',
      'goodEvening': 'Good Evening!',
      'readyToTrack': 'Ready to track your nutrition?',
      'takePhoto': 'Take Photo',
      'takePhotoDescription': 'Scan your meal instantly',
      'typeFood': 'Type Food',
      'typeFoodDescription': 'Describe your meal',
      'addFood': 'Add Food',
      'analytics': 'Analytics',
      'activity': 'Activity',
      'balance': 'Balance',
      'history': 'History',
      'settings': 'Settings',
      'logActivity': 'Log Activity',
      'macroDistribution': 'Macro Distribution',
      'calories': 'Calories',
      'protein': 'Protein',
      'carbs': 'Carbs',
      'fat': 'Fat',
      'kcal': 'kcal',
      'loading': 'Loading...',
      'error': 'Error',
      'save': 'Save',
      'cancel': 'Cancel',
      'delete': 'Delete',
      'edit': 'Edit',
    },
    'de': {
      'appTitle': 'NutriLens',
      'goodMorning': 'Guten Morgen!',
      'goodAfternoon': 'Guten Tag!',
      'goodEvening': 'Guten Abend!',
      'readyToTrack': 'Bereit, deine Ernährung zu verfolgen?',
      'takePhoto': 'Foto machen',
      'takePhotoDescription': 'Scanne deine Mahlzeit sofort',
      'typeFood': 'Essen eingeben',
      'typeFoodDescription': 'Beschreibe deine Mahlzeit',
      'addFood': 'Essen hinzufügen',
      'analytics': 'Analysen',
      'activity': 'Aktivität',
      'balance': 'Bilanz',
      'history': 'Verlauf',
      'settings': 'Einstellungen',
      'logActivity': 'Aktivität erfassen',
      'macroDistribution': 'Makronährstoffverteilung',
      'calories': 'Kalorien',
      'protein': 'Eiweiß',
      'carbs': 'Kohlenhydrate',
      'fat': 'Fett',
      'kcal': 'kcal',
      'loading': 'Lädt...',
      'error': 'Fehler',
      'save': 'Speichern',
      'cancel': 'Abbrechen',
      'delete': 'Löschen',
      'edit': 'Bearbeiten',
    },
  };

  static String translate(BuildContext context, String key) {
    final locale = Localizations.localeOf(context);
    final translations = _localizedValues[locale.languageCode] ?? _localizedValues['en']!;
    return translations[key] ?? key;
  }
}

/// Temporary translation function
String t(BuildContext context, String key) {
  return TempLocalizations.translate(context, key);
}