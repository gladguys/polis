import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../core/extension/extensions.dart';
import '../core/i18n/message.dart';

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
          color: context.primaryColorLight,
        ),
        const SizedBox(height: 12),
        Text(
          UNEXPECTED_ERROR_HAPPENED,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            color: Theme.of(context).brightness == Brightness.light
                ? Colors.grey[800]
                : Colors.grey[500],
          ),
        ),
      ],
    );
  }
}
