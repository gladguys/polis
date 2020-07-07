import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:simple_router/simple_router.dart';

import '../../../../bloc/blocs.dart';
import '../../../../core/domain/enum/comment_option.dart';
import '../../../../core/domain/model/comment_model.dart';
import '../../../../core/extension/extensions.dart';
import '../../../../core/keys.dart';
import '../../../../core/routing/route_names.dart';
import '../../../../widget/card_base.dart';
import '../../../pages.dart';
import '../../../theme/main_theme.dart';

class CommentTile extends StatelessWidget {
  CommentTile(this.comment);

  final CommentModel comment;

  @override
  Widget build(BuildContext context) {
    final user = context.bloc<UserBloc>().user;
    final userComments = user.userComments ?? {};
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
              (userComments[comment.id] ?? false)
                  ? PopupMenuButton<CommentOption>(
                      itemBuilder: (_) => [
                        CommentOption.edit,
                        CommentOption.delete,
                      ]
                          .map(
                            (option) => PopupMenuItem(
                              child: Row(
                                children: <Widget>[
                                  Icon(
                                    option == CommentOption.edit
                                        ? Icons.edit
                                        : Icons.delete,
                                  ),
                                  const SizedBox(width: 6),
                                  Text(
                                    commentOptionToString(option),
                                  )
                                ],
                              ),
                              value: option,
                            ),
                          )
                          .toList(),
                      onSelected: (option) {
                        if (option == CommentOption.edit) {
                        } else if (option == CommentOption.delete) {
                          context
                              .bloc<CommentBloc>()
                              .add(DeleteComment(comment));
                        }
                      },
                      icon: Icon(Icons.menu),
                    )
                  : const SizedBox.shrink(),
            ],
          ),
          slotBottom: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Container(
                width: 80,
                child: GestureDetector(
                  onTap: () => SimpleRouter.forward(
                    CommentRepliesPageConnected(
                      post: context.bloc<CommentBloc>().post,
                      comment: comment,
                      commentBloc: context.bloc<CommentBloc>(),
                    ),
                    name: COMMENT_REPLIES_PAGE,
                  ),
                  child: Row(
                    key: commentsKey,
                    children: <Widget>[
                      FaIcon(
                        FontAwesomeIcons.comment,
                        size: 16,
                        color: Colors.grey[600],
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '0',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey[600],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Text(
                '${DateTime.now().toString().formatDateTime()}',
                style: TextStyle(
                  fontSize: 11,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
