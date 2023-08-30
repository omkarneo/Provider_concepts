import 'package:flutter/material.dart';

class MyModel extends ChangeNotifier {
  int count = 0;
  String data = "";

  void input(value) {
    data = value;
    notifyListeners();
  }

  void increment() {
    count++;
    notifyListeners();
  }

  void decrement() {
    count--;
    notifyListeners();
  }
}
