import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Provider for managing app locale/language settings
class LocaleNotifier extends StateNotifier<Locale> {
  LocaleNotifier() : super(const Locale('de')) {
    _loadStoredLocale();
  }

  static const String _localeKey = 'app_locale';

  /// Load the stored locale from shared preferences
  Future<void> _loadStoredLocale() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final localeCode = prefs.getString(_localeKey);
      
      if (localeCode != null) {
        switch (localeCode) {
          case 'de':
            state = const Locale('de');
            break;
          case 'en':
            state = const Locale('en');
            break;
          default:
            state = const Locale('de');
        }
      }
    } catch (e) {
      // If there's an error loading the locale, default to German
      state = const Locale('de');
    }
  }

  /// Set the app locale and save it to shared preferences
  Future<void> setLocale(Locale locale) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_localeKey, locale.languageCode);
      state = locale;
    } catch (e) {
      // Handle error silently, but update state anyway
      state = locale;
    }
  }

  /// Set locale to English
  Future<void> setEnglish() async {
    await setLocale(const Locale('en'));
  }

  /// Set locale to German
  Future<void> setGerman() async {
    await setLocale(const Locale('de'));
  }

  /// Check if current locale is German
  bool get isGerman => state.languageCode == 'de';

  /// Check if current locale is English
  bool get isEnglish => state.languageCode == 'en';
}

/// Global locale provider
final localeProvider = StateNotifierProvider<LocaleNotifier, Locale>((ref) {
  return LocaleNotifier();
});