import 'package:contact_gallary/providers/contacts_notifier.dart';
import 'package:contact_gallary/providers/theme_mode.dart';
import 'package:contact_gallary/screens/delete_screen/delete_screen.dart';
import 'package:contact_gallary/screens/main_screen/main_screen.dart';
import 'package:contact_gallary/screens/settings_screen/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/breakpoint.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => NightMode()),
        ChangeNotifierProvider(create: (context) => ContactsNotifier()),
      ],
      child: MyApp(prefs: prefs),
    ),
  );
}

class MyApp extends StatelessWidget {
  SharedPreferences prefs;
  MyApp({super.key, required this.prefs});

  @override
  Widget build(BuildContext context) {
    return Consumer<NightMode>(builder: (context, value, child) {
      void getTheme() {
        String themeMode = prefs.getString("themeMode") ?? "light";
        if (themeMode == "custom") {
          String? customColor = prefs.getString("customThemeColors");
          if (customColor != null) {
            value.setTheme("custom", customColor, null);
          }
        } else {
          value.setTheme(themeMode, null, null);
        }
      }

      getTheme();

      return MaterialApp(
        title: 'Contact Gallary',
        themeMode: ThemeMode.light,
        theme: value.customTheme,
        debugShowCheckedModeBanner: false,
        initialRoute: "/",
        routes: {
          '/': (context) => const MainScreen(),
          '/delete': (context) => const DeleteScreen(),
          '/settings': (context) => const SettingsScreen(),
        },
        builder: (context, widget) =>
            ResponsiveBreakpoints(child: widget!, breakpoints: const [
          Breakpoint(start: 0, end: 480, name: "MOBILE"),
          Breakpoint(start: 481, end: 800, name: "TAB7"),
          Breakpoint(start: 801, end: 1960, name: "TAB10"),
        ]),
      );
    });
  }
}

// Todo : if no image provided then previous image is saved
// Todo : check image deletion
// Todo : error when crop is cut
