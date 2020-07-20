import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/extension/extensions.dart';
import '../../../../core/i18n/i18n.dart';

class NoSubCommentForComment extends StatelessWidget {
  const NoSubCommentForComment();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        FaIcon(
          FontAwesome5.comments,
          size: 80,
          color: context.primaryColorLight,
        ),
        const SizedBox(height: 12),
        Text(
          THIS_COMMENT_HAS_NO_SUB_COMMENTS,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            color: Theme.of(context).brightness == Brightness.light
                ? Colors.grey[600]
                : Colors.grey[300],
          ),
        ),
      ],
    );
  }
}
