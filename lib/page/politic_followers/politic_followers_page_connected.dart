import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/cubits.dart';
import '../../core/repository/concrete/repositories.dart';
import '../page_connected.dart';
import '../pages.dart';

class PoliticFollowersPageConnected extends StatelessWidget {
  PoliticFollowersPageConnected(this.politicId);

  final String politicId;

  @override
  Widget build(BuildContext context) {
    return PageConnected<PoliticFollowersCubit>(
      bloc: PoliticFollowersCubit(
        repository: context.repository<FirebasePoliticFollowersRepository>(),
      )..getPoliticFollowers(politicId),
      page: PoliticFollowersPage(),
    );
  }
}
