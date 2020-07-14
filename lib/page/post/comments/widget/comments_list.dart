import 'package:flutter/material.dart';

import '../../../../core/domain/model/comment_model.dart';
import 'comment_tile.dart';

class CommentsList extends StatelessWidget {
  CommentsList({this.comments});

  final List<CommentModel> comments;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (_, i) => CommentTile(comments[i]),
      itemCount: comments.length,
    );
  }
}
