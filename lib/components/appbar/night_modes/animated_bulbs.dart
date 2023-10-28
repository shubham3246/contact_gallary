import 'package:flutter/material.dart';

Expanded AnimatedBulb() {
  return Expanded(
    child: Row(
      children: [
        // GestureDetector(
        //   onTap: () {
        //     setState(() {
        //       selected = !selected;
        //     });
        //   },
        //   child: AnimatedContainer(
        //     alignment: selected
        //         ? Alignment(-2, -2)
        //         : AlignmentDirectional.topStart,
        //     duration: const Duration(seconds: 2),
        //     curve: Curves.bounceInOut,
        //     child: SvgPicture.asset(
        //       'assets/bulb1.svg',
        //       semanticsLabel: 'Acme Logo',
        //       height: 160,
        //       width: 120,
        //     ),
        //   ),
        // ),
        // GestureDetector(
        //   onTap: () {
        //     setState(() {
        //       selected = !selected;
        //     });
        //   },
        //   child: AnimatedContainer(
        //     alignment: selected
        //         ? AlignmentDirectional.topEnd
        //         : Alignment(-2, -2),
        //     duration: const Duration(seconds: 2),
        //     curve: Curves.bounceInOut,
        //     child: SvgPicture.asset(
        //       'assets/bulb2.svg',
        //       semanticsLabel: 'Acme Logo',
        //       height: 160,
        //       width: 120,
        //     ),
        //   ),
        // ),
      ],
    ),
  );
}
