import 'dart:io';

import 'package:contact_gallary/save/model/my_contacts.dart';
import 'package:contact_gallary/save/shared_prefs/save_get_prefs.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SaveContacts {
  static Future<bool> saveContact(String name, String phoneNo) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    try {
      //get the path where image is cached
      final appCacheDir = await getTemporaryDirectory();
      String targetPath = '${appCacheDir.path}/compressed_image.jpg';

      //get the file number
      int fileNumber = prefs.getInt("file_number") ?? 0;
      //validate
      if (phoneNo.isEmpty || name.isEmpty) return false;

      final imageFile = File(targetPath);
      //get the path where image will be stored permanently
      final appDocDir = await getApplicationDocumentsDirectory();
      final localPath = appDocDir.path;

      //get a new file name
      final fileName = 'my_image$fileNumber.jpg';
      File updatedImage = await imageFile.copy('$localPath/$fileName');
      MyContacts newContact =
          MyContacts(phone: phoneNo, imagePath: updatedImage.path, name: name);

      List<MyContacts> contactsList = await getObjectsFromSharedPreferences();
      contactsList.add(newContact);
      saveObjectsInSharedPreferences(contactsList, true);
      return true;
    } catch (e) {
      return false;
    }
  }
}
