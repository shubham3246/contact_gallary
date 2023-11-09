import 'package:contact_gallary/components/appbar/appbar.dart';
import 'package:contact_gallary/screens/main_screen/body/main_body.dart';
import 'package:flutter/material.dart';

import '../../components/appbar/appbar_height.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = getAppbarHeight(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height),
        child: CustomAppBar(title: "Contacts"),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 4,
          ),
          Expanded(child: MainBodyContainers()),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
