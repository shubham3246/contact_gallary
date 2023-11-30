import 'package:direct_caller_sim_choice/direct_caller_sim_choice.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class DialPad extends StatefulWidget {
  DialPad({super.key});

  @override
  State<DialPad> createState() => _DialPadState();
}

class _DialPadState extends State<DialPad> {
  Widget getText(int index) {
    String text = "";
    if (index == 9)
      text = '*';
    else if (index == 10)
      text = '0';
    else if (index == 11)
      text = '#';
    else
      text = (index + 1).toString();

    return GestureDetector(
      onTap: () {
        dialText += text;
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
            child: Text(
          "$text",
          style: TextStyle(fontSize: 20),
        )),
      ),
    );
  }

  String dialText = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      height: (dialText.isNotEmpty) ? 453 : 400,
      child: Column(
        children: [
          if (dialText.isNotEmpty) SizedBox(height: 24),
          if (dialText.isNotEmpty)
            Text(dialText, style: TextStyle(fontSize: 20)),
          GridView(
            padding: const EdgeInsets.only(left: 50, right: 50, top: 30),
            shrinkWrap: true,
            semanticChildCount: 12,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                childAspectRatio: 7 / 5),
            children: [for (int i = 0; i < 12; i++) getText(i)],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () async {
                  if (await Permission.phone.request().isGranted) {
                    DirectCaller().makePhoneCall(dialText);
                  } else {
                    // Permission is denied, request it again or handle the denial
                    // Request permission again or show a message to the user
                  }
                },
                child: Container(
                  width: 140,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.call_sharp),
                      //first sim button
                      // CallBtnIcon(dialText: dialText, sim: 1),
                      //divider
                      // if (snapshot.data! >= 2)
                      //   Container(
                      //     width: 1,
                      //     height: 40,
                      //     color: Colors.grey,
                      //   ),
                      //another sim button
                      // if (snapshot.data! >= 2)
                      //   CallBtnIcon(dialText: dialText, sim: 2),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 8),
              GestureDetector(
                onTap: () {
                  if (dialText.isNotEmpty) {
                    dialText = dialText.substring(0, dialText.length - 1);
                  }
                },
                child: CircleAvatar(
                  radius: 28,
                  backgroundColor: Colors.grey.shade300,
                  child: const Icon(
                    Icons.backspace,
                    size: 22,
                    color: Colors.black54,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
