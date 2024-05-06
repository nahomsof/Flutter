import 'package:flutter/material.dart';
import 'package:habititute/theme/dark_mode.dart';
import 'package:habititute/theme/light_mode.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData = lightMOde;

  ThemeData get themeData => _themeData;

  bool get isDarkMode => _themeData == darkMode;

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  void toggleTheme() {
    if (_themeData == lightMOde) {
      themeData = darkMode;
    } else {
      themeData = lightMOde;
    }
  }
}
