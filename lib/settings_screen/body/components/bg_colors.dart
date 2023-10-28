import 'package:contact_gallary/notifiers/theme_mode.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BGColors extends StatelessWidget {
  const BGColors({super.key, required this.color, required this.bg});
  final String color;
  final bg;

  @override
  Widget build(BuildContext context) {
    return Consumer<NightMode>(
      builder: (context, value, child) => GestureDetector(
        onTap: () {
          value.setTheme("custom", color, null);
        },
        child: CircleAvatar(radius: 20, backgroundColor: bg),
      ),
    );
  }
}
