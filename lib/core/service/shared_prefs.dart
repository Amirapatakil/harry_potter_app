import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  void save({required String key, required String value}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  Future<String> read({required String key, String? value}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    value = prefs.getString(key) ?? '';
    return value;
  }
}

abstract class PrefsKeys {
  static const String user = 'user_key';
  static const String password = 'password_key';
}
