import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';

import '../../providers/contacts_notifier.dart';
import '../bottom_sheet/bottomSheet.dart';
import 'appbar_title_size.dart';

class CustomMenu extends StatelessWidget {
  const CustomMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isMobile = ResponsiveBreakpoints.of(context).equals("MOBILE");
    double titleSize = getAppbarTitleSize(context);
    return PopupMenuButton(
      child: (!isMobile)
          ? Padding(
              padding: EdgeInsets.all(20),
              child: Icon(Icons.menu, size: titleSize))
          : null,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      onSelected: (String choice) {
        if (choice == "Add contact") {
          showModalBottomSheet(
            context: context,
            constraints: BoxConstraints(
              maxWidth: double.maxFinite,
            ),
            builder: (BuildContext buildSheetContext) {
              return BuildBottom();
            },
          );
        } else if (choice == "Delete contact") {
          ContactsNotifier contactsList =
              Provider.of<ContactsNotifier>(context, listen: false);
          contactsList.setContacts();
          Navigator.pushNamed(context, "/delete");
        } else if (choice == "Settings") {
          ContactsNotifier contactsList =
              Provider.of<ContactsNotifier>(context, listen: false);
          contactsList.setContacts();
          Navigator.pushNamed(context, "/settings");
        }
      },
      itemBuilder: (BuildContext context) {
        return [
          const PopupMenuItem<String>(
            value: 'Add contact',
            child: Text('Add contact'),
          ),
          const PopupMenuItem<String>(
            value: 'Delete contact',
            child: Text('Delete contact'),
          ),
          const PopupMenuItem<String>(
            value: 'Settings',
            child: Text('Settings'),
          ),
        ];
      },
    );
  }
}
