class AyahKey {
  late int _surahNumber;
  late int _ayahNumber;

  AyahKey({required int surahNumber, required int ayahNumber}) {
    _surahNumber = surahNumber;
    _ayahNumber = ayahNumber;
  }

  factory AyahKey.fromString(String ayahKey) {
    int surahNumber = int.parse(ayahKey.split(':')[0]);
    int ayahNumber = int.parse(ayahKey.split(':')[1]);

    return AyahKey(surahNumber: surahNumber, ayahNumber: ayahNumber);
  }

  int get surahNumber => _surahNumber;
  int get ayahNumber => _ayahNumber;

  String get encode => '$_surahNumber:$_ayahNumber';
}
