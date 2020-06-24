import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../core/repository/abstract/politic_followers_repository.dart';
import 'politic_followers_event.dart';
import 'politic_followers_state.dart';

class PoliticFollowersBloc
    extends Bloc<PoliticFollowersEvent, PoliticFollowersState> {
  PoliticFollowersBloc({@required this.repository})
      : assert(repository != null);

  final PoliticFollowersRepository repository;

  @override
  PoliticFollowersState get initialState => InitialPoliticFollowersState();

  @override
  Stream<PoliticFollowersState> mapEventToState(
      PoliticFollowersEvent event) async* {
    yield* event.map(
      getPoliticFollowers: _mapGetPoliticFollowersToState,
    );
  }

  Stream<PoliticFollowersState> _mapGetPoliticFollowersToState(
      PoliticFollowersEvent event) async* {
    try {
      yield LoadingPoliticFollowers();

      final followers =
          await repository.getUsersFollowingPolitic(event.politicId);
      yield GetPoliticFollowersSuccess(followers: followers);
    } on Exception {
      yield GetPoliticFollowersFailed();
    }
  }
}
