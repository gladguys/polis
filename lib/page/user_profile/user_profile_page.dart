import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/blocs.dart';
import '../../widget/error_container.dart';
import 'widget/user_profile.dart';
import 'widget/user_profile_skeleton.dart';

class UserProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<UserProfileBloc, UserProfileState>(
          builder: (_, state) {
            if (state is FetchUserRelatedInfoSuccess) {
              final politicsFollowing = state.politicsFollowing;
              final userActions = state.userActions;
              return UserProfile(
                politicsFollowing: politicsFollowing,
                userActions: userActions,
              );
            } else if (state is LoadingFetchUserInfo) {
              return const UserProfileSkeleton();
            } else {
              return const ErrorContainer();
            }
          },
        ),
      ),
    );
  }
}
