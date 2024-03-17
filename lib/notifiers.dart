import 'package:flutter/material.dart';

class FontSizesProvider with ChangeNotifier {
  late double _arabicFontSize;
  late double _translationFontSize;

  FontSizesProvider(double arabicFontSize, double translationFontSize) {
    _arabicFontSize = arabicFontSize;
    _translationFontSize = translationFontSize;
  }

  void increaseArabicFontSize() {
    _arabicFontSize += 1;
    notifyListeners();
  }

  void increaseTranslationFontSize() {
    _translationFontSize += 1;
    notifyListeners();
  }

  void decreaseArabicFontSize() {
    _arabicFontSize -= 1;
    notifyListeners();
  }

  void decreaseTranslationFontSize() {
    _translationFontSize -= 1;
    notifyListeners();
  }

  double get arabicFontSize => _arabicFontSize;
  double get translationFontSize => _translationFontSize;
}
