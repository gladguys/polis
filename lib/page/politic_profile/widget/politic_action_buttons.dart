import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/blocs.dart';
import '../../../core/keys.dart';
import '../../../i18n/i18n.dart';
import '../../../model/models.dart';
import '../../../widget/button_follow_unfollow.dart';

class PoliticActionButtons extends StatelessWidget {
  PoliticActionButtons(
      {@required this.politico,
      @required this.isBeingFollowedByUser,
      this.onUnfollowPolitic})
      : assert(politico != null),
        assert(isBeingFollowedByUser != null);

  final PoliticoModel politico;
  final bool isBeingFollowedByUser;
  final VoidCallback onUnfollowPolitic;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ButtonFollowUnfollow(
          key: followPoliticProfileKey,
          isOutline: false,
          height: 30,
          width: 140,
          fontSize: 14,
          isFollow: isBeingFollowedByUser,
          onPressed: () {
            context.bloc<PoliticProfileBloc>().add(
                  FollowUnfollowProfilePolitic(
                    isFollowing: isBeingFollowedByUser,
                  ),
                );
            if (onUnfollowPolitic != null) {
              onUnfollowPolitic();
            }
          },
        ),
        const SizedBox(width: 8),
        Container(
          height: 30,
          width: 130,
          child: OutlineButton(
            key: sendEmailButtonKey,
            onPressed: () =>
                context.bloc<PoliticProfileBloc>().add(SendEmailToPolitic()),
            padding: EdgeInsets.zero,
            highlightedBorderColor: Colors.grey[600],
            child: const Text(
              SEND_EMAIL,
              style: TextStyle(
                fontSize: 14,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
