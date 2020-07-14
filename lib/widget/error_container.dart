import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../core/i18n/message.dart';
import '../page/theme/main_theme.dart';

class ErrorContainer extends StatelessWidget {
  const ErrorContainer();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        FaIcon(
          FontAwesomeIcons.exclamationCircle,
          size: 80,
          color: theme.primaryColorLight,
        ),
        const SizedBox(height: 12),
        Text(
          UNEXPECTED_ERROR_HAPPENED,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            color: Colors.grey[800],
          ),
        ),
      ],
    );
  }
}
