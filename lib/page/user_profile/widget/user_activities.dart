import 'package:flutter/material.dart';

import '../../../i18n/i18n.dart';
import '../../../model/models.dart';
import '../../../widget/not_found.dart';

class UserActions extends StatelessWidget {
  UserActions({this.actions});

  final List<AcaoUsuarioModel> actions;

  @override
  Widget build(BuildContext context) {
    if (actions.isNotEmpty) {
      return Container(
        height: (MediaQuery.of(context).size.height * 0.97) - 50 - 72,
        child: ListView.separated(
          shrinkWrap: true,
          padding: const EdgeInsets.only(bottom: 24),
          itemCount: actions.length,
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
