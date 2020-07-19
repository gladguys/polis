import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/post/comment/comment_bloc.dart';
import '../../../core/domain/model/comment_model.dart';
import '../../../widget/error_container.dart';
import '../../../widget/loading.dart';
import 'widget/add_comment_container.dart';
import 'widget/comments_list.dart';
import 'widget/edit_comment_container.dart';
import 'widget/no_comment_for_post.dart';

class PostCommentsPage extends StatefulWidget {
  @override
  _PostCommentsPageState createState() => _PostCommentsPageState();
}

class _PostCommentsPageState extends State<PostCommentsPage> {
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
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<CommentBloc, CommentState>(
          builder: (_, state) {
            if (shouldShowCommentsByState(state)) {
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
                    _buildWidgetsWhenEditingComment(state.comment),
                  if (state is! EditingCommentStarted)
                    AddCommentContainer(
                      commentInputController: commentInputController,
                      onAddComment: () {
                        context.bloc<CommentBloc>().add(
                              AddComment(
                                text: commentInputController.text,
                              ),
                            );
                        commentInputController.clear();
                      },
                    ),
                ],
              );
            } else if (state is LoadingPostComments) {
              return const Loading();
            } else {
              return const ErrorContainer();
            }
          },
        ),
      ),
    );
  }

  bool shouldShowCommentsByState(CommentState state) =>
      state is InitialCommentState ||
      state is GetPostCommentsSuccess ||
      state is NewCommentAdded ||
      state is CommentDeletedSuccess ||
      state is NewSubCommentAdded ||
      state is EditingCommentStarted ||
      state is CommentEditedSuccess;

  Widget _buildWidgetsWhenEditingComment(CommentModel comment) {
    commentInputController.text = comment.texto;
    return EditCommentContainer(
      comment: comment,
      commentInputController: commentInputController,
    );
  }
}
