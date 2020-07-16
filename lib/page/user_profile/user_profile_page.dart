import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_router/simple_router.dart';

import '../../bloc/blocs.dart';
import '../../core/routing/route_names.dart';
import '../../widget/error_container.dart';
import '../pages.dart';
import '../user_profile/widget/user_profile.dart';
import '../user_profile/widget/user_profile_skeleton.dart';
import 'widget/user_profile.dart';
import 'widget/user_profile_skeleton.dart';

class UserProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<UserProfileBloc, UserProfileState>(
          listener: (_, state) {
            if (state is GetPostInfoSuccess) {
              SimpleRouter.forward(
                PostPageConnected(
                  post: state.post,
                  postType: state.postType,
                ),
                name: POST_PAGE,
              );
            }
          },
          builder: (_, state) {
            if (state is FetchUserRelatedInfoSuccess ||
                state is GetPostInfoSuccess) {
              final politicsFollowing =
                  context.bloc<UserProfileBloc>().politicsFollowing;
              final userActions = context.bloc<UserProfileBloc>().userActions;
              return UserProfile(
                user: context.bloc<UserProfileBloc>().user,
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
