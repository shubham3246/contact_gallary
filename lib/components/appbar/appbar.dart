import 'package:contact_gallary/components/appbar/appbar_title_size.dart';
import 'package:contact_gallary/components/appbar/delete_contacts/delete_contacts.dart';
import 'package:contact_gallary/components/appbar/menu.dart';
import 'package:contact_gallary/components/appbar/night_modes/night_mode_switch.dart';
import 'package:contact_gallary/providers/contacts_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'appbar_height.dart';

class CustomAppBar extends StatelessWidget {
  CustomAppBar({super.key, required this.title});
  String title;

  @override
  Widget build(BuildContext context) {
    double titleSize = getAppbarTitleSize(context);
    double height = getAppbarHeight(context);

    return Consumer<ContactsNotifier>(
      builder: (context, contactList, child) {
        int data = 0;
        for (int i = 0; i < contactList.checkBoxes.length; i++) {
          if (contactList.checkBoxes[i]) data++;
        }
        return AppBar(
          automaticallyImplyLeading: false,
          leadingWidth: 40,
          toolbarHeight: height,
          leading: (title != "Contacts")
              ? Row(children: [
                  SizedBox(width: 15),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).popUntil(ModalRoute.withName("/"));
                      // return Future.value(false);
                      contactList.setContacts();
                    },
                    child: const Icon(Icons.arrow_back),
                  ),
                ])
              : null,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(fontSize: titleSize)),
              if (title == "Delete Contacts")
                Text(
                  "$data Contacts selected",
                  style: TextStyle(fontSize: titleSize - 3),
                )
            ],
          ),
          actions: <Widget>[
            if (title == "Delete Contacts") DeleteContacts(),
            if (title == "Settings") NightModeSwitch(),
            CustomMenu(),
          ],
        );
      },
    );
  }
}
