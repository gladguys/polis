import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/i18n/i18n.dart';
import '../../../theme/main_theme.dart';

class NoSubCommentForComment extends StatelessWidget {
  const NoSubCommentForComment();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Center(
            child: FaIcon(
              FontAwesome5.comments,
              size: 80,
              color: theme.primaryColorLight,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            THIS_COMMENT_HAS_NO_SUB_COMMENTS,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey[800],
            ),
          ),
        ],
      ),
    );
  }
}
