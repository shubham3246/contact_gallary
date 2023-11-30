import 'package:contact_gallary/screens/settings_screen/body/components/pick_bg_color.dart';
import 'package:flutter/material.dart';

import 'components/image_corners.dart';

class SettingsBody extends StatelessWidget {
  const SettingsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          PickBGColor(),
          SizedBox(height: 40),
          ImageCorners(),
          // PickAppbarColor(),
          // SizedBox(height: 20),
        ],
      ),
    );
  }
}
