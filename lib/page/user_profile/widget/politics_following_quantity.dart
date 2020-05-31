import 'package:flutter/material.dart';
import 'package:simple_router/simple_router.dart';

import '../../../core/domain/model/models.dart';
import '../../../core/i18n/i18n.dart';
import '../../../core/routing/route_names.dart';
import '../../pages.dart';

class PoliticsFollowingQuantity extends StatelessWidget {
  PoliticsFollowingQuantity({this.politics});

  final List<PoliticoModel> politics;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(5),
      onTap: () => SimpleRouter.forwardAndReplace(
        UserFollowingPoliticsPageConnected(),
        name: USER_FOLLOWING_POLITICS_PAGE,
      ),
      child: Column(
        children: <Widget>[
          Text(
            politics.length.toString(),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Text(
            FOLLOWING,
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
