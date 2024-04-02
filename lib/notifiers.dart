import 'package:flutter/material.dart';

import 'package:quran_com_clone/models/ayah_key.dart';

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

class BookmarksProvider with ChangeNotifier {
  late List<String> _bookmarks;

  BookmarksProvider({required List<String> bookmarks}) {
    _bookmarks = bookmarks;
  }

  void add(AyahKey ayahKey) {
    _bookmarks.add(ayahKey.encode);
    notifyListeners();
  }

  void remove(String ayahKey) {
    _bookmarks.remove(ayahKey);
    notifyListeners();
  }

  List<String> get bookmarks => _bookmarks;
}

class FontsLoaded with ChangeNotifier {
  final List<int> _fontsLoaded = [];

  void add(int pageNumber) {
    _fontsLoaded.add(pageNumber);
    _fontsLoaded.toSet().toList();
  }

  bool isFontLoaded(int pageNumber) => _fontsLoaded.contains(pageNumber);
}
