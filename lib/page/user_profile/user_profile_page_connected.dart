import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/cubits.dart';
import '../../core/repository/concrete/repositories.dart';
import '../page_connected.dart';
import 'user_profile_page.dart';

class UserProfilePageConnected extends StatelessWidget {
  UserProfilePageConnected({@required this.userId}) : assert(userId != null);

  final String userId;

  @override
  Widget build(BuildContext context) {
    return PageConnected<UserProfileCubit>(
      bloc: UserProfileCubit(
        repository: context.repository<FirebaseUserProfileRepository>(),
      )..fetchUserRelatedInfo(userId),
      page: UserProfilePage(),
    );
  }
}
