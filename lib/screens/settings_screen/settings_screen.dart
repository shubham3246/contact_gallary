import 'package:contact_gallary/components/appbar/appbar.dart';
import 'package:contact_gallary/screens/settings_screen/body/settings_body.dart';
import 'package:flutter/material.dart';

import '../../components/appbar/appbar_height.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = getAppbarHeight(context);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height),
        child: CustomAppBar(title: "Settings"),
      ),
      body: SettingsBody(),
    );
  }
}
