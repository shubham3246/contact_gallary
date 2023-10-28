import 'dart:io';

import 'package:contact_gallary/save/model/my_contacts.dart';

class Delete {
  static void deleteContacts(List<MyContacts> contacts, List<bool> checkboxes) {
    for (int i = 0; i < contacts.length; i++) {
      if (checkboxes[i] == true) {
        File(contacts[i].imagePath).deleteSync();
      }
    }
  }
}
