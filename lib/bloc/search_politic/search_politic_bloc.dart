import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import './bloc.dart';
import '../../model/politico_model.dart';
import '../../repository/abstract/follow_repository.dart';
import '../../repository/abstract/search_politic_repository.dart';
import '../../repository/abstract/user_following_politics_repository.dart';

class SearchPoliticBloc extends Bloc<SearchPoliticEvent, SearchPoliticState> {
  SearchPoliticBloc({
    @required this.searchPoliticRepository,
    @required this.userFollowingPoliticsRepository,
    @required this.followRepository,
  })  : assert(searchPoliticRepository != null),
        assert(userFollowingPoliticsRepository != null),
        assert(followRepository != null);

  final SearchPoliticRepository searchPoliticRepository;
  final UserFollowingPoliticsRepository userFollowingPoliticsRepository;
  final FollowRepository followRepository;

  List<PoliticoModel> allPolitics;
  List<PoliticoModel> followedPolitics;
  List<PoliticoModel> politics;
  String statePicked = 'T';
  String partidoPicked = 'T';
  String searchTerm = '';
  Map<String, bool> isPoliticFollowed = {};

  @override
  SearchPoliticState get initialState => InitialSearchPoliticState();

  @override
  Stream<SearchPoliticState> mapEventToState(SearchPoliticEvent event) async* {
    if (event is FetchPolitics) {
      yield LoadingFetchPolitics();

      try {
        allPolitics = politics = await searchPoliticRepository.getAllPolitics();
        followedPolitics = await userFollowingPoliticsRepository
            .getFollowingPolitics(event.userId);
        _initPoliticBeingFollowed();

        yield FetchSearchPoliticsSuccess(politics);
      } on Exception {
        yield FetchSearchPoliticsFailed();
      }
    }
    if (event is ChangeSearchPoliticFilter) {
      statePicked = event.estado ?? statePicked;
      partidoPicked = event.partido ?? partidoPicked;
      searchTerm = event.term ?? searchTerm;

      final politicsFilteredByTerm = searchTerm != ''
          ? politics
              .where((politic) => politic.nomeEleitoral
                  .toLowerCase()
                  .contains(searchTerm.toLowerCase()))
              .toList()
          : allPolitics;

      final politicsFiltereByEstado = statePicked != 'T'
          ? politicsFilteredByTerm
              .where((politic) => politic.siglaUf == statePicked)
              .toList()
          : politicsFilteredByTerm;

      final politicsFilteredByPartido = partidoPicked != 'T'
          ? politicsFiltereByEstado
              .where((politic) => politic.siglaPartido == partidoPicked)
              .toList()
          : politicsFiltereByEstado;

      politics = [...politicsFilteredByPartido];
      yield SearchPoliticFilterChanged(politics);
    }
    if (event is FollowUnfollowSearchPolitic) {
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

        yield FollowedSearchPoliticsUpdated(
          followedPolitics: [...politics],
          politicoUpdated: politico,
          isFollowing: isBeingFollowed,
        );
      } on Exception {
        yield FollowUnfollowPoliticsFailed();
      }
    }
  }

  bool isPoliticBeingFollowed(PoliticoModel politico) =>
      isPoliticFollowed[politico.id] ?? false;

  void _initPoliticBeingFollowed() {
    for (var politic in followedPolitics) {
      isPoliticFollowed[politic.id] = true;
    }
  }
}
