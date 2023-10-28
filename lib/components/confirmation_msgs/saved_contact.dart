import 'package:flutter/material.dart';

Widget contactSaved({contact_saved}) {
  return Container(
    // color: Colors.black,
    padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 7.0),
    decoration: BoxDecoration(
      color: (contact_saved == false) ? Colors.transparent : Colors.black26,
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
