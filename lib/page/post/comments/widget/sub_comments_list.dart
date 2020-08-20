import 'package:flutter/material.dart';

import '../../../../core/domain/model/models.dart';
import 'sub_comment_tile.dart';

class SubCommentsList extends StatelessWidget {
  SubCommentsList({this.subComments});

  final List<SubCommentModel> subComments;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, i) {
          if (i > subComments.length-1) return null;
          return SubCommentTile(subComments[i]);
        },
      ),
    );
  }
}
