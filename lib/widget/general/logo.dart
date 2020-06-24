import 'package:flutter/material.dart';

import '../../core/i18n/i18n.dart';

class Logo extends StatelessWidget {
  const Logo({this.fontSize = 56});

  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      POLIS,
      style: TextStyle(
        fontFamily: 'Philosopher',
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
