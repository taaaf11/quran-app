import 'package:flutter/material.dart';
import 'package:quran_com_clone/ayah_counts.dart';

import 'ayaah_text.dart';
import 'translation.dart';

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
        itemCount: AyahCounts[surah]! - startAyah,
      ),
    );
  }
}

class AyahBox extends StatelessWidget {
  final int surah;
  final int ayah;

  const AyahBox({super.key, required this.surah, required this.ayah});

  // Future<String> _fetchAyahText() async {
  //
  // }

  @override
  Widget build(BuildContext context) {
    // return
    return Card(
      surfaceTintColor: Theme.of(context).colorScheme.onSurface,
      child: Column(
        children: [
          // FutureBuilder(future: future, builder: builder)
          // Text(SurahAyah['$surah:$ayah'] ?? 'Requested Ayah not found.'),
          // Text(ayahTranslationAhmedRaza['$surah:$ayah'] ??
          //     'Requested translation not found.')
        ],
      ),
    );
  }
}
