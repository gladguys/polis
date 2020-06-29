import 'package:flutter/material.dart';

import '../../../../core/domain/model/comment_model.dart';
import 'comment_reply_tile.dart';

class CommentsReplyList extends StatelessWidget {
  CommentsReplyList({this.comments});

  final List<CommentModel> comments;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (_, i) => CommentReplyTile(comments[i]),
      itemCount: comments.length,
    );
  }
}
