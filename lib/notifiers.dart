import 'package:flutter/material.dart';

class FontSizesProvider with ChangeNotifier {
  late double _arabicFontSize;
  late double _translationFontSize;

  FontSizesProvider(double arabicFontSize, double translationFontSize) {
    _arabicFontSize = arabicFontSize;
    _translationFontSize = translationFontSize;
  }

  void incArabicFontSize() {
    _arabicFontSize += 1;
    notifyListeners();
  }

  void incTranslationFontSize() {
    _translationFontSize += 1;
    notifyListeners();
  }

  void decArabicFontSize() {
    _arabicFontSize -= 1;
    notifyListeners();
  }

  void decTranslationFontSize() {
    _translationFontSize -= 1;
    notifyListeners();
  }

  double get arabicFontSize => _arabicFontSize;
  double get translationFontSize => _translationFontSize;
}

class BookmarksProvider with ChangeNotifier {}
