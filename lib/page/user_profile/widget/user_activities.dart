import 'package:flutter/material.dart';

import '../../../i18n/i18n.dart';
import '../../../widget/not_found.dart';
import '../../../widget/text_title.dart';

class UserActivities extends StatelessWidget {
  UserActivities({this.activities});

  final List<dynamic> activities;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        TextTitle(MY_ACTIVITIES, fontSize: 15),
        Expanded(
          child: NotFound(msg: NO_RECENT_ACTIVITY),
        ),
      ],
    );
  }
}
