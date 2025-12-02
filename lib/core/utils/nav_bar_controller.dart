import 'package:flutter/material.dart';

class NavBarController extends ChangeNotifier {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void updateIndex(int index) {
    if (_currentIndex != index) {
      _currentIndex = index;

      notifyListeners();
    }
  }

  void resetToHome() {
    updateIndex(0);
  }
}
