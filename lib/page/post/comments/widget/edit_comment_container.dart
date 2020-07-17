import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../bloc/blocs.dart';
import '../../../../core/domain/model/models.dart';
import '../../../../core/extension/extensions.dart';
import '../../../../core/i18n/i18n.dart';
import '../../../../core/keys.dart';
import '../../../../widget/field_rounded.dart';
import 'editing_top_part.dart';

class EditCommentContainer extends StatelessWidget {
  EditCommentContainer(
      {@required this.comment, @required this.commentInputController})
      : assert(comment != null),
        assert(commentInputController != null);

  final CommentModel comment;
  final TextEditingController commentInputController;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: Container(
        width: context.screenWidth,
        alignment: Alignment.center,
        color: context.baseBackgroundColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            EditingTopPart(
              text: comment.texto,
              commentInputController: commentInputController,
              onCancelEditing: () {
                context.bloc<CommentBloc>().add(StopEditingComment());
                commentInputController.clear();
              },
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: FieldRounded(
                hintText: COMMENT_HERE,
                width: 360,
                iconSuffix: FontAwesomeIcons.check,
                backgroundColorSuffix: Colors.green,
                fontColorSuffix: Colors.white,
                keySuffix: commentButtonKey,
                controller: commentInputController,
                onPressedSuffix: () {
                  context.bloc<CommentBloc>().add(
                        EditComment(
                          comment: comment,
                          newText: commentInputController.text,
                        ),
                      );
                  commentInputController.clear();
                },
              ),
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
