import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/cubits.dart';
import '../../../core/domain/model/comment_model.dart';
import '../../../core/utils/general_utils.dart';
import '../../../widget/error_container.dart';
import '../../../widget/loading.dart';
import '../../../widget/post/post_despesa_connected.dart';
import '../../../widget/post/post_proposta_connected.dart';
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

  dynamic get post => context.bloc<CommentCubit>().post;
  bool get isPostProposta => isPostProposal(post);
  bool get isPostDespesa => isPostExpense(post);

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
        child: BlocBuilder<CommentCubit, CommentState>(
          builder: (_, state) {
            if (shouldShowCommentsByState(state)) {
              final comments = context.bloc<CommentCubit>().postComments;
              return Stack(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.only(bottom: 70),
                    child: Column(
                      children: <Widget>[
                        if (isPostProposta)
                          PostPropostaConnected(
                            post,
                            isPostPreview: true,
                          ),
                        if (isPostDespesa)
                          PostDespesaConnected(
                            post,
                            isPostPreview: true,
                          ),
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
                        context.bloc<CommentCubit>().addComment(
                              text: commentInputController.text,
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
