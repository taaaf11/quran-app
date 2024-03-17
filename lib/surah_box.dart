import 'package:flutter/material.dart';

import 'surah_data.dart';

class SurahNameBox extends StatelessWidget {
  final int surahNumber;

  const SurahNameBox({super.key, required this.surahNumber});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        NumberBox(number: surahNumber),
        SizedBox(width: 30),
        SizedBox(
          width: 190,
          child: Column(
            children: [
              Text(
                surahData[surahNumber]![1], // surah name
                style: TextStyle(fontSize: 20),
              ),
              Text(
                surahData[surahNumber]![
                    2], // surah name translated into English
                style: TextStyle(color: Colors.grey),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class NumberBox extends StatelessWidget {
  final int number;

  const NumberBox({super.key, required this.number});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: SizedBox.square(
        dimension: 50,
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              width: 10,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          child: Center(
            child: Text(
              number.toString(),
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
