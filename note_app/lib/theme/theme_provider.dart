import 'package:flutter/material.dart';
import 'package:note_app/theme/theme.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData = lightmode;

  ThemeData get themeData => _themeData;

  bool get isDarkMode => _themeData == darktmode;

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  void toggleTheme() {
    if (_themeData == lightmode) {
      themeData = darktmode;
    } else {
      themeData = lightmode;
    }
  }
}
