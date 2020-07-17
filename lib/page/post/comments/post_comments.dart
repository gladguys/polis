import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../bloc/post/comment/comment_bloc.dart';
import '../../../core/domain/model/comment_model.dart';
import '../../../core/extension/extensions.dart';
import '../../../core/i18n/i18n.dart';
import '../../../core/keys.dart';
import '../../../widget/error_container.dart';
import '../../../widget/field_rounded.dart';
import '../../../widget/loading.dart';
import 'widget/comments_list.dart';
import 'widget/no_comment_for_post.dart';

class PostComments extends StatefulWidget {
  @override
  _PostCommentsState createState() => _PostCommentsState();
}

class _PostCommentsState extends State<PostComments> {
  TextEditingController commentInputController;

  @override
  void initState() {
    commentInputController = TextEditingController(text: '');
    super.initState();
  }

  @override
  void dispose() {
    commentInputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CommentBloc, CommentState>(
      builder: (_, state) {
        if (state is InitialCommentState ||
            state is GetPostCommentsSuccess ||
            state is NewCommentAdded ||
            state is CommentDeletedSuccess ||
            state is NewSubCommentAdded ||
            state is EditingCommentStarted ||
            state is CommentEditedSuccess) {
          final comments = context.bloc<CommentBloc>().postComments;
          return Stack(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(bottom: 70),
                constraints: const BoxConstraints(maxHeight: 200),
                child: Column(
                  children: <Widget>[
                    const Divider(color: Colors.grey, height: 1),
                    const SizedBox(height: 12),
                    Expanded(
                      child: comments.isNotEmpty
                          ? CommentsList(
                              comments: comments,
                            )
                          : const NoCommentForPost(),
                    ),
                  ],
                ),
              ),
              if (state is EditingCommentStarted)
                ..._buildWidgetsWhenEditingComment(state.comment),
              if (!(state is EditingCommentStarted))
                ..._buildWidgetsWhenNotEditingComment(),
            ],
          );
        } else if (state is LoadingPostComments) {
          return const Loading();
        } else {
          return const ErrorContainer();
        }
      },
    );
  }

  List<Widget> _buildWidgetsWhenEditingComment(CommentModel comment) {
    commentInputController.text = comment.texto;
    return [
      Positioned(
        bottom: 0,
        child: Container(
          width: context.screenWidth,
          alignment: Alignment.center,
          color: context.baseBackgroundColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Divider(color: Colors.grey, height: 16),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                width: 360,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    FaIcon(
                      FontAwesomeIcons.pen,
                      size: 16,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '$EDIT_COMMENT:',
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 4),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: Text(
                          comment.texto,
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    IconButton(
                        icon: Icon(Icons.cancel),
                        onPressed: () {
                          context.bloc<CommentBloc>().add(StopEditingComment());
                          commentInputController.clear();
                        }),
                  ],
                ),
              ),
              const Divider(),
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
      ),
    ];
  }

  List<Widget> _buildWidgetsWhenNotEditingComment() {
    return [
      Positioned(
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
                  onPressedSuffix: () {
                    context.bloc<CommentBloc>().add(
                          AddComment(
                            text: commentInputController.text,
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
      ),
    ];
  }
}
