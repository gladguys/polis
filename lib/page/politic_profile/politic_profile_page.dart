import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/blocs.dart';
import '../../core/routing/route_names.dart';
import '../../widget/default_bottombar.dart';
import '../../widget/error_container.dart';
import 'widget/politic_profile.dart';
import 'widget/politic_profile_skeleton.dart';

class PoliticProfilePage extends StatelessWidget {
  PoliticProfilePage({this.onUnfollowPolitic});

  final VoidCallback onUnfollowPolitic;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: DefaultBottombar(
        SEARCH_POLITIC_PAGE,
        withBack: true,
      ),
      body: SafeArea(
        child: BlocBuilder<PoliticProfileBloc, PoliticProfileState>(
          builder: (_, state) {
            return state.join(
              _mapGetPoliticInfoSuccessToWidget,
              _mapGetPoliticInfoFailedToWidget,
              _mapLoadingPoliticInfoToWidget,
              _mapPoliticMoreActivitiesSuccessToWidget,
              _mapUserFollowingPoliticChangedToWidget,
              _mapFollowPoliticFailedToWidget,
              _mapPoliticDontHaveValidEmailToState,
              _mapOpenEmailIntentFailedToState,
            );
          },
        ),
      ),
    );
  }

  Widget _mapGetPoliticInfoSuccessToWidget(state) {
    return PoliticProfile(
      state,
      onUnfollowPolitic: onUnfollowPolitic,
    );
  }

  Widget _mapGetPoliticInfoFailedToWidget(state) {
    return const ErrorContainer();
  }

  Widget _mapLoadingPoliticInfoToWidget(state) {
    return const PoliticProfileSkeleton();
  }

  Widget _mapPoliticMoreActivitiesSuccessToWidget(state) {
    return PoliticProfile(
      state,
      onUnfollowPolitic: onUnfollowPolitic,
    );
  }

  Widget _mapUserFollowingPoliticChangedToWidget(state) {
    return PoliticProfile(
      state,
      onUnfollowPolitic: onUnfollowPolitic,
    );
  }

  Widget _mapFollowPoliticFailedToWidget(state) {
    return const ErrorContainer();
  }

  Widget _mapPoliticDontHaveValidEmailToState(state) {
    return const ErrorContainer();
  }

  Widget _mapOpenEmailIntentFailedToState(state) {
    return const ErrorContainer();
  }
}
