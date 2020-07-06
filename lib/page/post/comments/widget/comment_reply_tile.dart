import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';

import '../../../../core/domain/model/comment_model.dart';
import '../../../../core/extension/extensions.dart';
import '../../../../widget/card_base.dart';
import '../../../theme/main_theme.dart';

class CommentReplyTile extends StatelessWidget {
  CommentReplyTile(this.comment);

  final CommentModel comment;

  @override
  Widget build(BuildContext context) {
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
          slotCenter: Text(comment.texto),
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
