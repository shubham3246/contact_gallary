import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class CallButton extends StatelessWidget {
  CallButton({super.key, required this.number});
  String number;

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
              FlutterPhoneDirectCaller.callNumber(number);
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
