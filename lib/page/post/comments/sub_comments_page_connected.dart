import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/blocs.dart';
import '../../../core/domain/model/comment_model.dart';
import '../../../core/repository/abstract/repositories.dart';
import '../../page_connected.dart';
import 'sub_comments_page.dart';

class SubCommentsPageConnected extends StatelessWidget {
  SubCommentsPageConnected({
    @required this.post,
    @required this.comment,
    @required this.commentBloc,
  });

  final dynamic post;
  final CommentModel comment;
  final CommentBloc commentBloc;

  @override
  Widget build(BuildContext context) {
    return PageConnected<SubCommentsBloc>(
      bloc: SubCommentsBloc(
        post: post,
        comment: comment,
        commentBloc: commentBloc,
        repository: context.repository<CommentRepository>(),
      )..add(GetCommentSubComments(commentId: comment.id)),
      page: SubCommentsPage(),
    );
  }
}
