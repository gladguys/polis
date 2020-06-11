import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_router/simple_router.dart';

import '../../bloc/blocs.dart';
import '../../bloc/utils.dart';
import '../../core/routing/route_names.dart';
import '../../widget/default_bottombar.dart';
import '../pages.dart';
import 'widget/following_politics_search.dart';
import 'widget/following_politics_skeleton.dart';

class UserFollowingPoliticsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: DefaultBottombar(
        USER_FOLLOWING_POLITICS_PAGE,
        withBack: true,
        onPopCallback: () =>
            SimpleRouter.forwardAndReplace(UserProfilePageConnected()),
      ),
      body: SafeArea(
        child:
            BlocBuilder<UserFollowingPoliticsBloc, UserFollowingPoliticsState>(
          builder: (_, state) => state.join(
            _mapLoadingPoliticsToWidget,
            _mapFetchPoliticsSuccessToWidget,
            _mapLoadingPoliticsToWidget,
            mapErrorStateToWidget,
            mapErrorStateToWidget,
            _mapFollowedPoliticsUpdatedToWidget,
            _mapPoliticsFilteredByTermToWidget,
          ),
        ),
      ),
    );
  }

  Widget _mapFetchPoliticsSuccessToWidget(FetchPoliticsSuccess state) {
    return FollowingPoliticsSearch(state.politics);
  }

  Widget _mapFollowedPoliticsUpdatedToWidget(FollowedPoliticsUpdated state) {
    return FollowingPoliticsSearch(state.followedPolitics);
  }

  Widget _mapPoliticsFilteredByTermToWidget(PoliticsFilteredByTerm state) {
    return FollowingPoliticsSearch(state.filteredPolitics);
  }

  Widget _mapLoadingPoliticsToWidget(state) {
    return const FollowingPoliticsSkeleton();
  }
}
