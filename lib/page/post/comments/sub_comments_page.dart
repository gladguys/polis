import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/blocs.dart';
import '../../../core/i18n/i18n.dart';
import '../../../core/keys.dart';
import '../../../widget/error_container.dart';
import '../../../widget/field_rounded.dart';
import '../../../widget/loading.dart';
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
      appBar: AppBar(
        title: const Text(ANSWERS),
        centerTitle: true,
      ),
      body: BlocBuilder<SubCommentsBloc, SubCommentsState>(
        builder: (_, state) {
          if (state is GetCommentSubCommentsSuccess ||
              state is AddedSubCommentSuccess) {
            final subComments = context.bloc<SubCommentsBloc>().subComments;
            return Column(
              children: [
                Expanded(
                  child: subComments.isNotEmpty
                      ? SubCommentsList(
                          subComments: subComments,
                        )
                      : const NoSubCommentForComment(),
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
                      context.bloc<SubCommentsBloc>().add(
                            AddSubComment(
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
          } else if (state is CommentSubCommentsLoading) {
            return const Loading();
          }
          return const ErrorContainer();
        },
      ),
    );
  }
}
