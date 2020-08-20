import 'package:flutter/material.dart';

import '../../../core/domain/enum/configuracao.dart';
import '../../../core/domain/model/models.dart';
import '../../../core/i18n/i18n.dart';
import '../../../widget/not_found.dart';
import 'activities_list.dart';

class UserActions extends StatelessWidget {
  UserActions({this.user, this.actions, this.isUserPickedTheLocal});

  final UserModel user;
  final List<AcaoUsuarioModel> actions;
  final bool isUserPickedTheLocal;

  bool get isActivityInfoConfigEnabled => isConfigEnabledForUser(
        user: user,
        configuracao: Configuracao.isActivityInfoEnabled,
      );

  @override
  Widget build(BuildContext context) {
    if (!isUserPickedTheLocal && !isActivityInfoConfigEnabled) {
      return const Center(
        child: Text(
          USER_OPTED_TO_NOT_SHARE_INFO,
        ),
      );
    } else {
      if (actions.isNotEmpty) {
        return UserActionsList(actions);
      } else {
        return Padding(
          padding: const EdgeInsets.only(top: 24, bottom: 64),
          child: NotFound(msg: NO_RECENT_ACTIVITY),
        );
      }
    }
  }
}
