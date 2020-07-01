import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';

import '../../../bloc/blocs.dart';
import '../../../core/repository/concrete/firebase/firebase.dart';
import '../../../core/utils/general_utils.dart';
import '../../../widget/button_action_card.dart';

class LikePostButton extends StatelessWidget {
  LikePostButton({this.post});

  final dynamic post;

  @override
  Widget build(BuildContext context) {
    final postLiked = isPostLikedForUser(
      post: post,
      user: context.bloc<UserBloc>().user,
    );
    return ButtonActionCard(
      icon: AntDesign.like2,
      iconColor: postLiked ? Colors.green : Colors.black,
      text: '''${context.bloc<PostBloc>().post[QTD_CURTIDAS_FIELD] ?? 0}''',
      textColor: postLiked ? Colors.green : Colors.black,
      onTap: () => context.bloc<PostBloc>().add(
            LikePost(
              user: context.bloc<UserBloc>().user,
              postId: getPostId(post),
              politicoId: getPoliticoIdFromPost(post),
            ),
          ),
    );
  }
}
