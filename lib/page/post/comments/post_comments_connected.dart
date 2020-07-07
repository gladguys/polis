import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/blocs.dart';
import '../../../bloc/post/comment/comment_bloc.dart';
import '../../../core/repository/concrete/http/http_comment_repository.dart';
import '../../../core/repository/utils.dart';
import '../../page_connected.dart';
import 'post_comments.dart';

class PostCommentsConnected extends StatelessWidget {
  PostCommentsConnected({@required this.post}) : assert(post != null);

  final dynamic post;

  @override
  Widget build(BuildContext context) {
    return PageConnected<CommentBloc>(
      bloc: CommentBloc(
        post: post,
        repository: context.repository<HttpCommentRepository>(),
        userBloc: context.bloc<UserBloc>(),
      )..add(GetPostComments(postId: getIdFromPost(post))),
      page: PostComments(),
    );
  }
}
