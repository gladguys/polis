import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:diacritic/diacritic.dart';
import 'package:flutter/material.dart';

import './bloc.dart';
import '../../core/service/services.dart';
import '../../model/models.dart';
import '../../repository/abstract/follow_repository.dart';
import '../../repository/abstract/search_politic_repository.dart';
import '../../repository/abstract/user_following_politics_repository.dart';
import '../blocs.dart';

class SearchPoliticBloc extends Bloc<SearchPoliticEvent, SearchPoliticState> {
  SearchPoliticBloc({
    @required this.searchPoliticRepository,
    @required this.userFollowingPoliticsRepository,
    @required this.followRepository,
    @required this.partidoService,
    @required this.politicProfileBloc,
  }) {
    assert(searchPoliticRepository != null);
    assert(userFollowingPoliticsRepository != null);
    assert(followRepository != null);
    assert(partidoService != null);
    assert(politicProfileBloc != null);

    politicProfileSubscription = politicProfileBloc.listen((state) {
      if (state is UserFollowingPoliticChanged) {
        add(
          ChangeFollowPoliticStatus(
            politico: state.politico,
            isUserFollowingPolitic: state.isUserFollowingPolitic,
          ),
        );
      }
    });
  }

  final SearchPoliticRepository searchPoliticRepository;
  final UserFollowingPoliticsRepository userFollowingPoliticsRepository;
  final FollowRepository followRepository;
  final PartidoService partidoService;
  final PoliticProfileBloc politicProfileBloc;

  StreamSubscription politicProfileSubscription;

  List<PartidoModel> allPartidos;
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
        allPartidos = await partidoService.getAllPartidos();
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

      final politicsFiltereByEstado = statePicked != 'T'
          ? allPolitics
              .where((politic) => politic.siglaUf == statePicked)
              .toList()
          : allPolitics;

      final politicsFilteredByPartido = partidoPicked != 'T'
          ? politicsFiltereByEstado
              .where((politic) => politic.siglaPartido == partidoPicked)
              .toList()
          : politicsFiltereByEstado;

      final politicsFilteredByTerm = searchTerm != ''
          ? politicsFilteredByPartido
              .where((politic) =>
                  removeDiacritics(politic.nomeEleitoral.toLowerCase())
                      .contains(removeDiacritics(searchTerm.toLowerCase())))
              .toList()
          : politicsFilteredByPartido;

      politics = [...politicsFilteredByTerm];
      yield SearchPoliticFilterChanged(
        politics: politics,
        statePicked: statePicked,
        partidoPicked: partidoPicked,
        searchTerm: searchTerm,
      );
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
    if (event is ChangeFollowPoliticStatus) {
      final politico = event.politico;
      final isUserFollowingPolitic = event.isUserFollowingPolitic;

      isPoliticFollowed[politico.id] = isUserFollowingPolitic;

      yield FollowedSearchPoliticsUpdated(
        followedPolitics: [...politics],
        politicoUpdated: event.politico,
        isFollowing: event.isUserFollowingPolitic,
      );
    }
  }

  bool isPoliticBeingFollowed(PoliticoModel politico) =>
      isPoliticFollowed[politico.id] ?? false;

  void _initPoliticBeingFollowed() {
    for (var politic in followedPolitics) {
      isPoliticFollowed[politic.id] = true;
    }
  }

  @override
  Future<void> close() {
    politicProfileSubscription?.cancel();
    politicProfileBloc.close();
    return super.close();
  }
}
