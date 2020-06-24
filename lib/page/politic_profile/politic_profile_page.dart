import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/blocs.dart';
import '../../widget/error_container.dart';
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
          builder: (_, state) {
            if (state is GetPoliticInfoSuccess ||
                state is UserFollowingPoliticChanged) {
              return PoliticProfile(
                state,
                onUnfollowPolitic: onUnfollowPolitic,
              );
            } else if (state is GetPoliticInfoFailed ||
                state is FollowPoliticFailed) {
              return const ErrorContainer();
            } else {
              return const PoliticProfileSkeleton();
            }
          },
        ),
      ),
    );
  }
}
