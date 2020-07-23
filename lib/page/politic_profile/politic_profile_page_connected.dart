import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/cubits.dart';
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
    return PageConnected<PoliticProfileCubit>(
      bloc: PoliticProfileCubit(
        user: context.bloc<UserCubit>().user,
        politicProfileRepository:
            context.repository<FirebasePoliticProfileRepository>(),
        followRepository: context.repository<FirebaseFollowRepository>(),
        urlLauncherService: G<UrlLauncherService>(),
      )..getPoliticInfo(politicId),
      page: PoliticProfilePage(onUnfollowPolitic: onUnfollowPolitic),
    );
  }
}
