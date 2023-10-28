import 'package:contact_gallary/components/appbar/appbar.dart';
import 'package:contact_gallary/main_screen/body/main_body.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
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
