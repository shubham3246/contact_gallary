import 'package:contact_gallary/components/themes/dark_theme.dart';
import 'package:contact_gallary/components/themes/light_theme.dart';
import 'package:contact_gallary/delete_screen/delete_screen.dart';
import 'package:contact_gallary/main_screen/main_screen.dart';
import 'package:contact_gallary/notifiers/contacts_notifier.dart';
import 'package:contact_gallary/notifiers/night_mode.dart';
import 'package:contact_gallary/settings_screen/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => NightMode()),
        ChangeNotifierProvider(create: (context) => ContactsNotifier()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<NightMode>(
      builder: (context, value, child) => MaterialApp(
        title: 'Contact Gallary',
        themeMode: ThemeMode.light,
        theme: (!value.selected) ? CustomLightTheme() : CustomDarkTheme(),
        initialRoute: "/",
        routes: {
          '/': (context) => const MainScreen(),
          '/delete': (context) => const DeleteScreen(),
          '/settings': (context) => const SettingsScreen(),
        },
      ),
    );
  }
}

// Todo : if no image provided then previous image is saved
// Todo : check image deletion
// Todo : error when crop is cut
