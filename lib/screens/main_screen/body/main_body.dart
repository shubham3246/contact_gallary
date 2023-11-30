import 'dart:io';

import 'package:contact_gallary/providers/contacts_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../components/appbar/appbar_title_size.dart';
import '../../../components/bottom_sheet/dial_pad.dart';
import '../../../providers/image_corner.dart';
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

    Future<double> getImageCorner() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs.getDouble("image_corner_value") ?? 25;
    }

    ContactsNotifier contactsList =
        Provider.of<ContactsNotifier>(context, listen: false);
    contactsList.setContacts();

    return FutureBuilder(
        future: getImageCorner(),
        builder: (ctx, snapshot) {
          return Consumer<ContactsNotifier>(
            builder: (context, contactsList, child) {
              return Stack(
                children: [
                  (contactsList.contacts.isEmpty)
                      ? Center(
                          child: Text(
                            "Add new Contacts.",
                            style: TextStyle(fontSize: titleSize - 3),
                          ),
                        )
                      : GridView.builder(
                          padding:
                              const EdgeInsets.only(left: 6, right: 6, top: 2),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: (!isMobile)
                                ? (isTab7)
                                    ? 3
                                    : 4
                                : 2,
                            mainAxisSpacing: 6,
                            crossAxisSpacing: 6,
                            // if changing this aspect ratio,
                            // make sure to change in crop_image file too
                            childAspectRatio:
                                (snapshot.hasData && snapshot.data! > 40)
                                    ? 14 / 14
                                    : 14 / 13,
                            // mainAxisExtent: 200,
                          ),
                          itemCount: contactsList.contacts.length,
                          itemBuilder: (context, index) {
                            dynamic imagePath =
                                contactsList.contacts[index].imagePath;
                            return GestureDetector(
                              onTap: () {
                                contactsList.toggleRadioBtns(index);
                              },
                              child: Consumer<ImageCornerProvider>(
                                builder: (context, corner, child) => Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        corner.image_corner ??
                                            snapshot.data ??
                                            25),
                                    image: DecorationImage(
                                      image: Image.file(File(imagePath)).image,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  child:
                                      (contactsList.checkBoxes[index] == true)
                                          ?
                                          // Container(color: Colors.red)
                                          //     : null,
                                          CallButton(
                                              number: contactsList
                                                  .contacts[index].phone)
                                          : null,
                                ),
                              ),
                            );
                          },
                        ),
                  Align(
                    alignment: const FractionalOffset(0.9, 0.94),
                    child: GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          isScrollControlled: true,
                          context: context,
                          constraints: const BoxConstraints(
                            maxWidth: double.maxFinite,
                          ),
                          builder: (BuildContext buildSheetContext) {
                            return DialPad();
                          },
                        );
                      },
                      child: const CircleAvatar(
                        radius: 26,
                        backgroundColor: Colors.lightBlueAccent,
                        child: Icon(Icons.dialpad, size: 28),
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        });
  }
}
