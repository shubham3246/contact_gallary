import 'package:flutter/material.dart';

class ImageCornerProvider extends ChangeNotifier {
  double? _image_corner;
  double? get image_corner => _image_corner;

  void setImageCorner(double val) {
    _image_corner = val;
    notifyListeners();
  }
}
