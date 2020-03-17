import 'package:flutter/material.dart';

import '../../../i18n/i18n.dart';

class UserActivities extends StatelessWidget {
  UserActivities({this.activities});

  final List<dynamic> activities;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          MY_ACTIVITIES,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 18),
        Text(NO_RECENT_ACTIVITY),
      ],
    );
  }
}
