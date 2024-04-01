class AyahV1 {
  late final List<Map<String, dynamic>> _words;

  AyahV1({required List<Map<String, dynamic>> words}) {
    _words = words;
  }

  List<Map<String, dynamic>> get words => _words;
}
