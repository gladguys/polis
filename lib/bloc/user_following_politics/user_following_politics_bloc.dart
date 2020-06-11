import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../core/domain/model/models.dart';
import '../../core/repository/abstract/repositories.dart';
import '../blocs.dart';

class UserFollowingPoliticsBloc
    extends Bloc<UserFollowingPoliticsEvent, UserFollowingPoliticsState> {
  UserFollowingPoliticsBloc(
      {@required this.userFollowingPoliticsRepository,
      @required this.followRepository})
      : assert(userFollowingPoliticsRepository != null),
        assert(followRepository != null);

  final UserFollowingPoliticsRepository userFollowingPoliticsRepository;
  final FollowRepository followRepository;

  List<PoliticoModel> politicsFollowing = [];
  Map<String, bool> isPoliticFollowed = {};
  String searchTerm = '';

  @override
  UserFollowingPoliticsState get initialState =>
      InitialUserFollowingPoliticsState();

  @override
  Stream<UserFollowingPoliticsState> mapEventToState(
      UserFollowingPoliticsEvent event) async* {
    yield* event.join(
      _mapFetchFollowingPoliticsToState,
      _mapSearchPoliticsByTermToState,
      _mapFollowUnfollowPoliticToState,
    );
  }

  bool isPoliticBeingFollowed(PoliticoModel politico) =>
      isPoliticFollowed[politico.id] ?? false;

  void _initPoliticBeingFollowed() {
    for (var politic in politicsFollowing) {
      isPoliticFollowed[politic.id] = true;
    }
  }

  Stream<UserFollowingPoliticsState> _mapFetchFollowingPoliticsToState(
      FetchFollowingPolitics event) async* {
    yield LoadingPolitics();

    try {
      politicsFollowing = await userFollowingPoliticsRepository
          .getFollowingPolitics(event.userId);
      _initPoliticBeingFollowed();

      yield FetchPoliticsSuccess(politicsFollowing);
    } on Exception {
      yield FetchPoliticsFailed();
    }
  }

  Stream<UserFollowingPoliticsState> _mapSearchPoliticsByTermToState(
      SearchPoliticsByTerm event) async* {
    final term = event.term;

    if (term.isEmpty) {
      yield PoliticsFilteredByTerm(filteredPolitics: politicsFollowing);
    } else {
      final politicsMatched = politicsFollowing
          .where((politic) =>
              politic.nomeEleitoral.toLowerCase().contains(term.toLowerCase()))
          .toList();
      yield PoliticsFilteredByTerm(filteredPolitics: politicsMatched);
    }
  }

  Stream<UserFollowingPoliticsState> _mapFollowUnfollowPoliticToState(
      FollowUnfollowPolitic event) async* {
    try {
      final user = event.user;
      final politico = event.politico;
      final isBeingFollowed = isPoliticBeingFollowed(politico);

      if (isBeingFollowed) {
        await followRepository.unfollowPolitic(user: user, politico: politico);
      } else {
        await followRepository.followPolitic(user: user, politico: politico);
      }
      isPoliticFollowed[politico.id] = !isBeingFollowed;

      yield FollowedPoliticsUpdated(
        followedPolitics: [...politicsFollowing],
        politicoUpdated: politico,
        isFollowing: isBeingFollowed,
      );
    } on Exception {
      yield FollowUnfollowFailed();
    }
  }
}
