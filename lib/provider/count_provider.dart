import 'package:flutter/foundation.dart';

/// TODO 1 : Provider, ChangeNotifier, Logic

class CountProvider extends ChangeNotifier {
  int _number = 0;

  int get number => _number;

  void increment() {
    _number++;
    notifyListeners();
  }

  void decrement() {
    _number--;
    notifyListeners();
  }
}
