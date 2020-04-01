import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import './bloc.dart';
import '../../repository/abstract/politic_profile_repository.dart';

class PoliticProfileBloc
    extends Bloc<PoliticProfileEvent, PoliticProfileState> {
  PoliticProfileBloc({@required this.repository}) : assert(repository != null);

  final PoliticProfileRepository repository;

  @override
  PoliticProfileState get initialState => InitialPoliticProfileState();

  @override
  Stream<PoliticProfileState> mapEventToState(
      PoliticProfileEvent event) async* {
    if (event is GetPoliticInfo) {
      try {
        yield LoadingPoliticInfo();

        final politic = await repository.getInfoPolitic(event.politicId);
        yield GetPoliticInfoSuccess(politic: politic);
      } on Exception {
        yield GetPoliticInfoFailed();
      }
    }
  }
}
