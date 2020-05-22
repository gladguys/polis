import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../theme/main_theme.dart';

class SearchingInfo extends StatelessWidget {
  SearchingInfo({@required this.icon, @required this.text})
      : assert(icon != null),
        assert(text != null);

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: theme.scaffoldBackgroundColor,
      width: 220,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FaIcon(icon, size: 120),
          const SizedBox(height: 16),
          Text(
            text,
            style: const TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
