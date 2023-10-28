import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsNightMode {
  static void saveNightMode(bool selected) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("night_mode", selected);
  }

  static Future<bool> getNightMode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool("night_mode") ?? false;
  }
}
