import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_router/simple_router.dart';

import '../../../bloc/cubits.dart';
import '../../../core/domain/model/models.dart';
import '../../../core/extension/extensions.dart';
import '../../../core/i18n/i18n.dart';
import '../../../widget/card_base.dart';
import '../../../widget/error_container.dart';
import '../../../widget/loading.dart';
import '../../../widget/text_title.dart';
import '../../user_profile/user_profile_page_connected.dart';
import 'widget/add_comment_container.dart';
import 'widget/edit_sub_comment_container.dart';
import 'widget/no_sub_comment_for_comment.dart';
import 'widget/sub_comments_list.dart';

class SubCommentsPage extends StatefulWidget {
  @override
  _SubCommentsPageState createState() => _SubCommentsPageState();
}

class _SubCommentsPageState extends State<SubCommentsPage> {
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
        child: BlocBuilder<SubCommentsCubit, SubCommentsState>(
          builder: (_, state) {
            if (shouldShowCommentsByState(state)) {
              return Stack(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 70),
                    child: CustomScrollView(
                      slivers: <Widget>[
                        _buildComment(),
                        _buildSubcomments(),
                      ],
                    ),
                  ),
                  if (state is EditingSubCommentStarted)
                    _buildWidgetWhenEditingSubComment(state.subComment),
                  if (state is! EditingSubCommentStarted)
                    AddCommentContainer(
                      commentInputController: commentInputController,
                      onAddComment: () {
                        context.bloc<SubCommentsCubit>().addSubComment(
                              text: commentInputController.text,
                            );
                        commentInputController.clear();
                      },
                    ),
                ],
              );
            } else if (state is CommentSubCommentsLoading) {
              return const Loading();
            }
            return const ErrorContainer();
          },
        ),
      ),
    );
  }

  Widget _buildComment() {
    final commentPai = context.bloc<SubCommentsCubit>().comment;
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 8, 8, 16),
            child: Column(
              children: <Widget>[
                TextTitle(ANSWERS),
                const SizedBox(height: 8),
                CardBase(
                  slotBottomWithIndent: false,
                  paddingSlotCenter: const EdgeInsets.only(bottom: 4),
                  slotCenter: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          InkWell(
                            onTap: () => SimpleRouter.forward(
                              UserProfilePageConnected(
                                userId: commentPai.usuarioId,
                              ),
                            ),
                            child: Text(
                              commentPai.usuarioNome,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(commentPai.texto),
                    ],
                  ),
                  slotBottom: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        commentPai.diaHora.toString().formatDateTime(),
                        style: TextStyle(
                          fontSize: 11,
                          color:
                              Theme.of(context).brightness == Brightness.light
                                  ? Colors.grey[600]
                                  : Colors.grey[300],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSubcomments() {
    final subComments = context.bloc<SubCommentsCubit>().subComments;
    return subComments.isNotEmpty
        ? SubCommentsList(
            subComments: subComments,
          )
        : SliverList(
            delegate: SliverChildListDelegate(
              [
                const NoSubCommentForComment(),
              ],
            ),
          );
  }

  bool shouldShowCommentsByState(SubCommentsState state) =>
      state is InitialSubCommentsState ||
      state is GetCommentSubCommentsSuccess ||
      state is AddedSubCommentSuccess ||
      state is DeletedSubCommentSuccess ||
      state is EditingSubCommentStarted ||
      state is SubCommentEditedSuccess;

  Widget _buildWidgetWhenEditingSubComment(SubCommentModel subComment) {
    commentInputController.text = subComment.texto;
    return EditSubCommentContainer(
      subComment: subComment,
      commentInputController: commentInputController,
    );
  }
}
