import 'package:contact_gallary/components/appbar/appbar.dart';
import 'package:contact_gallary/components/appbar/appbar_height.dart';
import 'package:contact_gallary/screens/delete_screen/body/delete_body.dart';
import 'package:flutter/material.dart';

class DeleteScreen extends StatelessWidget {
  const DeleteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = getAppbarHeight(context);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height),
        child: CustomAppBar(title: "Delete Contacts"),
      ),
      body: DeleteBody(),
    );
  }
}
