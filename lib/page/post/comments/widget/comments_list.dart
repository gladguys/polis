import 'package:flutter/material.dart';

import '../../../../core/domain/model/comment_model.dart';
import 'comment_tile.dart';

class CommentsList extends StatelessWidget {
  CommentsList({this.comments});

  final List<CommentModel> comments;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      shrinkWrap: true,
      slivers: <Widget>[
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, i) {
              if (i > comments.length - 1) return null;
              return CommentTile(comments[i]);
            },
          ),
        ),
      ],
    );
  }
}
