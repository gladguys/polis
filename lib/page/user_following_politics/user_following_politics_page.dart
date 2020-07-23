import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_router/simple_router.dart';

import '../../bloc/cubits.dart';
import '../../widget/error_container.dart';
import '../pages.dart';
import 'widget/following_politics_search.dart';
import 'widget/following_politics_skeleton.dart';

class UserFollowingPoliticsPage extends StatefulWidget {
  @override
  _UserFollowingPoliticsPageState createState() =>
      _UserFollowingPoliticsPageState();
}

class _UserFollowingPoliticsPageState extends State<UserFollowingPoliticsPage> {
  @override
  void initState() {
    super.initState();
    BackButtonInterceptor.add((_) => onBackButtonPressed());
  }

  @override
  void dispose() {
    BackButtonInterceptor.remove((_) => onBackButtonPressed());
    super.dispose();
  }

  bool onBackButtonPressed() {
    final localUser = context.bloc<UserCubit>().user;
    final pickedUser = context.bloc<UserProfileCubit>().user;
    final isLocalUserThePickedOne = localUser == pickedUser;

    SimpleRouter.forwardAndReplace(
      UserProfilePageConnected(
        userId: isLocalUserThePickedOne ? localUser.userId : pickedUser.userId,
      ),
    );
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<UserFollowingPoliticsCubit,
            UserFollowingPoliticsState>(
          listener: (_, state) {},
          builder: (_, state) {
            if (state is FetchPoliticsSuccess) {
              return FollowingPoliticsSearch(state.politics);
            } else if (state is PoliticsFilteredByTerm) {
              return FollowingPoliticsSearch(state.filteredPolitics);
            } else if (state is FollowedPoliticsUpdated) {
              return FollowingPoliticsSearch(state.followedPolitics);
            } else if (state is FetchPoliticsFailed) {
              return const ErrorContainer();
            } else {
              return const FollowingPoliticsSkeleton();
            }
          },
        ),
      ),
    );
  }
}
