import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_router/simple_router.dart';

import '../../../bloc/blocs.dart';
import '../../../core/extension/extensions.dart';
import '../../../core/i18n/i18n.dart';
import '../../../core/keys.dart';
import '../../../widget/card_base.dart';
import '../../../widget/error_container.dart';
import '../../../widget/field_rounded.dart';
import '../../../widget/loading.dart';
import '../../theme/main_theme.dart';
import '../../user_profile/user_profile_page_connected.dart';
import 'widget/menu_edit_delete_comment.dart';
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
              state is AddedSubCommentSuccess ||
              state is DeletedSubCommentSuccess) {
            final user = context.bloc<UserBloc>().user;
            final subComments = context.bloc<SubCommentsBloc>().subComments;
            final commentPai = context.bloc<SubCommentsBloc>().comment;
            return Stack(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 70),
                  child: CustomScrollView(
                    slivers: <Widget>[
                      SliverList(
                        delegate: SliverChildListDelegate(
                          [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8, 8, 8, 16),
                              child: CardBase(
                                slotBottomWithIndent: false,
                                paddingSlotCenter:
                                    const EdgeInsets.only(bottom: 4),
                                slotCenter: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
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
                                        (commentPai.usuarioId == user.userId)
                                            ? MenuEditDeleteComment(
                                                onEdit: () => {},
                                                onDelete: () => context
                                                    .bloc<CommentBloc>()
                                                    .add(
                                                      DeleteComment(commentPai),
                                                    ),
                                              )
                                            : Container(),
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
                                      commentPai.diaHora
                                          .toString()
                                          .formatDateTime(),
                                      style: TextStyle(
                                        fontSize: 11,
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      subComments.isNotEmpty
                          ? SubCommentsList(
                              subComments: subComments,
                            )
                          : SliverList(
                              delegate: SliverChildListDelegate(
                                [
                                  const NoSubCommentForComment(),
                                ],
                              ),
                            ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    width: context.screenWidth,
                    alignment: Alignment.center,
                    color: theme.scaffoldBackgroundColor,
                    child: Column(
                      children: <Widget>[
                        const Divider(color: Colors.grey, height: 16),
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
                    ),
                  ),
                ),
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
