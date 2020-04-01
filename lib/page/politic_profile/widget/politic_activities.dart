import 'package:flutter/material.dart';

import '../../../i18n/i18n.dart';

class PoliticActivities extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Text(
          ACTIVITIES,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        const Center(
          child: Text(NO_ACTIVITY_FOR_POLITIC),
        )
      ],
    );
  }
}
