// import 'package:shared_preferences/shared_preferences.dart';

// class StorageService {
//   static const _tokenKey = 'token';
//
//   static Future<void> saveToken(String token) async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setString(_tokenKey, token);
//   }
//
//   static Future<String?> getToken() async {
//     final prefs = await SharedPreferences.getInstance();
//     return prefs.getString(_tokenKey);
//   }
//
//   static Future<void> clearToken() async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.remove(_tokenKey);
//   }
// }

import 'package:get_storage/get_storage.dart';

class StorageService {
  static final _box = GetStorage();

  static String? get token => _box.read('token');

  static bool get isLoggedIn => token != null && token!.isNotEmpty;

  static Future<void> saveToken(String token) async {
    await _box.write('token', token);
  }

  static Future<void> clearToken() async {
    await _box.remove('token');
  }

  static Future<int> getUserID() async {
    return await _box.read("user_id");
  }
}
