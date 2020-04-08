import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/blocs.dart';
import '../../../i18n/i18n.dart';
import '../../../widget/button_follow_unfollow.dart';

class PoliticActionButtons extends StatelessWidget {
  PoliticActionButtons({@required this.isBeingFollowedByUser})
      : assert(isBeingFollowedByUser != null);

  final bool isBeingFollowedByUser;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ButtonFollowUnfollow(
          key: const ValueKey('follow-politic-profile'),
          isOutline: false,
          height: 26,
          width: 130,
          fontSize: 12,
          isFollow: isBeingFollowedByUser,
          onPressed: () {
            context.bloc<PoliticProfileBloc>().add(
                  FollowUnfollowProfilePolitic(
                    isFollowing: isBeingFollowedByUser,
                  ),
                );
          },
        ),
        const SizedBox(width: 8),
        Container(
          height: 26,
          width: 130,
          child: OutlineButton(
            key: const ValueKey('send-email-btn'),
            onPressed: () {},
            padding: EdgeInsets.zero,
            highlightedBorderColor: Colors.grey[600],
            child: const Text(
              SEND_EMAIL,
              style: TextStyle(
                fontSize: 12,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
