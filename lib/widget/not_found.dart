import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NotFound extends StatelessWidget {
  NotFound({@required this.msg}) : assert(msg != null);

  final String msg;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        FaIcon(
          FontAwesomeIcons.meh,
          size: 48,
        ),
        const SizedBox(height: 12),
        Text(
          msg,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
