import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/cubits.dart';
import '../../core/domain/enum/post_type.dart';
import '../../core/domain/model/despesa_model.dart';
import '../../core/domain/model/models.dart';
import '../../core/repository/concrete/repositories.dart';
import '../../core/service/locator.dart';
import '../../core/service/services.dart';
import '../page_connected.dart';
import '../pages.dart';

class PostPageConnected extends StatelessWidget {
  PostPageConnected({
    @required this.post,
    @required this.postType,
    this.timelineCubit,
  })  : assert(post != null),
        assert(postType != null);

  final dynamic post;
  final PostType postType;
  final TimelineCubit timelineCubit;

  @override
  Widget build(BuildContext context) {
    final postCubit = PostCubit(
      post: getPostMap(post),
      postRepository: context.repository<FirebasePostRepository>(),
      actionRepository: context.repository<FirebaseActionRepository>(),
      shareService: G<ShareService>(),
      userCubit: context.bloc<UserCubit>(),
      timelineCubit: timelineCubit,
    );
    if (timelineCubit != null) {
      postCubit.setPostViewed(
        userId: context.bloc<UserCubit>().user.userId,
        postId: getPostId(post),
      );
    }
    postCubit.setPostFavorited(
      userId: context.bloc<UserCubit>().user.userId,
      postId: getPostId(post),
    );
    return PageConnected<PostCubit>(
      bloc: postCubit,
      page: PostPage(post: post, postType: postType),
    );
  }

  String getPostId(dynamic post) {
    if (post is PropostaModel) {
      return post.idPropostaPolitico;
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
