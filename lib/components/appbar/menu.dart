import 'package:contact_gallary/components/bottom_sheet/bottomSheet.dart';
import 'package:flutter/material.dart';

class CustomMenu extends StatelessWidget {
  const CustomMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      onSelected: (String choice) {
        if (choice == "Add contact") {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext buildSheetContext) {
              return BuildBottom();
            },
          );
        } else if (choice == "Delete contact") {
          Navigator.pushNamed(context, "/delete");
        } else if (choice == "Settings") {
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
