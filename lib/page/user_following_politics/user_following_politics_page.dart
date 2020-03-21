import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_router/simple_router.dart';

import '../../bloc/user_following_politics/bloc.dart';
import '../../core/routing/route_names.dart';
import '../../widget/centered_loading.dart';
import '../../widget/default_bottombar.dart';
import '../pages.dart';
import 'widget/following_politics_search.dart';

class UserFollowingPoliticsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: DefaultBottombar(
          USER_FOLLOWING_POLITICS_PAGE,
          onPopCallback: () =>
              SimpleRouter.forwardAndReplace(UserProfilePageConnected()),
        ),
        body:
            BlocConsumer<UserFollowingPoliticsBloc, UserFollowingPoliticsState>(
          listener: (_, state) {},
          builder: (_, state) {
            if (state is FetchPoliticsSuccess) {
              return FollowingPoliticsSearch(state.politics);
            } else if (state is PoliticsFilteredByTerm) {
              return FollowingPoliticsSearch(state.filteredPolitics);
            } else if (state is FollowedPoliticsUpdated) {
              return FollowingPoliticsSearch(state.followedPolitics);
            } else {
              return const CenteredLoading();
            }
          },
        ),
      ),
    );
  }
}
