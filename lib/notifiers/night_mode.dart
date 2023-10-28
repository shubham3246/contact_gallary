// import 'package:contact_gallary/save/shared_prefs/night_mode.dart';
import 'package:flutter/material.dart';

class NightMode extends ChangeNotifier {
  // Future<bool> _selected = SharedPrefsNightMode.getNightMode();
  bool _selected = false;
  bool get selected => _selected;

  void toggleNightMode() {
    _selected = !_selected;
    notifyListeners();
  }
}
