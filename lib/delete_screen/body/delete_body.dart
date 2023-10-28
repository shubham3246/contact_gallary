import 'dart:io';

import 'package:contact_gallary/notifiers/contacts_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DeleteBody extends StatelessWidget {
  const DeleteBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ContactsNotifier>(
      builder: (context, value, child) => ListView.builder(
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
              style: const TextStyle(fontSize: 19),
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
