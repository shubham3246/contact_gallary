import 'package:flutter/material.dart';

class CallButton extends StatelessWidget {
  const CallButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // if (callBtnIcon[index] == true)
        Positioned(
          bottom: 7,
          right: 7,
          child: GestureDetector(
            onTap: () {
              // FlutterPhoneDirectCaller.callNumber(contacts[index].phone);
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
