import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../core/domain/model/models.dart';
import '../../core/repository/abstract/repositories.dart';

part 'politic_suggestion_event.dart';
part 'politic_suggestion_state.dart';

class PoliticSuggestionBloc
    extends Bloc<PoliticSuggestionEvent, PoliticSuggestionState> {
  PoliticSuggestionBloc(
      {@required this.politicSuggestionRepository,
      @required this.userRepository})
      : assert(politicSuggestionRepository != null),
        assert(userRepository != null),
        super(InitialPoliticSuggestionState());

  final PoliticSuggestionRepository politicSuggestionRepository;
  final UserRepository userRepository;

  List<PoliticoModel> politics;
  List<PoliticoModel> followedPolitics = [];

  @override
  Stream<PoliticSuggestionState> mapEventToState(
      PoliticSuggestionEvent event) async* {
    if (event is FetchSuggestedPolitics) {
      yield* _mapFetchSuggestedPoliticsToState(event);
    }
    if (event is FollowOrUnfollowPolitic) {
      yield* _mapFollowOrUnfollowPoliticToState(event);
    }
    if (event is SavePoliticsToFollow) {
      yield* _mapSavePoliticsToFollowToState(event);
    }
  }

  Stream<PoliticSuggestionState> _mapFetchSuggestedPoliticsToState(
      FetchSuggestedPolitics event) async* {
    yield LoadingFetch();

    try {
      politics = await politicSuggestionRepository
          .getSuggestedPolitics(event.stateOption);
      yield FetchSuggestedPoliticsSuccess(politics);
    } on Exception {
      yield FetchSuggestedPoliticsFailed();
    }
  }

  Stream<PoliticSuggestionState> _mapFollowOrUnfollowPoliticToState(
      FollowOrUnfollowPolitic event) async* {
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

  Stream<PoliticSuggestionState> _mapSavePoliticsToFollowToState(
      SavePoliticsToFollow event) async* {
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

  bool isPoliticBeenFollowed(PoliticoModel politico) {
    return followedPolitics.contains(politico);
  }
}
