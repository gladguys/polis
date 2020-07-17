import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_router/simple_router.dart';

import '../../../../bloc/blocs.dart';
import '../../../../core/domain/model/models.dart';
import '../../../../core/extension/extensions.dart';
import '../../../../widget/card_base.dart';
import '../../../user_profile/user_profile_page_connected.dart';
import 'menu_edit_delete_comment.dart';

class SubCommentTile extends StatelessWidget {
  SubCommentTile(this.subComment);

  final SubCommentModel subComment;

  @override
  Widget build(BuildContext context) {
    final user = context.bloc<UserBloc>().user;
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 4, bottom: 8),
      child: Bubble(
        color: user.userId == subComment.usuarioId
            ? Colors.grey[200]
            : context.primaryColorLight,
        padding: const BubbleEdges.all(8),
        radius: const Radius.circular(15),
        nip: user.userId == subComment.usuarioId
            ? BubbleNip.rightBottom
            : BubbleNip.leftTop,
        nipHeight: 12,
        child: CardBase(
          slotBottomWithIndent: false,
          paddingSlotCenter: const EdgeInsets.only(bottom: 4),
          slotCenter: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  InkWell(
                    onTap: () => SimpleRouter.forward(
                      UserProfilePageConnected(
                        userId: subComment.usuarioId,
                      ),
                    ),
                    child: Text(
                      subComment.usuarioNome,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  (subComment.usuarioId == user.userId)
                      ? MenuEditDeleteComment(
                          onEdit: () => context.bloc<SubCommentsBloc>().add(
                                StartEditingSubComment(subComment),
                              ),
                          onDelete: () => context.bloc<SubCommentsBloc>().add(
                                DeleteSubComment(subComment: subComment),
                              ),
                        )
                      : Container(),
                ],
              ),
              const SizedBox(height: 4),
              Text(subComment.texto),
            ],
          ),
          slotBottom: Text(
            subComment.diaHora.toString().formatDateTime(),
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
