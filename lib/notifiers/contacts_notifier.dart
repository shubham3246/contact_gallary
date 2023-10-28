import 'package:contact_gallary/save/delete.dart';
import 'package:contact_gallary/save/model/my_contacts.dart';
import 'package:contact_gallary/save/shared_prefs/save_get_prefs.dart';
import 'package:flutter/material.dart';

class ContactsNotifier extends ChangeNotifier {
  List<MyContacts> contacts = [];
  List<bool> checkBoxes = [];

  void setContacts() async {
    print("getting contacts");
    contacts = await getObjectsFromSharedPreferences();
    checkBoxes = List<bool>.filled(contacts.length, false);
    notifyListeners();
  }

  void toggleCheckboxes(int index) async {
    checkBoxes[index] = !checkBoxes[index];
    notifyListeners();
  }

  void deleteSelected() {
    List<MyContacts> temp = [];
    for (int index = 0; index < contacts.length; index++) {
      if (checkBoxes[index] == false) temp.add(contacts[index]);
    }
    // Todo : delete images before this
    Delete.deleteContacts(contacts, checkBoxes);
    saveObjectsInSharedPreferences(temp, false);
    setContacts();
  }
}
