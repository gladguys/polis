import 'package:flutter/material.dart';
import 'package:simple_router/simple_router.dart';

import '../../../core/routing/route_names.dart';
import '../../../enum/post_type.dart';
import '../../pages.dart';

class GoToPostGestureDetector extends StatelessWidget {
  GoToPostGestureDetector(
      {@required this.id, @required this.postType, @required this.tile})
      : assert(id != null),
        assert(postType != null),
        assert(tile != null);

  final String id;
  final PostType postType;
  final Widget tile;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: tile,
      onTap: () => SimpleRouter.forward(
        PostPageConnected(
          id: id,
          postType: postType,
        ),
        name: POST_PAGE,
      ),
    );
  }
}
