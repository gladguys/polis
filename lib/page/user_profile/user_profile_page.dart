import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/blocs.dart';
import '../../bloc/utils.dart';
import '../../core/routing/route_names.dart';
import '../../widget/default_bottombar.dart';
import 'widget/user_profile.dart';
import 'widget/user_profile_skeleton.dart';

class UserProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: DefaultBottombar(USER_PROFILE_PAGE, withBack: true),
      body: SafeArea(
        child: BlocBuilder<UserProfileBloc, UserProfileState>(
          builder: (_, state) => state.join(
            _mapLoadingStateToWidget,
            _mapFetchUserRelatedInfoSuccessToWidget,
            _mapLoadingStateToWidget,
            mapErrorStateToWidget,
          ),
        ),
      ),
    );
  }

  Widget _mapFetchUserRelatedInfoSuccessToWidget(
      FetchUserRelatedInfoSuccess state) {
    final politicsFollowing = state.politicsFollowing;
    final userActions = state.userActions;
    return UserProfile(
      politicsFollowing: politicsFollowing,
      userActions: userActions,
    );
  }

  Widget _mapLoadingStateToWidget(state) {
    return const UserProfileSkeleton();
  }
}
