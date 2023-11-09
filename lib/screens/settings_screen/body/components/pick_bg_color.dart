import 'package:contact_gallary/screens/settings_screen/body/components/bg_colors.dart';
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
            "Select UI Color :",
            style: TextStyle(fontSize: 18),
          ),
          Row(
            children: [
              BGColors(color: "red", bg: Color(0xff011b2b)),
              BGColors(color: "yellow", bg: Color(0xff486280)),
              BGColors(color: "green", bg: Color(0xffe19b51)),
              BGColors(color: "blue", bg: Color(0xffffffff)),
              BGColors(color: "purple", bg: Color(0xff4ba6bc)),
            ],
          )
        ],
      ),
    );
  }
}
