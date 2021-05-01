import 'package:shared_preferences/shared_preferences.dart';

class ModeProvider {
  static SharedPreferences sharedPreferences;
  static Future<SharedPreferences> init() async {
    return sharedPreferences = await SharedPreferences.getInstance();
  }

  bool getBool(String key) {
    return sharedPreferences.getBool(key);
  }

  Future<bool> putBool(String key, dynamic value) async {
    return await sharedPreferences.setBool(key, value);
  }
}
