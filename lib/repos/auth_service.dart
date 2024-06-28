import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:store_api/shared_pref/shared_preference.dart';

var client = http.Client();
var uri = 'https://fakestoreapi.com';

class AuthService {
  static Future<bool> login(
    String username,
    String password,
  ) async {
    try {
      var response = await client.post(Uri.parse('$uri/auth/login'),
          body: {'username': username, 'password': password});

      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);
        Preferences.saveToken(body['token']);
        Preferences.updateLogin(true);
        return await Preferences.getIsLogin();
      } else {
        print('Request failed with status: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      log(e.toString());
      return false;
    }
  }
}
