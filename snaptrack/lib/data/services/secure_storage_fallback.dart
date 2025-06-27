import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SecureStorageFallback {
  static const _secureStorage = FlutterSecureStorage();
  static const String _keyPrefix = 'api_key_';
  
  static Future<String?> read({required String key}) async {
    try {
      // Try secure storage first
      return await _secureStorage.read(key: key);
    } catch (e) {
      // Fallback to SharedPreferences if keyring fails
      print('Keyring failed, using SharedPreferences fallback: $e');
      final prefs = await SharedPreferences.getInstance();
      return prefs.getString('$_keyPrefix$key');
    }
  }
  
  static Future<void> write({required String key, required String value}) async {
    try {
      // Try secure storage first
      await _secureStorage.write(key: key, value: value);
    } catch (e) {
      // Fallback to SharedPreferences if keyring fails
      print('Keyring failed, using SharedPreferences fallback: $e');
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('$_keyPrefix$key', value);
    }
  }
  
  static Future<void> delete({required String key}) async {
    try {
      // Try secure storage first
      await _secureStorage.delete(key: key);
    } catch (e) {
      // Fallback to SharedPreferences if keyring fails
      print('Keyring failed, using SharedPreferences fallback: $e');
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove('$_keyPrefix$key');
    }
  }
  
  static Future<bool> containsKey({required String key}) async {
    try {
      // Try secure storage first
      final value = await _secureStorage.read(key: key);
      return value != null;
    } catch (e) {
      // Fallback to SharedPreferences if keyring fails
      print('Keyring failed, using SharedPreferences fallback: $e');
      final prefs = await SharedPreferences.getInstance();
      return prefs.containsKey('$_keyPrefix$key');
    }
  }
}