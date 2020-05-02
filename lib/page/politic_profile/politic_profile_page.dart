import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/blocs.dart';
import '../../core/routing/route_names.dart';
import '../../widget/default_bottombar.dart';
import '../../widget/error_container.dart';
import '../../widget/loading.dart';
import 'widget/politic_profile.dart';

class PoliticProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:
          DefaultBottombar(SEARCH_POLITIC_PAGE, withBack: true),
      body: SafeArea(
        child: BlocBuilder<PoliticProfileBloc, PoliticProfileState>(
          builder: (_, state) {
            if (state is GetPoliticInfoSuccess ||
                state is UserFollowingPoliticChanged) {
              return PoliticProfile(state);
            } else if (state is GetPoliticInfoFailed ||
                state is FollowPoliticFailed) {
              return ErrorContainer();
            } else {
              return Loading();
            }
          },
        ),
      ),
    );
  }
}
