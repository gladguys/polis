import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:simple_router/simple_router.dart';

import '../../core/i18n/i18n.dart';
import '../../core/keys.dart';
import '../../core/routing/route_names.dart';
import '../../page/pages.dart';

class GoToPostCommentsButton extends StatelessWidget {
  GoToPostCommentsButton(this.post);

  final dynamic post;

  @override
  Widget build(BuildContext context) {
    return OutlineButton.icon(
      icon: FaIcon(FontAwesomeIcons.comments, size: 18),
      label: Text(
        FOLLOW_COMMENTS.toUpperCase(),
        style: const TextStyle(fontSize: 13),
      ),
      key: goToPostCommentsButtonKey,
      color: Theme.of(context).primaryColor,
      highlightedBorderColor: Theme.of(context).primaryColorDark,
      borderSide: BorderSide(color: Theme.of(context).primaryColor),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      onPressed: () => SimpleRouter.forward(
        PostCommentsPageConnected(post: post),
        name: POST_COMMENTS_PAGE,
      ),
    );
  }
}
