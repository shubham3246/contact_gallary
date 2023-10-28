import 'dart:io';

import 'package:contact_gallary/components/confirmation_msgs/saved_contact.dart';
import 'package:contact_gallary/notifiers/contacts_notifier.dart';
import 'package:contact_gallary/save/file_operations/select_image.dart';
import 'package:contact_gallary/save/save.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BuildBottom extends StatefulWidget {
  @override
  State<BuildBottom> createState() => _BuildBottomState();
}

class _BuildBottomState extends State<BuildBottom> {
  String phoneNo = "";
  String name = "";
  String tempImagePath = "";
  bool contact_saved = false;

  @override
  Widget build(BuildContext bottomContext) {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      padding: const EdgeInsets.only(left: 20, right: 25),
      child: Column(
        children: [
          TextField(
            onChanged: (newText) {
              name = newText;
            },
            decoration: const InputDecoration(
              hintText: "Enter your name",
              hintStyle: TextStyle(color: Colors.grey),
            ),
          ),
          TextField(
            onChanged: (newText) {
              phoneNo = newText;
            },
            decoration: const InputDecoration(
              hintText: "Enter your phone number",
              hintStyle: TextStyle(color: Colors.grey),
            ),
            keyboardType: TextInputType.number,
          ),
          GestureDetector(
            onTap: () async {
              String tempPath = await selectImage();
              // validation if returns null
              setState(() {
                tempImagePath = tempPath;
                // print(tempPath);
              });
            },
            child: (tempImagePath.isNotEmpty)
                ? Image.file(File(tempImagePath), width: 170, height: 170)
                : const Icon(
                    Icons.image,
                    size: 100,
                    color: Colors.lightBlueAccent,
                  ),
          ),
          Consumer<ContactsNotifier>(
            builder: (context, newList, child) => ElevatedButton(
              onPressed: () async {
                bool saved = await SaveContacts.saveContact(name, phoneNo);
                if (saved == true) {
                  setState(() {
                    contact_saved = true;
                  });
                  newList.setContacts();
                  Future.delayed(
                    Duration(milliseconds: 11),
                    () => {
                      setState(() {
                        contact_saved = false;
                      })
                    },
                  );
                  Future.delayed(
                    Duration(milliseconds: 14),
                    () => Navigator.pop(bottomContext),
                  );
                }
              },
              child: const Text("Save"),
            ),
          ),
          contactSaved(contact_saved: contact_saved)
        ],
      ),
    );
  }
}
