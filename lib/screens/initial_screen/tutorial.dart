import 'package:contact_gallary/screens/initial_screen/page.dart';
import 'package:contact_gallary/utils/tutotial_text.dart';
import 'package:flutter/material.dart';

class TutorialScreen extends StatefulWidget {
  const TutorialScreen({super.key});
  @override
  State<TutorialScreen> createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
  final PageController controller = PageController();
  List<bool> tutorialsPages = [true] + List.filled(5, false);
  String tutorialText = TutorialText.points.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context)
                              .popUntil(ModalRoute.withName("/"));
                        },
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          margin: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              border: Border.all(width: 2, color: Colors.grey),
                              borderRadius: BorderRadius.circular(30)),
                          child: const Icon(
                            Icons.close,
                            color: Colors.black45,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: PageView(
                      controller: controller,
                      onPageChanged: (int val) {
                        setState(() {
                          tutorialText = TutorialText.points[val];
                          for (int i = 0; i < 6; i++) {
                            if (i == val)
                              tutorialsPages[i] = true;
                            else
                              tutorialsPages[i] = false;
                          }
                        });
                      },
                      children: [
                        for (int i = 0; i < 6; i++)
                          TutorialPage(
                              image: "assets/tutorials/tutorial_$i.gif"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  SizedBox(height: 16),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      for (int i = 0; i < 6; i++)
                        Icon((!tutorialsPages[i])
                            ? Icons.circle_outlined
                            : Icons.circle),
                    ],
                  ),
                  SizedBox(height: 16),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      tutorialText,
                      style: TextStyle(fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
