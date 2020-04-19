import 'package:flutter/material.dart';

import '../../../i18n/i18n.dart';
import '../../../model/models.dart';
import '../../../widget/not_found.dart';
import 'activities_list.dart';

class UserActions extends StatelessWidget {
  UserActions({this.actions});

  final List<AcaoUsuarioModel> actions;

  @override
  Widget build(BuildContext context) {
    if (actions.isNotEmpty) {
      return UserActionsList(actions);
    } else {
      return Padding(
        padding: const EdgeInsets.only(top: 64),
        child: NotFound(msg: NO_RECENT_ACTIVITY),
      );
    }
  }
}
