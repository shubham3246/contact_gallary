import 'dart:io';

import 'package:contact_gallary/notifiers/contacts_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainBodyContainers extends StatefulWidget {
  @override
  State<MainBodyContainers> createState() => _MainBodyContainersState();
}

class _MainBodyContainersState extends State<MainBodyContainers> {
  // List<bool> boolList = [];

  // List<bool> callBtnIcon() {
  @override
  void initState() {
    super.initState();
    ContactsNotifier contactsList =
        Provider.of<ContactsNotifier>(context, listen: false);
    contactsList.setContacts();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ContactsNotifier>(
      builder: (context, contactsList, child) => GridView.builder(
        padding: const EdgeInsets.only(left: 5, right: 5),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
          childAspectRatio: 5 / 4,
        ),
        itemCount: contactsList.contacts.length,
        itemBuilder: (context, index) {
          dynamic imagePath = contactsList.contacts[index].imagePath;

          return GestureDetector(
            onTap: () {
              // toggleCallBtn(index);
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                image: DecorationImage(
                  image: Image.file(File(imagePath)).image,
                  fit: BoxFit.cover,
                ),
              ),
              // child: CallButton(
              //     contacts: widget.contacts,
              //     callBtnIcon: callBtnIcon(),
              //     index: index),
            ),
          );
        },
      ),
    );
  }
}
