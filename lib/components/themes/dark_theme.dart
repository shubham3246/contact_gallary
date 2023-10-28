import 'package:contact_gallary/components/themes/themes.dart';
import 'package:flutter/material.dart';

ThemeData CustomDarkTheme() {
  return ThemeData(
    useMaterial3: true,
    fontFamily: "Poppins",
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Themes.bodyDark, //body
    appBarTheme: const AppBarTheme(backgroundColor: Themes.appbarDark),

    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Themes.buttonDark, // button
      foregroundColor: Colors.grey, // button text
    ),
  );
}
