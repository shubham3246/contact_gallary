import 'package:contact_gallary/settings_screen/body/components/image_corners.dart';
import 'package:flutter/material.dart';
import 'package:contact_gallary/settings_screen/body/components/pick_appbar_color.dart';
import 'package:contact_gallary/settings_screen/body/components/pick_bg_color.dart';

class SettingsBody extends StatelessWidget {
  const SettingsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          ImageCorners(),
          PickBGColor(),
          PickAppbarColor(),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
