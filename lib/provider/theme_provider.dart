import 'package:flutter/material.dart';

/// TODO 5 : Provider, ChangeNotifier, Logic

class ThemeProvider extends ChangeNotifier {
  ThemeMode _mode = ThemeMode.system;

  ThemeMode get mode => _mode;

  void change(ThemeMode theme) {
    _mode = theme;
    notifyListeners();
  }
}
