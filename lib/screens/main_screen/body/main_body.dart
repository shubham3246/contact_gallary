import 'dart:io';

import 'package:contact_gallary/providers/contacts_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';

import '../../../components/appbar/appbar_title_size.dart';
import 'call_btn.dart';

class MainBodyContainers extends StatefulWidget {
  @override
  State<MainBodyContainers> createState() => _MainBodyContainersState();
}

class _MainBodyContainersState extends State<MainBodyContainers> {
  @override
  void initState() {
    super.initState();
    ContactsNotifier contactsList =
        Provider.of<ContactsNotifier>(context, listen: false);
    contactsList.setContacts();
  }

  @override
  Widget build(BuildContext context) {
    double titleSize = getAppbarTitleSize(context);
    final bool isMobile = ResponsiveBreakpoints.of(context).equals("MOBILE");
    final bool isTab7 = ResponsiveBreakpoints.of(context).equals("TAB7");

    return Consumer<ContactsNotifier>(builder: (context, contactsList, child) {
      if (contactsList.contacts.isEmpty) {
        return Center(
            child: Text("Add new Contacts.",
                style: TextStyle(fontSize: titleSize - 3)));
      }

      return GridView.builder(
        padding: const EdgeInsets.only(left: 5, right: 5),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: (!isMobile)
              ? (isTab7)
                  ? 3
                  : 4
              : 2,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
          childAspectRatio: 5 / 4,
          mainAxisExtent: 150,
        ),
        itemCount: contactsList.contacts.length,
        itemBuilder: (context, index) {
          dynamic imagePath = contactsList.contacts[index].imagePath;
          return GestureDetector(
            onTap: () {
              contactsList.toggleRadioBtns(index);
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                image: DecorationImage(
                  image: Image.file(File(imagePath)).image,
                  fit: BoxFit.cover,
                ),
              ),
              child: (contactsList.checkBoxes[index])
                  ? CallButton(number: contactsList.contacts[index].phone)
                  : null,
            ),
          );
        },
      );
    });
  }
}
