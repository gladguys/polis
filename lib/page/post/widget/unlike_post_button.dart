import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';

import '../../../bloc/blocs.dart';
import '../../../core/repository/concrete/firebase/firebase.dart';
import '../../../core/utils/general_utils.dart';
import '../../../widget/button_action_card.dart';

class UnlikePostButton extends StatelessWidget {
  UnlikePostButton({this.post});

  final dynamic post;

  @override
  Widget build(BuildContext context) {
    final postUnliked = isPostUnlikedForUser(
      post: post,
      user: context.bloc<UserBloc>().user,
    );
    return ButtonActionCard(
      icon: AntDesign.dislike2,
      iconColor: postUnliked ? Colors.red : Colors.black,
      text: '''${context.bloc<PostBloc>().post[QTD_NAO_CURTIDAS_FIELD] ?? 0}''',
      textColor: postUnliked ? Colors.red : Colors.black,
      onTap: () => context.bloc<PostBloc>().add(
            UnlikePost(
              user: context.bloc<UserBloc>().user,
              postId: getPostId(post),
              politicoId: getPoliticoIdFromPost(post),
            ),
          ),
    );
  }
}
