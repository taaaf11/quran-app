import 'package:flutter/material.dart';

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
      child: Container(
        // width: 100,
        // decoration: BoxDecoration(border: Border.all(color: Colors.pink)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            NumberBox(number: number),
            SizedBox(width: 10),
            Text(
              name,
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
      onTap: () => onPress(),
      // onFocusChange: ,
    );
  }
}

class NumberBox extends StatelessWidget {
  final int number;

  const NumberBox({super.key, required this.number});

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: 50,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              width: 10, color: Theme.of(context).colorScheme.primary),
        ),
        child: Center(
          child: Text(
            number.toString(),
            style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
          ),
        ),
      ),
    );
  }
}
