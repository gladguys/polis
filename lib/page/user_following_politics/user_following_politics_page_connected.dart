import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/blocs.dart';
import '../../core/repository/concrete/repositories.dart';
import '../page_connected.dart';
import '../pages.dart';

class UserFollowingPoliticsPageConnected extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageConnected<UserFollowingPoliticsBloc>(
      bloc: UserFollowingPoliticsBloc(
        userFollowingPoliticsRepository:
            context.repository<FirebaseUserFollowingPoliticsRepository>(),
        followRepository: context.repository<FirebaseFollowRepository>(),
      )..add(
          FetchFollowingPolitics(userId: context.bloc<UserBloc>().user.userId),
        ),
      page: UserFollowingPoliticsPage(),
    );
  }
}
