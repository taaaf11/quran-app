import 'surah_data.dart';
import 'dart:typed_data';
import 'package:http/http.dart' as http;

String removeMarkupTags(String htmlContent) {
  var markupAndNumbersRemoved =
      htmlContent.replaceAll(RegExp(r'<[^>]*>|&[^;]+;|\d+'), '');

  return markupAndNumbersRemoved;
}

bool validateSurah(int surahNumber) => surahNumber >= 1 && surahNumber <= 114;

bool validateAyah(int surahNumber, int ayahNumber) =>
    surahData[surahNumber]![0] < ayahNumber;

String getWordbyWordAudioUrl(int surahNumber, int ayahNumber, int position) {
  String paddedSurahNumber = surahNumber.toString().padLeft(3, '0');
  String paddedAyahNumber = ayahNumber.toString().padLeft(3, '0');
  String paddedPosition = (position + 1).toString().padLeft(3, '0');

  return '${paddedSurahNumber}_${paddedAyahNumber}_$paddedPosition';
}

String removeSpacesFromString(String string) {
  String newString = '';

  for (final char in string.split('')) {
    if (char == ' ') continue;
    newString += char;
  }

  return newString;
}

int getCrossAxisCount(double screenWidth) {
  switch (screenWidth) {
    case < 320:
    case >= 320 && <= 767:
      return 1;
    case >= 768 && <= 991:
      return 2;
    case >= 992:
      return 3;
    default:
      return 3;
  }
}

Future<ByteData> fetchFontBytes(int pageNumber) async {
  final response = await http.get(Uri.parse(
      'https://raw.githubusercontent.com/quran/quran.com-frontend-next/master/public/fonts/quran/hafs/v1/ttf/p$pageNumber.ttf'));
  print('ls');

  if (response.statusCode == 200) {
    return ByteData.view(response.bodyBytes.buffer);
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load font');
  }
}
