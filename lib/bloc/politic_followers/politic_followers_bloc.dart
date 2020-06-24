import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../core/domain/model/models.dart';
import '../../core/repository/abstract/politic_followers_repository.dart';

part 'politic_followers_event.dart';
part 'politic_followers_state.dart';

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
    if (event is GetPoliticFollowers) {
      yield* _mapGetPoliticFollowersToState(event);
    }
  }

  Stream<PoliticFollowersState> _mapGetPoliticFollowersToState(
      GetPoliticFollowers event) async* {
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
