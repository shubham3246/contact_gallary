import 'package:flutter/material.dart';

class ImageCorners extends StatefulWidget {
  const ImageCorners({super.key});

  @override
  State<ImageCorners> createState() => _ImageCornersState();
}

class _ImageCornersState extends State<ImageCorners> {
  double val = 0;
@override
    Widget build(BuildContext context) {
      return ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          const Text(
            "Image corners:",
            style: TextStyle(fontSize: 18),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Slider(
              value: val,
              min: 0,
              max: 25,
              onChanged: (value) {
                setState(() {
                  val = value;
                });
              },
            ),
          ),
          Center(
            child: Container(
              width: 100,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.redAccent,
                borderRadius: BorderRadius.circular(val),
              ),
            ),
          ),
        ],
      );
    }
}
