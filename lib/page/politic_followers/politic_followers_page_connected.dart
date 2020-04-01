import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/blocs.dart';
import '../../repository/concrete/repositories.dart';
import '../page_connected.dart';
import '../pages.dart';

class PoliticFollowersPageConnected extends StatelessWidget {
  PoliticFollowersPageConnected(this.politicId);

  final String politicId;

  @override
  Widget build(BuildContext context) {
    return PageConnected<PoliticFollowersBloc>(
      bloc: PoliticFollowersBloc(
        repository: context.repository<FirebasePoliticFollowersRepository>(),
      )..add(GetPoliticFollowers(politicId)),
      page: PoliticFollowersPage(),
    );
  }
}
