import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/post/comment/comment_bloc.dart';
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
        if (state is GetPostCommentsSuccess ||
            state is NewCommentAdded ||
            state is CommentDeletedSuccess ||
            state is NewReplyCommentAdded) {
          final comments = context.bloc<CommentBloc>().postComments;
          return Column(
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
              const Divider(color: Colors.grey, height: 1),
              const SizedBox(height: 12),
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
          );
        } else if (state is LoadingPostComments) {
          return const Loading();
        } else {
          return const ErrorContainer();
        }
      },
    );
  }
}
