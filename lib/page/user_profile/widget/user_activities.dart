import 'package:flutter/material.dart';

import '../../../i18n/i18n.dart';
import '../../../model/models.dart';
import '../../../widget/not_found.dart';
import '../../../widget/text_title.dart';
import 'activities_list.dart';

class UserActions extends StatelessWidget {
  UserActions({this.actions});

  final List<AcaoUsuarioModel> actions;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        TextTitle(MY_ACTIVITIES, fontSize: 15),
        actions.isNotEmpty
            ? UserActionsList(actions)
            : Expanded(
                child: NotFound(msg: NO_RECENT_ACTIVITY),
              ),
      ],
    );
  }
}
