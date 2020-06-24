import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/blocs.dart';
import '../../bloc/commom_bloc.dart';
import 'widget/politic_profile.dart';
import 'widget/politic_profile_skeleton.dart';

class PoliticProfilePage extends StatelessWidget {
  PoliticProfilePage({this.onUnfollowPolitic});

  final VoidCallback onUnfollowPolitic;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<PoliticProfileBloc, PoliticProfileState>(
          builder: (_, state) => state.maybeMap(
            getPoliticInfoSuccess: _mapStateToWidget,
            userFollowingPoliticChanged: _mapStateToWidget,
            loadingPoliticInfo: _mapLoadingStateToWidget,
            getPoliticInfoFailed: mapErrorStateToWidget,
            followPoliticFailed: mapErrorStateToWidget,
            openEmailIntentFailed: mapErrorStateToWidget,
            orElse: mapLoadingToWidget,
          ),
        ),
      ),
    );
  }

  Widget _mapStateToWidget(state) {
    return PoliticProfile(
      state,
      onUnfollowPolitic: onUnfollowPolitic,
    );
  }

  Widget _mapLoadingStateToWidget(state) {
    return const PoliticProfileSkeleton();
  }
}
