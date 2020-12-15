import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode _mode = ThemeMode.light;

  ThemeMode get mode => this._mode;

  void change(ThemeMode theme) {
    this._mode = theme;
    notifyListeners();
  }
}
