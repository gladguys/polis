import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import './bloc.dart';
import '../../model/politico_model.dart';
import '../../repository/abstract/follow_repository.dart';
import '../../repository/abstract/user_following_politics_repository.dart';

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
    if (event is FetchFollowingPolitics) {
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
    if (event is SearchPoliticsByTerm) {
      final term = event.term;

      if (term.isEmpty) {
        yield PoliticsFilteredByTerm(filteredPolitics: politicsFollowing);
      } else {
        final politicsMatched = politicsFollowing
            .where((politic) => politic.nomeEleitoral
                .toLowerCase()
                .contains(term.toLowerCase()))
            .toList();
        yield PoliticsFilteredByTerm(filteredPolitics: politicsMatched);
      }
    }
    if (event is FollowUnfollowPolitic) {
      try {
        final user = event.user;
        final politico = event.politico;
        final isBeingFollowed = isPoliticBeingFollowed(politico);

        if (isBeingFollowed) {
          await followRepository.unfollowPolitic(
              user: user, politico: politico);
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

  bool isPoliticBeingFollowed(PoliticoModel politico) {
    return isPoliticFollowed[politico.id];
  }

  void _initPoliticBeingFollowed() {
    for (var politic in politicsFollowing) {
      isPoliticFollowed[politic.id] = true;
    }
  }
}
