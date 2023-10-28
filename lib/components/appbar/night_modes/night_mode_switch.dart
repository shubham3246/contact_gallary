import 'package:contact_gallary/notifiers/night_mode.dart';
import "package:flutter/material.dart";
import "package:provider/provider.dart";

class NightModeSwitch extends StatelessWidget {
  const NightModeSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<NightMode>(
      builder: (context, value, child) => Switch(
        value: value.selected,
        activeColor: Colors.red,
        activeTrackColor: Color(0xFF2A2449),
        inactiveTrackColor: Color(0xFF60CBFF),
        inactiveThumbImage: AssetImage("assets/sun.png"),
        activeThumbImage: AssetImage("assets/moon.jpg"),
        onChanged: (val) {
          final counter = context.read<NightMode>();
          counter.toggleNightMode();
        },
      ),
    );
  }
}
