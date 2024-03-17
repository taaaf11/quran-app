import 'package:flutter/material.dart';
import 'package:quran_com_clone/surah_data.dart';

import 'ayah_box.dart';

class SurahPage extends StatelessWidget {
  final String surahName;
  final int surah;
  final int startAyah;

  const SurahPage(
      {super.key,
      required this.surah,
      required this.surahName,
      required this.startAyah});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(surahName)),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return AyahBox(surah: surah, ayah: index + startAyah);
        },
        itemCount: surahData[surah]![0] - startAyah + 1,
      ),
    );
  }
}
