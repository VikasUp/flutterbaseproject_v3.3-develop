import 'package:shared_preferences/shared_preferences.dart';

import '../injection_container.dart';

const String token = "token";

class SharedPreferenceHelper {
  static Future<String?> getToken() async {
    SharedPreferences prefs = serviceLocator<SharedPreferences>();
    return prefs.getString(token);
  }

  static Future<bool> setToken(String value) async {
    SharedPreferences prefs = serviceLocator<SharedPreferences>();
    return await prefs.setString(token, value);
  }

  static Future<bool> clear() async {
    SharedPreferences prefs = serviceLocator<SharedPreferences>();
    return prefs.clear();
  }
}
