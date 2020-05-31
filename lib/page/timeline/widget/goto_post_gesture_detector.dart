import 'package:flutter/material.dart';
import 'package:simple_router/simple_router.dart';

import '../../../core/domain/enum/post_type.dart';
import '../../../core/routing/route_names.dart';
import '../../pages.dart';

class GoToPostGestureDetector extends StatelessWidget {
  GoToPostGestureDetector(
      {@required this.post, @required this.postType, @required this.tile})
      : assert(post != null),
        assert(postType != null),
        assert(tile != null);

  final dynamic post;
  final PostType postType;
  final Widget tile;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: tile,
      onTap: () => SimpleRouter.forward(
        PostPageConnected(
          post: post,
          postType: postType,
        ),
        name: POST_PAGE,
      ),
    );
  }
}
