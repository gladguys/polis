import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/blocs.dart';
import '../../core/repository/concrete/repositories.dart';
import '../../core/service/locator.dart';
import '../../core/service/services.dart';
import '../page_connected.dart';
import '../pages.dart';

class PoliticProfilePageConnected extends StatelessWidget {
  PoliticProfilePageConnected(this.politicId, {this.onUnfollowPolitic});

  final String politicId;
  final VoidCallback onUnfollowPolitic;

  @override
  Widget build(BuildContext context) {
    return PageConnected<PoliticProfileBloc>(
      bloc: PoliticProfileBloc(
        user: context.bloc<UserBloc>().user,
        politicProfileRepository:
            context.repository<FirebasePoliticProfileRepository>(),
        followRepository: context.repository<FirebaseFollowRepository>(),
        urlLauncherService: G<UrlLauncherService>(),
      )..add(GetPoliticInfo(politicId)),
      page: PoliticProfilePage(onUnfollowPolitic: onUnfollowPolitic),
    );
  }
}
