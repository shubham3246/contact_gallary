import 'dart:io';

import 'package:contact_gallary/providers/contacts_notifier.dart';
import 'package:contact_gallary/providers/theme_mode.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DeleteBody extends StatefulWidget {
  const DeleteBody({Key? key}) : super(key: key);

  @override
  State<DeleteBody> createState() => _DeleteBodyState();
}

class _DeleteBodyState extends State<DeleteBody> {
  @override
  void initState() {
    super.initState();
    ContactsNotifier contactsList =
        Provider.of<ContactsNotifier>(context, listen: false);
    contactsList.setContacts();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<ContactsNotifier, NightMode>(
      builder: (context, value, nightMode, child) => ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            visualDensity: const VisualDensity(vertical: 4),
            leading: CircleAvatar(
              backgroundImage:
                  Image.file(File(value.contacts[index].imagePath)).image,
              radius: 28.0,
            ),
            title: Text(
              value.contacts[index].name,
              style: TextStyle(
                fontSize: 19,
                color: (nightMode.isLightThemeMode)
                    ? Colors.black87
                    : Colors.white,
              ),
            ),
            trailing: Checkbox(
              value: value.checkBoxes[index],
              onChanged: (newVal) {
                //TODO : check if every time we come, is the checkbox true or false
                value.toggleCheckboxes(index);
              },
            ),
          );
        },
        itemCount: value.contacts.length,
      ),
    );
  }
}
