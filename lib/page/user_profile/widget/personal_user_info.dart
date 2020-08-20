import 'package:flutter/material.dart';
import 'package:simple_router/simple_router.dart';

import '../../../core/domain/model/models.dart';
import '../../../core/i18n/i18n.dart';
import '../../../core/routing/route_names.dart';
import '../../../widget/photo.dart';
import '../../pages.dart';

class PersonalUserInfo extends StatelessWidget {
  PersonalUserInfo({this.user, this.isUserPickedTheLocal = true});

  final UserModel user;
  final bool isUserPickedTheLocal;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Photo(
          url: user.photoUrl,
          boxFit: BoxFit.cover,
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
            color: Theme.of(context).brightness == Brightness.light
                ? Colors.grey[600]
                : Colors.grey[300],
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            isUserPickedTheLocal
                ? Container(
                    height: 30,
                    width: 130,
                    child: FlatButton(
                      padding: EdgeInsets.zero,
                      child: const Text(EDIT_PROFILE),
                      color: Colors.amber,
                      textColor: Colors.black,
                      onPressed: () => SimpleRouter.forward(
                        EditProfilePageConnected(),
                        name: EDIT_PROFILE_PAGE,
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
          ],
        )
      ],
    );
  }
}
