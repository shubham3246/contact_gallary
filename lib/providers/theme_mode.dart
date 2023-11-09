// import 'package:contact_gallary/save/shared_prefs/theme_mode.dart';
import 'package:contact_gallary/components/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NightMode extends ChangeNotifier {
  ThemeData _customTheme = ThemeData(
    useMaterial3: true,
    fontFamily: "Poppins",
    brightness: Brightness.light,
    scaffoldBackgroundColor: Themes.bodyLight, //body
    appBarTheme: const AppBarTheme(
      backgroundColor: Themes.appbarLight,
    ),
    sliderTheme: SliderThemeData(overlayShape: SliderComponentShape.noOverlay),
    // textTheme: const TextTheme(bodySmall: TextStyle(color: Colors.black54)),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Themes.accentLight,
      foregroundColor: Colors.black54,
    ),
  );

  ThemeData get customTheme => _customTheme;

  bool _isLightThemeMode = true;
  bool get isLightThemeMode => _isLightThemeMode;

  void setTheme(String theme, String? uiColor, String? appbarColor) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("themeMode", theme);

    if (theme == "dark") {
      _isLightThemeMode = false;
      _customTheme = _customTheme.copyWith(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Themes.bodyDark, //body
        appBarTheme: const AppBarTheme(
            backgroundColor: Themes.appbarDark, foregroundColor: Colors.white),
        textTheme: const TextTheme(bodySmall: TextStyle(color: Colors.white)),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Themes.buttonDark,
          foregroundColor: Colors.white,
        ),
      );
    } else if (theme == "light") {
      _isLightThemeMode = true;
      _customTheme = _customTheme.copyWith(
        brightness: Brightness.light,
        scaffoldBackgroundColor: Themes.bodyLight, //body
        appBarTheme: const AppBarTheme(backgroundColor: Themes.appbarLight),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.black),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Themes.accentLight,
          foregroundColor: Colors.black54,
        ),
      );
    } else if (theme == "custom") {
      if (uiColor != null) {
        prefs.setString("customThemeColors", uiColor);
        switch (uiColor) {
          case "red":
            _customTheme = customBodyColor(Color(0xff011b2b), Color(0xff987c8a),
                Color(0xffffffff), Color(0xffffffff), false);
            break;
          case "yellow":
            _customTheme = customBodyColor(Color(0xff486280), Color(0xffdfc1d0),
                Color(0xffffffff), Color(0xff000000), true);
            break;
          case "green":
            _customTheme = customBodyColor(Color(0xffe19b51), Color(0xffe9d5cd),
                Color(0xffffffff), Color(0xff000000), true);
            break;
          case "blue":
            _customTheme = customBodyColor(Color(0xff7be3e4), Color(0xffffffff),
                Color(0xff000000), Color(0xff000000), true);
            break;
          case "purple":
            _customTheme = customBodyColor(Color(0xff0c104f), Color(0xff4ba6bc),
                Color(0xffffffff), Color(0xffffffff), true);
            break;
        }
      } else if (appbarColor != null) {
        switch (appbarColor) {
          case "red":
            _customTheme = customAppbarColor(Colors.redAccent);
            break;
          case "yellow":
            _customTheme = customAppbarColor(Colors.yellowAccent);
            break;
          case "green":
            _customTheme = customAppbarColor(Colors.greenAccent);
            break;
          case "blue":
            _customTheme = customAppbarColor(Colors.lightBlueAccent);
            break;
          case "purple":
            _customTheme = customAppbarColor(Colors.purple);
            break;
        }
      }
    }

    notifyListeners();
  }

  dynamic customBodyColor(Color colorA, Color colorB, Color colorTextA,
      Color colorTextB, bool isLight) {
    _isLightThemeMode = isLight;

    return _customTheme.copyWith(
      scaffoldBackgroundColor: colorB, //body
      appBarTheme:
          AppBarTheme(backgroundColor: colorA, foregroundColor: colorTextA),
      textTheme: TextTheme(
        bodyMedium: TextStyle(color: colorTextB),
      ), //appbar
    );
  }

  dynamic customAppbarColor(dynamic color) {
    return _customTheme.copyWith(
      appBarTheme: AppBarTheme(backgroundColor: color),
    );
  }
}
