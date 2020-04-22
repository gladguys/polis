import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/blocs.dart';
import '../../core/routing/route_names.dart';
import '../../i18n/i18n.dart';
import '../../widget/default_bottombar.dart';
import '../../widget/loading.dart';
import 'widget/politic_profile.dart';

class PoliticProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: DefaultBottombar(SEARCH_POLITIC_PAGE),
      body: SafeArea(
        child: BlocBuilder<PoliticProfileBloc, PoliticProfileState>(
          builder: (_, state) {
            if (state is GetPoliticInfoSuccess ||
                state is UserFollowingPoliticChanged) {
              return PoliticProfile(state);
            } else if (state is GetPoliticInfoFailed) {
              return const Center(
                child: Text(ERROR_FETCHING_POLITIC_INFO),
              );
            } else {
              return Loading();
            }
          },
        ),
      ),
    );
  }
}
