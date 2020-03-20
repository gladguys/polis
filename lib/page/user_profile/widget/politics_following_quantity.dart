import 'package:flutter/material.dart';
import 'package:simple_router/simple_router.dart';

import '../../../core/routing/route_names.dart';
import '../../../i18n/i18n.dart';
import '../../../model/politico_model.dart';
import '../../pages.dart';

class PoliticsFollowingQuantity extends StatelessWidget {
  PoliticsFollowingQuantity({this.politics});

  final List<PoliticoModel> politics;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          FOLLOWING,
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
        GestureDetector(
          child: Text(
            politics.length.toString(),
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 26,
            ),
          ),
          onTap: () => SimpleRouter.forward(
            UserFollowingPoliticsPageConnected(),
            name: USER_FOLLOWING_POLITICS_PAGE,
          ),
        ),
        Text(
          POLITICS,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
