import 'package:flutter/material.dart';

class CounterProvider with ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void increment() {
    _count++;
    notifyListeners(); // 通知 UI 更新
  }

  void decrement() {
    _count--;
    notifyListeners();
  }
}