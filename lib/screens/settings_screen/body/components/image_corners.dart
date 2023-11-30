import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../providers/image_corner.dart';

class ImageCorners extends StatefulWidget {
  const ImageCorners({super.key});

  @override
  State<ImageCorners> createState() => _ImageCornersState();
}

class _ImageCornersState extends State<ImageCorners> {
  Future<double> getImageCorner() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getDouble("image_corner_value") ?? 25;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ImageCornerProvider>(
      builder: (context, corner, child) => Expanded(
          child: FutureBuilder(
        builder: (ctx, snapshot) {
          double val = corner.image_corner ?? snapshot.data ?? 25;
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
                  max: 100,
                  onChanged: (value) async {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    prefs.setDouble("image_corner_value", value);
                    corner.setImageCorner(value);
                  },
                ),
              ),
              Center(
                child: Container(
                  width: 140,
                  height: 122,
                  decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(val),
                  ),
                ),
              ),
            ],
          );
        },
        future: getImageCorner(),
      )),
    );
  }
}
