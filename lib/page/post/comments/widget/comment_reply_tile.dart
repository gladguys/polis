import 'package:flutter/material.dart';

import '../../../../core/domain/model/comment_model.dart';
import '../../../../core/extension/extensions.dart';

class CommentReplyTile extends StatelessWidget {
  CommentReplyTile(this.comment);

  final CommentModel comment;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6),
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(0),
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(20),
            bottomLeft: Radius.circular(20),
          ),
          color: Color(0xFFFFF5D0),
        ),
        child: ListTile(
          title: Text(comment.texto),
          subtitle: Text(
            '${DateTime.now().toString().formatDateTime()}',
            textAlign: TextAlign.end,
          ),
        ),
      ),
    );
  }
}
