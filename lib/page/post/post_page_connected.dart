import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/blocs.dart';
import '../../enum/post_type.dart';
import '../../repository/concrete/repositories.dart';
import '../page_connected.dart';
import '../pages.dart';

class PostPageConnected extends StatelessWidget {
  PostPageConnected({@required this.post, @required this.postType})
      : assert(post != null),
        assert(postType != null);

  final dynamic post;
  final PostType postType;

  @override
  Widget build(BuildContext context) {
    return PageConnected<PostBloc>(
      bloc: PostBloc(
        post: post,
        postRepository: context.repository<FirebasePostRepository>(),
      ),
      page: PostPage(post: post, postType: postType),
    );
  }
}
