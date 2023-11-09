import 'package:contact_gallary/providers/contacts_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DeleteContacts extends StatelessWidget {
  const DeleteContacts({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ContactsNotifier>(
      builder: (context, contacts, child) => ElevatedButton(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          padding: MaterialStateProperty.all(EdgeInsets.all(0)),
          // backgroundColor: MaterialStateProperty.all(Colors.lightBlueAccent),
        ),
        onPressed: () {
          contacts.deleteSelected();
        },
        child: const Icon(
          Icons.delete,
          size: 32,
        ),
      ),
    );
  }
}
