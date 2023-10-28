// import 'package:contact_gallary/save/shared_prefs/theme_mode.dart';
import 'package:contact_gallary/components/themes/themes.dart';
import 'package:flutter/material.dart';

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
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Themes.accentLight,
      foregroundColor: Colors.black54,
    ),
  );

  ThemeData get customTheme => _customTheme;

  void setTheme(String theme, String? bgColor, String? appbarColor) {
    if (theme == "dark") {
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
      if (bgColor != null) {
        switch (bgColor) {
          case "red":
            _customTheme = customBodyColor(Colors.redAccent);
            break;
          case "yellow":
            _customTheme = customBodyColor(Colors.yellowAccent);
            break;
          case "green":
            _customTheme = customBodyColor(Colors.greenAccent);
            break;
          case "blue":
            _customTheme = customBodyColor(Colors.lightBlueAccent);
            break;
          case "purple":
            _customTheme = customBodyColor(Colors.purple);
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

  dynamic customBodyColor(dynamic color) {
    return _customTheme.copyWith(
      scaffoldBackgroundColor: color, //body
    );
  }

  dynamic customAppbarColor(dynamic color) {
    return _customTheme.copyWith(
        appBarTheme: AppBarTheme(backgroundColor: color));
  }
}
