import 'package:flutter/material.dart';

import '../../../i18n/i18n.dart';

class PoliticActionButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 28,
          width: 140,
          color: Colors.green,
          child: OutlineButton(
            key: const ValueKey('follow-politic-profile'),
            onPressed: () {},
            padding: const EdgeInsets.symmetric(horizontal: 16),
            color: Colors.green,
            child: Text(
              FOLLOW,
              style: TextStyle(
                fontSize: 12,
                color: Colors.white,
              ),
            ),
          ),
        ),
        const SizedBox(width: 14),
        Container(
          height: 28,
          width: 140,
          child: OutlineButton(
            key: const ValueKey('send-email-btn'),
            onPressed: () {},
            padding: const EdgeInsets.symmetric(horizontal: 16),
            color: Colors.grey[350],
            child: Text(
              'Enviar e-mail',
              style: TextStyle(
                fontSize: 12,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
