import 'package:flutter/material.dart';

import '../../../../core/domain/model/models.dart';
import 'sub_comment_tile.dart';

class SubCommentsList extends StatelessWidget {
  SubCommentsList({this.subComments});

  final List<SubCommentModel> subComments;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (_, i) => SubCommentTile(subComments[i]),
      itemCount: subComments.length,
    );
  }
}
