import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/blocs.dart';
import '../../../core/domain/model/comment_model.dart';
import '../../../core/repository/concrete/repositories.dart';
import '../../page_connected.dart';
import 'comment_replies_page.dart';

class CommentRepliesPageConnected extends StatelessWidget {
  CommentRepliesPageConnected({
    @required this.post,
    @required this.comment,
    @required this.commentBloc,
  });

  final dynamic post;
  final CommentModel comment;
  final CommentBloc commentBloc;

  @override
  Widget build(BuildContext context) {
    return PageConnected<CommentRepliesBloc>(
      bloc: CommentRepliesBloc(
        post: post,
        comment: comment,
        commentBloc: commentBloc,
        repository: context.repository<HttpCommentRepository>(),
      ),
      page: CommentRepliesPage(),
    );
  }
}
