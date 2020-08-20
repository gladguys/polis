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

class EditSubCommentContainer extends StatelessWidget {
  EditSubCommentContainer(
      {@required this.subComment, @required this.commentInputController})
      : assert(subComment != null),
        assert(commentInputController != null);

  final SubCommentModel subComment;
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
              text: subComment.texto,
              commentInputController: commentInputController,
              onCancelEditing: () {
                context.bloc<SubCommentsBloc>().add(StopEditingSubComment());
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
                initialValue: commentInputController.text,
                onChanged: (text) => commentInputController.text = text,
                onPressedSuffix: () {
                  context.bloc<SubCommentsBloc>().add(
                        EditSubComment(
                          subComment: subComment,
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
