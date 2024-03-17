import 'package:flutter/material.dart';
import 'dart:math';

class SurahButton extends StatelessWidget {
  final int number;
  final String name;
  final Function onPress;

  const SurahButton(
      {super.key,
      required this.number,
      required this.name,
      required this.onPress});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: SizedBox(
        width: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            NumberBox(number: number),
            SizedBox(width: 30),
            SizedBox(
              width: 150,
              child: Text(
                name,
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
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
    return Transform.rotate(
      angle: -pi / 4,
      child: SizedBox.square(
        dimension: 50,
        child: Container(
          // width: 50,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
                width: 10, color: Theme.of(context).colorScheme.primary),
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
    );
  }
}
