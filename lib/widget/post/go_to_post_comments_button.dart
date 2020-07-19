import 'package:flutter/material.dart';
import 'package:simple_router/simple_router.dart';

import '../../core/i18n/i18n.dart';
import '../../core/routing/route_names.dart';
import '../../page/pages.dart';

class GoToPostCommentsButton extends StatelessWidget {
  GoToPostCommentsButton(this.post);

  final dynamic post;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      color: Theme.of(context).primaryColor,
      textColor: Colors.black,
      child: const Text(FOLLOW_COMMENTS),
      onPressed: () => SimpleRouter.forward(
        PostCommentsPageConnected(post: post),
        name: POST_COMMENTS_PAGE,
      ),
    );
  }
}
