import 'package:contact_gallary/settings_screen/body/settings_body.dart';
import 'package:flutter/material.dart';

import 'package:contact_gallary/components/appbar/appbar.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: CustomAppBar(title: "Settings"),
      ),
      body: SettingsBody(),
    );
  }
}
