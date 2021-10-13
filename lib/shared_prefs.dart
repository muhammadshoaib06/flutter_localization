import 'package:shared_preferences/shared_preferences.dart';

class MySharedPrefs {
  /// reference of Shared Preferences
  static SharedPreferences? _preferences;

  /// method to initialize the Shared Preferences.
  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  /// App Language
  /// English  &  Arabic are languages used in this app.
  /// Here create a field for language switching!
  /// Set Locale
  static Future<bool> setLocale({required bool langLocale}) async =>
      await _preferences!.setBool('langLocale', langLocale);

  /// Get Locale
  static bool? getLocale() => _preferences!.getBool('langLocale');

  /// Shared Preferences will be cleared when user logout from app.
  static Future clearSharedPreferences() async => _preferences!.clear();
}
