import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import './bloc.dart';
import '../../model/politico_model.dart';
import '../../repository/abstract/politic_suggestion_repository.dart';
import '../../repository/abstract/user_repository.dart';

class PoliticSuggestionBloc
    extends Bloc<PoliticSuggestionEvent, PoliticSuggestionState> {
  PoliticSuggestionBloc(
      {@required this.politicSuggestionRepository,
      @required this.userRepository})
      : assert(politicSuggestionRepository != null),
        assert(userRepository != null);

  final PoliticSuggestionRepository politicSuggestionRepository;
  final UserRepository userRepository;

  List<PoliticoModel> politics;
  List<PoliticoModel> followedPolitics = [];

  @override
  PoliticSuggestionState get initialState => InitialPoliticSuggestionState();

  @override
  Stream<PoliticSuggestionState> mapEventToState(
      PoliticSuggestionEvent event) async* {
    if (event is FetchSuggestedPolitics) {
      yield LoadingFetch();

      try {
        politics = await politicSuggestionRepository.getSuggestedPolitics();
        yield FetchSuggestedPoliticsSuccess(politics);
      } on Exception {
        yield FetchSuggestedPoliticsFailed();
      }
    }
    if (event is FollowOrUnfollowPolitic) {
      final politico = event.politico;
      final isFollowing = isPoliticBeenFollowed(politico);
      if (isFollowing) {
        followedPolitics.remove(politico);
      } else {
        followedPolitics.add(politico);
      }
      yield ChangedPoliticsFollowingStatus(
        event.politico,
        isFollowing: !isFollowing,
      );
    }
    if (event is SavePoliticsToFollow) {
      yield LoadingSaveFollowPolitics();

      try {
        await politicSuggestionRepository.savePoliticsToFollow(
          userId: event.user.userId,
          politics: followedPolitics,
        );
        await politicSuggestionRepository.saveFollowerToPolitics(
          user: event.user,
          politics: followedPolitics,
        );
        await userRepository.setFirstLoginDone(event.user);

        yield SavedSuggestedPolitics();
      } on Exception {
        yield SaveSuggestedPoliticsFailed();
      }
    }
  }

  bool isPoliticBeenFollowed(PoliticoModel politico) {
    return followedPolitics.contains(politico);
  }
}
