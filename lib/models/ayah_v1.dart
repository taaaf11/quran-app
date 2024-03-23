class AyahV1 {
  late final int _pageNumber;
  late final String _code;

  AyahV1({required int pageNumber, required String code}) {
    _pageNumber = pageNumber;
    _code = code;
  }

  int get pageNumber => _pageNumber;
  String get code => _code;
}
