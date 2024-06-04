import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  // prefs set
  static Future<void> set({
    required String key,
    required dynamic value,
    bool isJson = false,
  }) async {
    var sharedPreferences = await SharedPreferences.getInstance();
    if (isJson) {
      sharedPreferences.setString(key, jsonEncode(value.toString()));
    } else {
      sharedPreferences.setString(key, value.toString());
    }
  }

  // prefs get
  static Future<String?> get({
    required String key,
  }) async {
    var sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(key) ?? '';
  }

  // static Future<UserBody?> getUserBody() async {
  //   var sharedPreferences = await SharedPreferences.getInstance();
  //   final jsonString = sharedPreferences.getString('userInfo');
  //   if (jsonString != null) {
  //     final Map<String, dynamic> jsonMap = jsonDecode(jsonString);
  //     return UserBody.fromJson(jsonMap);
  //   } else {
  //     return null;
  //     // throw Exception('UserBody not found in SharedPreferences');
  //   }
  // }

  // prefs remove
  static Future<void> remove({
    required String key,
  }) async {
    var sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.remove(key);
  }

  // prefs clear all
  static Future<void> clear() async {
    var sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
  }
}
