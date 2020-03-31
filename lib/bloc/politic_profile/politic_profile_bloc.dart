import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import './bloc.dart';
import '../../repository/concrete/repositories.dart';

class PoliticProfileBloc
    extends Bloc<PoliticProfileEvent, PoliticProfileState> {
  PoliticProfileBloc({@required this.repository}) : assert(repository != null);

  final FirebasePoliticProfileRepository repository;

  @override
  PoliticProfileState get initialState => InitialPoliticProfileState();

  @override
  Stream<PoliticProfileState> mapEventToState(
      PoliticProfileEvent event) async* {
    if (event is GetPoliticInfo) {
      try {
        yield LoadingPoliticInfo();

        final politicId = event.politicId;
        final politic = await repository.getInfoPolitic(politicId);
        final usersFollowing =
            await repository.getUsersFollowingPolitic(politicId);

        yield GetPoliticInfoSuccess(
          politic: politic,
          usersFollowing: usersFollowing,
        );
      } on Exception {
        yield GetPoliticInfoFailed();
      }
    }
  }
}
