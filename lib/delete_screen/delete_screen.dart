import 'package:contact_gallary/components/appbar/appbar.dart';
import 'package:flutter/material.dart';

import 'package:contact_gallary/delete_screen/body/delete_body.dart';

class DeleteScreen extends StatelessWidget {
  const DeleteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: CustomAppBar(title: "Delete Contacts"),
      ),
      body: DeleteBody(),
    );
  }
}
