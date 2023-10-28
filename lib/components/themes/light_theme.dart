import 'package:contact_gallary/components/themes/themes.dart';
import 'package:flutter/material.dart';

ThemeData CustomLightTheme() {
  return ThemeData(
    useMaterial3: true,
    fontFamily: "Poppins",
    brightness: Brightness.light,
    scaffoldBackgroundColor: Themes.bodyLight, //body
    appBarTheme: const AppBarTheme(backgroundColor: Themes.appbarLight),
    sliderTheme: SliderThemeData(overlayShape: SliderComponentShape.noOverlay),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Themes.accentLight,
      foregroundColor: Colors.black54,
    ),
  );
}
