import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/blocs.dart';
import '../../../../core/domain/model/models.dart';
import '../../../../core/extension/extensions.dart';
import '../../../../widget/card_base.dart';
import '../../../theme/main_theme.dart';
import 'menu_edit_delete_comment.dart';

class SubCommentTile extends StatelessWidget {
  SubCommentTile(this.comment);

  final SubCommentModel comment;

  @override
  Widget build(BuildContext context) {
    final user = context.bloc<UserBloc>().user;
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 4, bottom: 8),
      child: Bubble(
        color: theme.primaryColorLight,
        padding: const BubbleEdges.all(8),
        radius: const Radius.circular(15),
        nip: BubbleNip.leftTop,
        nipHeight: 12,
        child: CardBase(
          slotBottomWithIndent: false,
          paddingSlotCenter: const EdgeInsets.only(bottom: 4),
          slotCenter: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(comment.texto),
              (comment.usuarioId == user.userId)
                  ? MenuEditDeleteComment(
                      onEdit: () => {},
                      onDelete: () => context.bloc<SubCommentsBloc>().add(
                            DeleteSubComment(subComment: comment),
                          ),
                    )
                  : const SizedBox.shrink(),
            ],
          ),
          slotBottom: Text(
            '${DateTime.now().toString().formatDateTime()}',
            textAlign: TextAlign.end,
            style: TextStyle(
              fontSize: 11,
              color: Colors.grey[600],
            ),
          ),
        ),
      ),
    );
  }
}
