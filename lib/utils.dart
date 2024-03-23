import 'surah_data.dart';

String removeMarkupTags(String htmlContent) {
  var markupAndNumbersRemoved =
      htmlContent.replaceAll(RegExp(r'<[^>]*>|&[^;]+;|\d+'), '');

  return markupAndNumbersRemoved;
}

bool validateSurah(int surahNumber) => surahNumber >= 1 && surahNumber <= 114;

bool validateAyah(int surahNumber, int ayahNumber) =>
    surahData[surahNumber]![0] < ayahNumber;
