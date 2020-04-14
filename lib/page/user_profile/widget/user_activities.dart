import 'package:flutter/material.dart';

import '../../../i18n/i18n.dart';
import '../../../widget/not_found.dart';

class UserActivities extends StatelessWidget {
  UserActivities(this.activities);

  final List<dynamic> activities;

  @override
  Widget build(BuildContext context) {
    if (activities.length > 0) {
      return Container(
        height: (MediaQuery.of(context).size.height * 0.97) - 50 - 72,
        child: ListView.separated(
          shrinkWrap: true,
          padding: const EdgeInsets.only(bottom: 24),
          itemCount: activities.length,
          separatorBuilder: (_, i) => const Divider(indent: 8, endIndent: 8),
          itemBuilder: (_, i) => Container(),
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.only(top: 64),
        child: NotFound(msg: NO_RECENT_ACTIVITY),
      );
    }
  }
}
