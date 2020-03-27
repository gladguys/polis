import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:getflutter/getflutter.dart';

import '../../../i18n/i18n.dart';
import '../../../model/user_model.dart';

class PersonalUserInfo extends StatelessWidget {
  PersonalUserInfo({this.user});

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 18, 0, 10),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(60),
            child: FancyShimmerImage(
              imageUrl: user.photoUrl,
              width: 120,
              height: 120,
            ),
          ),
        ),
        Text(
          user.name,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          user.email,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GFButton(
              color: Colors.yellow,
              type: GFButtonType.solid,
              shape: GFButtonShape.pills,
              size: 46,
              child: Text(
                EDIT_PROFILE,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {},
            ),
            const SizedBox(width: 8),
            GFButton(
              type: GFButtonType.outline,
              shape: GFButtonShape.pills,
              size: 46,
              color: Colors.grey,
              child: Text(
                FAVORITE_POSTS,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {},
            ),
          ],
        )
      ],
    );
  }
}
