import 'package:flutter/material.dart';
import 'package:quran_com_clone/surah_data.dart';

import 'ayah_box.dart';

class SurahPage extends StatelessWidget {
  final int surahNumber;
  final int startAyah;

  const SurahPage(
      {super.key, required this.surahNumber, required this.startAyah});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(surahData[surahNumber]![1])),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return AyahBox(surah: surahNumber, ayah: index + startAyah);
        },
        itemCount: surahData[surahNumber]![0] - startAyah + 1,
      ),
    );
  }
}
