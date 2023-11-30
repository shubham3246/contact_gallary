import 'package:contact_gallary/save/delete.dart';
import 'package:contact_gallary/save/model/my_contacts.dart';
import 'package:contact_gallary/save/shared_prefs/save_get_prefs.dart';
import 'package:flutter/material.dart';

class ContactsNotifier extends ChangeNotifier {
  List<MyContacts> contacts = [];

  //same check boxes are use for call icon visibility and delete checkboxes
  List<bool> checkBoxes = [];

  void setContacts() async {
    print("inside setcontact");
    contacts = await getObjectsFromSharedPreferences();
    checkBoxes = List<bool>.filled(contacts.length, false);
    print(checkBoxes.length);
    notifyListeners();
  }

  //for delete screen checkboxes
  void toggleCheckboxes(int index) async {
    checkBoxes[index] = !checkBoxes[index];
    notifyListeners();
  }

  //for call btn icon visibility
  void toggleRadioBtns(int index) async {
    for (int i = 0; i < checkBoxes.length; i++) {
      if (i == index)
        checkBoxes[i] = true;
      else
        checkBoxes[i] = false;
    }
    notifyListeners();
  }

  void deleteSelected() {
    List<MyContacts> temp = [];
    for (int index = 0; index < contacts.length; index++) {
      if (checkBoxes[index] == false) temp.add(contacts[index]);
    }

    Delete.deleteContacts(contacts, checkBoxes);
    saveObjectsInSharedPreferences(temp, false);
    setContacts();
  }
}
