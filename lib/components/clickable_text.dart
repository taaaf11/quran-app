import 'package:flutter/material.dart';

class ClickableText extends StatefulWidget {
  final String text;
  final TextStyle textStyle;
  final Function onPress;

  const ClickableText(
      {super.key,
      required this.text,
      required this.textStyle,
      required this.onPress});

  @override
  State<ClickableText> createState() => _ClickableTextState();
}

class _ClickableTextState extends State<ClickableText> {
  bool _isHoveredOn = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: () => widget.onPress(),
      onHover: (value) {
        setState(
          () {
            _isHoveredOn = value;
          },
        );
      },
      child: Text(
        widget.text,
        style: widget.textStyle.merge(
          TextStyle(
            color: _isHoveredOn ? Theme.of(context).colorScheme.primary : null,
          ),
        ),
      ),
    );
  }
}
