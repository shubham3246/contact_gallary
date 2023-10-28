import 'dart:convert';

import 'package:contact_gallary/save/model/my_contacts.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Retrieve the object from SharedPreferences
Future<List<MyContacts>> getObjectsFromSharedPreferences() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final jsonList = prefs.getStringList('my_contacts');
  if (jsonList != null) {
    return jsonList.map((jsonStr) {
      final jsonMap = json.decode(jsonStr);
      return MyContacts.fromJson(jsonMap);
    }).toList();
  }
  return [];
}

//Save new contact
Future<void> saveObjectsInSharedPreferences(
    List<MyContacts> objects, bool check) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final jsonList = objects.map((obj) => json.encode(obj.toJson())).toList();
  try {
    await prefs.setStringList('my_contacts', jsonList);
  } catch (e) {
    return;
  }

  //file gets saved so increase file number if its invoked by bottom sheet
  if (check == true) {
    int fileNumber = prefs.getInt("file_number") ?? 0;
    prefs.setInt("file_number", fileNumber + 1);
  }
}
