import 'package:flutter/material.dart';

import 'surah_data.dart';

class SurahButton extends StatelessWidget {
  final int surahNumber;
  final Function onPress;

  const SurahButton(
      {super.key, required this.surahNumber, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Row(
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
      ),
      onTap: () => onPress(),
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
