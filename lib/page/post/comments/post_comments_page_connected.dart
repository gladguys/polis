import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/blocs.dart';
import '../../../bloc/post/comment/comment_bloc.dart';
import '../../../core/repository/abstract/repositories.dart';
import '../../../core/repository/utils.dart';
import '../../page_connected.dart';
import 'post_comments_page.dart';

class PostCommentsPageConnected extends StatelessWidget {
  PostCommentsPageConnected({@required this.post}) : assert(post != null);

  final dynamic post;

  @override
  Widget build(BuildContext context) {
    return PageConnected<CommentBloc>(
      bloc: CommentBloc(
        post: post,
        repository: context.repository<CommentRepository>(),
        user: context.bloc<UserBloc>().user,
      )..add(GetPostComments(postId: getIdFromPost(post))),
      page: PostCommentsPage(),
    );
  }
}
