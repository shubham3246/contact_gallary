import 'package:flutter/material.dart';

class TutorialPage extends StatelessWidget {
  const TutorialPage({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
      height: 300,
      padding: EdgeInsets.all(6),
      decoration: BoxDecoration(
        border: Border.all(width: 2, color: Color(0xff1e083e)),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Image.asset(image),
    );
  }
}
