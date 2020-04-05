import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/blocs.dart';
import '../../../i18n/i18n.dart';

class PoliticActionButtons extends StatelessWidget {
  PoliticActionButtons({@required this.isBeingFollowedByUser})
      : assert(isBeingFollowedByUser != null);

  final bool isBeingFollowedByUser;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 28,
          width: 140,
          color: isBeingFollowedByUser ? Colors.red : Colors.green,
          child: OutlineButton(
            key: const ValueKey('follow-politic-profile'),
            onPressed: () => context.bloc<PoliticProfileBloc>().add(
                  FollowUnfollowProfilePolitic(
                      isFollowing: isBeingFollowedByUser),
                ),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            color: Colors.green,
            child: Text(
              isBeingFollowedByUser ? STOP_FOLLOW : FOLLOW,
              style: TextStyle(
                fontSize: 12,
                color: Colors.white,
              ),
            ),
          ),
        ),
        const SizedBox(width: 14),
        Container(
          height: 28,
          width: 140,
          child: OutlineButton(
            key: const ValueKey('send-email-btn'),
            onPressed: () {},
            padding: const EdgeInsets.symmetric(horizontal: 16),
            color: Colors.grey[350],
            child: const Text(
              'Enviar e-mail',
              style: TextStyle(
                fontSize: 12,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
