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
    return BlocBuilder<PostBloc, PostState>(
      builder: (_, state) {
        final user = context.bloc<UserBloc>().user;
        final postLikeStatus = getPostLikeStatusForUser(post: post, user: user);
        var postLiked = postLikeStatus.item1;
        var postUnliked = postLikeStatus.item2;
        int qtdNaoCurtidas =
            context.bloc<PostBloc>().post[QTD_NAO_CURTIDAS_FIELD] ?? 0;

        if (state is PostLikedSuccess) {
          if (postUnliked) {
            qtdNaoCurtidas--;
          }

          postLiked = true;
          postUnliked = false;
        } else if (state is PostUnlikedSuccess) {
          qtdNaoCurtidas++;
          postLiked = false;
          postUnliked = true;
        } else if (state is StoppedUnlikingPostSuccess) {
          qtdNaoCurtidas--;
          postUnliked = false;
        }
        return ButtonActionCard(
          icon: postUnliked
              ? FontAwesomeIcons.solidThumbsDown
              : FontAwesomeIcons.thumbsDown,
          iconColor: postUnliked
              ? Colors.red
              : Theme.of(context).brightness == Brightness.light
                  ? Colors.grey[700]
                  : Colors.grey[500],
          text: qtdNaoCurtidas.toString(),
          textColor: postUnliked
              ? Colors.red
              : Theme.of(context).brightness == Brightness.light
                  ? Colors.grey[700]
                  : Colors.grey[500],
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
      },
    );
  }
}
