import 'package:flutter/material.dart';

import '../surah_data.dart';
import 'dart:math';

class SurahNameBox extends StatelessWidget {
  final int surahNumber;

  const SurahNameBox({super.key, required this.surahNumber});

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.start,
      children: [
        NumberBox(number: surahNumber),
        SizedBox(width: 30),
        Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                surahData[surahNumber]?[1], // surah name
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                surahData[surahNumber]
                    ?[2], // surah name translated into English
                style: TextStyle(color: Colors.grey[350]),
                textAlign: TextAlign.left,
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
