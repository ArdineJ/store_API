import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static const _keyToken = 'token';
  static const _isLogin = 'isLogin';

  static Future<SharedPreferences> get _prefs async =>
      await SharedPreferences.getInstance();

  static Future<void> saveToken(String token) async {
    final prefs = await _prefs;
    await prefs.setString(_keyToken, token);
  }

  static Future<String> getToken() async {
    final prefs = await _prefs;
    return prefs.getString(_keyToken) ?? '';
  }

  static Future<void> updateLogin(bool isLogin) async {
    final prefs = await _prefs;
    await prefs.setBool(_isLogin, isLogin);
  }

  static Future<bool> getIsLogin() async {
    final prefs = await _prefs;
    return prefs.getBool(_isLogin) ?? false;
  }
}
