import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/blocs.dart';
import '../../core/routing/route_names.dart';
import '../../widget/default_bottombar.dart';
import '../../widget/error_container.dart';
import 'widget/user_profile.dart';
import 'widget/user_profile_skeleton.dart';

class UserProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: DefaultBottombar(USER_PROFILE_PAGE, withBack: true),
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
              return UserProfileSkeleton();
            } else {
              return const ErrorContainer();
            }
          },
        ),
      ),
    );
  }
}
