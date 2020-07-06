import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/blocs.dart';
import '../../../core/i18n/i18n.dart';
import '../../../core/keys.dart';
import '../../../widget/field_rounded.dart';
import 'widget/comments_reply_list.dart';

class CommentRepliesPage extends StatefulWidget {
  @override
  _CommentRepliesPageState createState() => _CommentRepliesPageState();
}

class _CommentRepliesPageState extends State<CommentRepliesPage> {
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
      body: BlocBuilder<CommentRepliesBloc, CommentRepliesState>(
        builder: (_, state) => Column(
          children: [
            Expanded(
              child: CommentsReplyList(
                comments: context.bloc<CommentRepliesBloc>().commentReplies,
              ),
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
                  context.bloc<CommentRepliesBloc>().add(
                        AddReplyComment(
                          commentReplied:
                              context.bloc<CommentRepliesBloc>().comment,
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
    );
  }
}
