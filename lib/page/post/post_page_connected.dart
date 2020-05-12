import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/blocs.dart';
import '../../core/service/locator.dart';
import '../../core/service/services.dart';
import '../../enum/post_type.dart';
import '../../model/despesa_model.dart';
import '../../model/models.dart';
import '../../repository/concrete/repositories.dart';
import '../page_connected.dart';
import '../pages.dart';

class PostPageConnected extends StatelessWidget {
  PostPageConnected(
      {@required this.post, @required this.postType, this.timelineBloc})
      : assert(post != null),
        assert(postType != null);

  final dynamic post;
  final PostType postType;
  final TimelineBloc timelineBloc;

  @override
  Widget build(BuildContext context) {
    final postBloc = PostBloc(
      post: getPostMap(post),
      postRepository: context.repository<FirebasePostRepository>(),
      shareService: G<ShareService>(),
      timelineBloc: timelineBloc,
    );
    if (timelineBloc != null) {
      postBloc.add(
        SetPostViewed(
          userId: context.bloc<UserBloc>().user.userId,
          postId: getPostId(post),
        ),
      );
    }
    return PageConnected<PostBloc>(
      bloc: postBloc,
      page: PostPage(post: post, postType: postType),
    );
  }

  String getPostId(dynamic post) {
    if (post is PropostaModel) {
      return post.id;
    } else if (post is DespesaModel) {
      return post.id;
    }
    return null;
  }

  Map<String, dynamic> getPostMap(dynamic post) {
    if (post is DespesaModel || post is PropostaModel) {
      return post.toJson();
    }
    return null;
  }
}
