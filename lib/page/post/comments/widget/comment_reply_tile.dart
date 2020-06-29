import 'package:flutter/material.dart';

import '../../../../core/domain/model/comment_model.dart';

class CommentReplyTile extends StatelessWidget {
  CommentReplyTile(this.comment);

  final CommentModel comment;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(comment.texto),
      subtitle: Text('${DateTime.now().toString()}'),
    );
  }
}
