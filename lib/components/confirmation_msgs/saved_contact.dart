import 'package:flutter/material.dart';

// Widget contactSaved({contact_saved}) {
//   return
// }

class ContactSaved extends StatelessWidget {
  ContactSaved({super.key, required this.contact_saved});
  bool contact_saved;

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.black,
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 7.0),
      decoration: BoxDecoration(
        color: (contact_saved) ? Colors.black26 : null,
        borderRadius: BorderRadius.circular(20),
      ),
      child: (contact_saved)
          ? const Text(
              "Contact Saved",
              style: TextStyle(
                color: Colors.white,
              ),
            )
          : null,
    );
  }
}
