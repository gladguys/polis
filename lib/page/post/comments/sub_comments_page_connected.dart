import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/cubits.dart';
import '../../../core/domain/model/comment_model.dart';
import '../../../core/repository/abstract/repositories.dart';
import '../../page_connected.dart';
import 'sub_comments_page.dart';

class SubCommentsPageConnected extends StatelessWidget {
  SubCommentsPageConnected({
    @required this.post,
    @required this.comment,
    @required this.commentCubit,
  });

  final dynamic post;
  final CommentModel comment;
  final CommentCubit commentCubit;

  @override
  Widget build(BuildContext context) {
    return PageConnected<SubCommentsCubit>(
      bloc: SubCommentsCubit(
        post: post,
        comment: comment,
        commentCubit: commentCubit,
        repository: context.repository<CommentRepository>(),
      )..getCommentSubComments(commentId: comment.id),
      page: SubCommentsPage(),
    );
  }
}
