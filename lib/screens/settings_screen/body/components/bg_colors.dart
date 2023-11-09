import 'package:contact_gallary/providers/theme_mode.dart';
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
        child: Container(
          margin: const EdgeInsets.only(right: 10),
          child: CircleAvatar(
            radius: 20,
            backgroundColor: Colors.black45,
            child: CircleAvatar(radius: 19, backgroundColor: bg),
          ),
        ),
      ),
    );
  }
}
