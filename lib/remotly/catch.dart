import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CatchHelper {
  static SharedPreferences sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> putDAtaCatch({
    @required String key,
    @required bool value,
  }) async {
    return await sharedPreferences.setBool(key, value);
  }

  static bool getDAtaCatch({
    @required String key,
  }) {
    return sharedPreferences.get(key);
  }

}
