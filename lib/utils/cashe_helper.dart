import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static SharedPreferences? prefs;

  static init() async {
    prefs = await SharedPreferences.getInstance();
  }

  // Save methods
  static Future<bool> saveString(String key, String value) async {
    return await prefs!.setString(key, value);
  }

  static Future<bool> saveInt(String key, int value) async {
    return await prefs!.setInt(key, value);
  }

  static Future<bool> saveBool(String key, bool value) async {
    return await prefs!.setBool(key, value);
  }

  // Get methods
  static String? getString(String key) {
    return prefs?.getString(key);
  }

  static int? getInt(String key) {
    return prefs?.getInt(key);
  }

  static bool? getBool(String key) {
    return prefs?.getBool(key);
  }

  // Test SharedPreferences values
  static testSharedPreferences() {
    print('token  ${getString('token')}');
    print('user_id  ${getString('user_id')}');
    print('labels  ${getString('labels')}');
  }
}
