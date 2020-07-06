import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
    final postUnliked = isPostUnlikedForUser(
      post: post,
      user: context.bloc<UserBloc>().user,
    );
    return ButtonActionCard(
      icon: postLiked
          ? FontAwesomeIcons.solidThumbsUp
          : FontAwesomeIcons.thumbsUp,
      iconColor: postLiked ? Colors.green : Colors.grey[700],
      text: '''${context.bloc<PostBloc>().post[QTD_CURTIDAS_FIELD] ?? 0}''',
      textColor: postLiked ? Colors.green : Colors.grey[700],
      onTap: () => context.bloc<PostBloc>().add(
            postLiked
                ? StopLikingPost(
                    user: context.bloc<UserBloc>().user,
                    postId: getPostId(post),
                    politicoId: getPoliticoIdFromPost(post),
                  )
                : LikePost(
                    user: context.bloc<UserBloc>().user,
                    postId: getPostId(post),
                    politicoId: getPoliticoIdFromPost(post),
                    isUnliked: postUnliked,
                  ),
          ),
    );
  }
}
