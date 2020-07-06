import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../bloc/blocs.dart';
import '../../../core/repository/concrete/firebase/firebase.dart';
import '../../../core/utils/general_utils.dart';
import '../../../widget/button_action_card.dart';

class UnlikePostButton extends StatelessWidget {
  UnlikePostButton({this.post});

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
      icon: postUnliked
          ? FontAwesomeIcons.solidThumbsDown
          : FontAwesomeIcons.thumbsDown,
      iconColor: postUnliked ? Colors.red : Colors.grey[700],
      text: '''${context.bloc<PostBloc>().post[QTD_NAO_CURTIDAS_FIELD] ?? 0}''',
      textColor: postUnliked ? Colors.red : Colors.grey[700],
      onTap: () => context.bloc<PostBloc>().add(
            postUnliked
                ? StopUnlikingPost(
                    user: context.bloc<UserBloc>().user,
                    postId: getPostId(post),
                    politicoId: getPoliticoIdFromPost(post),
                  )
                : UnlikePost(
                    user: context.bloc<UserBloc>().user,
                    postId: getPostId(post),
                    politicoId: getPoliticoIdFromPost(post),
                    isLiked: postLiked,
                  ),
          ),
    );
  }
}
