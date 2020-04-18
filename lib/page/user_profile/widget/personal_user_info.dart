import 'package:flutter/material.dart';
import 'package:simple_router/simple_router.dart';

import '../../../core/routing/route_names.dart';
import '../../../i18n/i18n.dart';
import '../../../model/models.dart';
import '../../../widget/photo.dart';
import '../../pages.dart';

class PersonalUserInfo extends StatelessWidget {
  PersonalUserInfo({this.user});

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Photo(
          url: user.photoUrl,
          boxFit: BoxFit.contain,
          size: 120,
          borderRadius: BorderRadius.circular(60),
        ),
        Text(
          user.name,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          user.email,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey[600],
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 30,
              width: 130,
              child: FlatButton(
                padding: EdgeInsets.zero,
                child: const Text(EDIT_PROFILE),
                color: Colors.amber,
                onPressed: () => SimpleRouter.forward(
                  EditProfilePageConnected(),
                  name: EDIT_PROFILE_PAGE,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Container(
              height: 30,
              width: 130,
              child: OutlineButton(
                padding: EdgeInsets.zero,
                child: const Text(FAVORITE_POSTS),
                highlightedBorderColor: Colors.grey,
                onPressed: () {},
              ),
            ),
          ],
        )
      ],
    );
  }
}
