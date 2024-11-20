// ignore_for_file: constant_pattern_never_matches_value_type

import 'package:flutter/material.dart';

class ColorChanger with ChangeNotifier {
  // default color
  Color _color = Colors.blueAccent;

  Color get color => _color;
  void changeColor(String color) {
    switch (color) {
      case "red":
        _color = Colors.red;
        break;
      case "green":
        _color = Colors.green;
        break;
      case "pink":
        _color = Colors.pink;
        break;
      default:
    }
    notifyListeners();
  }
}
