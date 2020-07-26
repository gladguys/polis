import 'package:flutter/material.dart';

class TextTitle extends StatelessWidget {
  TextTitle(this.text, {this.fontSize = 24});

  final String text;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
