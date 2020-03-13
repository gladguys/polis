import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import './bloc.dart';
import '../../model/politico_model.dart';
import '../../repository/abstract/politic_suggestion_repository.dart';

class PoliticSuggestionBloc
    extends Bloc<PoliticSuggestionEvent, PoliticSuggestionState> {
  PoliticSuggestionBloc({@required this.repository})
      : assert(repository != null);

  final PoliticSuggestionRepository repository;
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
        politics = await repository.getSuggestedPolitics();
        yield FetchSuggestedPoliticsSuccess(politics);
      } on Exception {
        yield FetchSuggestedPoliticsFailed();
      }
    }
    if (event is AddPoliticToFollowedPolitics) {
      followedPolitics.add(event.politico);
      yield ChangedPoliticsFollowingStatus(event.politico, isFollowing: true);
    }
    if (event is RemovePoliticFromFollowedPolitics) {
      followedPolitics.remove(event.politico);
      yield ChangedPoliticsFollowingStatus(event.politico, isFollowing: false);
    }
  }

  bool isPoliticBeenFollowed(PoliticoModel politico) {
    return followedPolitics.contains(politico);
  }
}
