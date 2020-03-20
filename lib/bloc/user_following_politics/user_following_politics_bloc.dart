import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import './bloc.dart';
import '../../core/exception/exceptions.dart';
import '../../model/politico_model.dart';
import '../../repository/abstract/follow_repository.dart';
import '../../repository/abstract/user_following_politics_repository.dart';

class UserFollowingPoliticsBloc
    extends Bloc<UserFollowingPoliticsEvent, UserFollowingPoliticsState> {
  UserFollowingPoliticsBloc(
      {@required this.userFollowingPoliticsRepository,
      @required this.followRepository});

  final UserFollowingPoliticsRepository userFollowingPoliticsRepository;
  final FollowRepository followRepository;
  List<PoliticoModel> politicsFollowing = [];
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
        yield FetchPoliticsSuccess(politicsFollowing);
      } on Exception {
        rethrow;
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
    if (event is UnfollowPolitic) {
      try {
        await followRepository.unfollowPolitic(
            user: event.user, politico: event.politico);
        politicsFollowing.remove(event.politico);
        yield FollowedPoliticsUpdated(followedPolitics: [...politicsFollowing]);
      } on Exception {
        throw ComunicationException();
      }
    }
  }
}
