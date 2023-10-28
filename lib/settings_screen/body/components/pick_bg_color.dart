import 'package:contact_gallary/settings_screen/body/components/bg_colors.dart';
import 'package:flutter/material.dart';

class PickBGColor extends StatefulWidget {
  const PickBGColor({super.key});
  @override
  State<PickBGColor> createState() => _PickBGColorState();
}

class _PickBGColorState extends State<PickBGColor> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        scrollDirection: Axis.vertical,
        children: const [
          Text(
            "Select Background Color :",
            style: TextStyle(fontSize: 18),
          ),
          Row(
            children: [
              BGColors(color: "red", bg: Colors.redAccent),
              BGColors(color: "yellow", bg: Colors.yellowAccent),
              BGColors(color: "green", bg: Colors.green),
              BGColors(color: "blue", bg: Colors.lightBlueAccent),
              BGColors(color: "purple", bg: Colors.purple),
            ],
          )
        ],
      ),
    );
  }
}
