import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/politic_profile/politic_profile_bloc.dart';
import '../../bloc/politic_profile/politic_profile_event.dart';
import '../../repository/concrete/repositories.dart';
import '../page_connected.dart';
import '../pages.dart';

class PoliticProfilePageConnected extends StatelessWidget {
  PoliticProfilePageConnected(this.politicId);

  final String politicId;

  @override
  Widget build(BuildContext context) {
    return PageConnected<PoliticProfileBloc>(
      bloc: PoliticProfileBloc(
        repository: context.repository<FirebasePoliticProfileRepository>(),
      )..add(GetPoliticInfo(politicId)),
      page: PoliticProfilePage(),
    );
  }
}