import 'surah_data.dart';

String removeMarkupTags(String htmlContent) {
  var markupRemoved =
      htmlContent.replaceAll(RegExp(r'<[^>]*>|&[^;]+;|\d+'), '');

  return markupRemoved;
}

bool validateSurah(int surahNumber) => surahNumber >= 1 && surahNumber <= 114;

bool validateAyah(int surahNumber, int ayahNumber) =>
    surahData[surahNumber]![0] < ayahNumber;
