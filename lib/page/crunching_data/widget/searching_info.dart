import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../theme/main_theme.dart';

import '../../../extension/extensions.dart';

class SearchingInfo extends StatelessWidget {
  SearchingInfo({@required this.icon, @required this.text})
      : assert(icon != null),
        assert(text != null);

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.baseBackgroundColor,
      child: Center(
        child: Column(
          children: <Widget>[
            Icon(icon, size: 180),
            Text(
              text,
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
