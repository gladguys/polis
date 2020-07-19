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
        FaIcon(FontAwesomeIcons.folderOpen,
            size: 80, color: Theme.of(context).primaryColorLight),
        const SizedBox(height: 12),
        Text(
          msg,
          style: TextStyle(
            fontSize: 16,
            color: Theme.of(context).brightness == Brightness.light
                ? Colors.grey[600]
                : Colors.grey[300],
          ),
        ),
      ],
    );
  }
}
