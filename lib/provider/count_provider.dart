import 'package:flutter/foundation.dart';

class CountProvider extends ChangeNotifier {
  int _number = 0;

  int get number => this._number;

  void increment() {
    this._number++;
    notifyListeners();
  }

  void decrement() {
    this._number--;
    notifyListeners();
  }
}
