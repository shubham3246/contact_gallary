import 'package:flutter/material.dart';

class ContactSaved extends StatelessWidget {
  const ContactSaved({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 7.0),
      decoration: BoxDecoration(
        color: Colors.black26,
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Text(
        "Contact Saved",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
