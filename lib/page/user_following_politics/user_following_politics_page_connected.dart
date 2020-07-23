import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/cubits.dart';
import '../../core/domain/model/models.dart';
import '../../core/repository/concrete/repositories.dart';
import '../page_connected.dart';
import '../pages.dart';

class UserFollowingPoliticsPageConnected extends StatelessWidget {
  UserFollowingPoliticsPageConnected({@required this.user})
      : assert(user != null);

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return PageConnected<UserFollowingPoliticsCubit>(
      bloc: UserFollowingPoliticsCubit(
        userFollowingPoliticsRepository:
            context.repository<FirebaseUserFollowingPoliticsRepository>(),
        followRepository: context.repository<FirebaseFollowRepository>(),
      )..fetchFollowingPolitics(userId: user.userId),
      page: UserFollowingPoliticsPage(),
    );
  }
}
