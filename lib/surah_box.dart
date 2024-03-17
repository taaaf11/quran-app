import 'package:flutter/material.dart';

import 'surah_data.dart';
import 'dart:math';

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
          width: 230,
          child: Column(
            children: [
              Text(
                surahData[surahNumber]![1], // surah name
                style: TextStyle(fontSize: 20),
              ),
              Text(
                surahData[surahNumber]![
                    2], // surah name translated into English
                style: TextStyle(color: Colors.grey[350]),
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
    return Transform.rotate(
      angle: -pi / 4,
      child: SizedBox(
        child: SizedBox.square(
          dimension: 50,
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                width: 10,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            child: Center(
              child: Transform.rotate(
                angle: pi / 4,
                child: Text(
                  number.toString(),
                  // textAlign: TextAlign.center,
                  // softWrap: true,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
