import 'package:direct_caller_sim_choice/direct_caller_sim_choice.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class CallButton extends StatefulWidget {
  CallButton({super.key, required this.number});
  String number;

  @override
  State<CallButton> createState() => _CallButtonState();
}

class _CallButtonState extends State<CallButton> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        for (int i = 1; i <= 1; i++)
          Positioned(
            bottom: 7,
            right: (i == 1) ? 7 : 70,
            child: GestureDetector(
              onTap: () async {
                if (await Permission.phone.request().isGranted) {
                  DirectCaller().makePhoneCall(widget.number, simSlot: i);
                } else {
                  // Permission is denied, request it again or handle the denial
                  // Request permission again or show a message to the user
                }
              },
              child: Container(
                width: 60, // Adjust the width as needed
                height: 60, // Adjust the height as needed
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.lightBlueAccent,
                ),
                child: const Icon(
                  Icons.call,
                  size: 28, // Adjust the icon size as needed
                  color: Colors.white,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
