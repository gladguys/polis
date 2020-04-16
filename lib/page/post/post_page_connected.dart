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
  PostPageConnected({@required this.post, @required this.postType})
      : assert(post != null),
        assert(postType != null);

  final dynamic post;
  final PostType postType;

  @override
  Widget build(BuildContext context) {
    return PageConnected<PostBloc>(
      bloc: PostBloc(
        post: getPostMap(post),
        postRepository: context.repository<FirebasePostRepository>(),
        shareService: G<ShareService>(),
      ),
      page: PostPage(post: post, postType: postType),
    );
  }

  Map<String, dynamic> getPostMap(dynamic post) {
    if (post is DespesaModel || post is PropostaModel) {
      return post.toJson();
    }
    return null;
  }
}
