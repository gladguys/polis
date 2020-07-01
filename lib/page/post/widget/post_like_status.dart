import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/blocs.dart';
import '../../../core/i18n/i18n.dart';
import '../../../core/utils/general_utils.dart';

class PostLikeStatus extends StatelessWidget {
  PostLikeStatus({this.post});

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
    if (postLiked) {
      return Text(
        isPostProposal(post) ? LIKED_PROPOSAL : LIKED_EXPENSE,
        style: TextStyle(
          color: Colors.green,
        ),
        textAlign: TextAlign.start,
      );
    } else if (postUnliked) {
      return Text(
        isPostProposal(post) ? NOT_LIKED_PROPOSAL : NOT_LIKED_EXPENSE,
        style: TextStyle(
          color: Colors.red,
        ),
        textAlign: TextAlign.start,
      );
    }
    return const SizedBox.shrink();
  }
}
