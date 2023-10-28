import 'package:contact_gallary/components/appbar/night_modes/night_mode_switch.dart';
import 'package:flutter/material.dart';
import 'package:contact_gallary/components/appbar/delete_contacts/delete_contacts.dart';
import 'package:contact_gallary/components/appbar/menu.dart';

class CustomAppBar extends StatelessWidget {
  CustomAppBar({super.key, required this.title});
  String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: (title != "Contacts") ? false : true,
      leading: (title != "Contacts")
          ? GestureDetector(
              onTap: () {
                Navigator.of(context).popUntil(ModalRoute.withName("/"));
                // return Future.value(false);
              },
              child: const Icon(Icons.arrow_back),
            )
          : null,
      title: Text(title),
      actions: <Widget>[
        if (title == "Delete Contacts") DeleteContacts(),
        if (title == "Settings") NightModeSwitch(),
        CustomMenu(),
      ],
    );
  }
}
