import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsNightMode {
  static void saveNightModePrefs(
      String theme, String? bg, String? color) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (theme == "night") {
      prefs.setBool("night_mode", true);
    } else if (theme == "light") {
      prefs.setBool("night_mode", false);
    } else if (theme == "custom") {
      if (bg != null) prefs.setString("custom_theme_bg", bg);
      if (color != null) prefs.setString("custom_theme_color", color);
    }
  }

  Future<List> getNightModePrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? night = prefs.getBool("night_mode");
    if (night != null) {
      if (night == true)
        return ["dark", null, null];
      else
        return ["light", null, null];
    } else {
      String? customBg = prefs.getString("custom_theme_bg");
      String? customColor = prefs.getString("custom_theme_color");

      if (customBg != null && customColor != null)
        return ["custom", customBg, customColor];
      else if (customBg != null)
        return ["custom", customBg, null];
      else if (customColor != null)
        return ["custom", null, customColor];
      else
        return ["light", null, null];
    }
  }
}
