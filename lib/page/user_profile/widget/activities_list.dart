import 'package:flutter/material.dart';

import '../../../core/domain/enum/acao_type.dart';
import '../../../core/domain/model/models.dart';
import '../../../core/extension/extensions.dart';
import 'follow_unfollow_action_tile.dart';
import 'like_unlike_action_tile.dart';

class UserActionsList extends StatelessWidget {
  UserActionsList(this.actions);

  final List<AcaoUsuarioModel> actions;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.screenHeight - 140,
      child: ListView.separated(
        shrinkWrap: true,
        padding: const EdgeInsets.only(top: 4, bottom: 24),
        itemCount: actions.length,
        separatorBuilder: (_, i) => const Divider(indent: 8, endIndent: 8),
        itemBuilder: (_, i) {
          final action = actions[i];
          final actionType = action.tipo;
          if (isActionFollowUnfollow(actionType)) {
            return FollowUnfollowActionTile(action: action);
          } else {
            return LikeUnlikeActionTile(action: action);
          }
        },
      ),
    );
  }
}
