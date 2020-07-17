import 'package:flutter/material.dart';

import '../../../../core/extension/extensions.dart';
import '../../../../core/i18n/i18n.dart';
import '../../../../core/keys.dart';
import '../../../../widget/field_rounded.dart';

class AddCommentContainer extends StatelessWidget {
  AddCommentContainer(
      {@required this.commentInputController, @required this.onAddComment})
      : assert(commentInputController != null),
        assert(onAddComment != null);

  final TextEditingController commentInputController;
  final Function onAddComment;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: Container(
        width: context.screenWidth,
        alignment: Alignment.center,
        color: context.baseBackgroundColor,
        child: Column(
          children: <Widget>[
            const Divider(color: Colors.grey, height: 16),
            const SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: FieldRounded(
                hintText: COMMENT_HERE,
                width: 360,
                textSuffix: SEND,
                widthSuffix: 70,
                keySuffix: commentButtonKey,
                controller: commentInputController,
                onPressedSuffix: onAddComment,
              ),
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
