import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:diacritic/diacritic.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../core/domain/model/models.dart';
import '../../core/repository/abstract/repositories.dart';
import '../../core/service/services.dart';
import '../blocs.dart';

part 'search_politic_event.dart';
part 'search_politic_state.dart';

class SearchPoliticBloc extends Bloc<SearchPoliticEvent, SearchPoliticState> {
  SearchPoliticBloc({
    @required this.politicoService,
    @required this.userFollowingPoliticsRepository,
    @required this.followRepository,
    @required this.partidoService,
    @required this.politicProfileBloc,
  }) : super(InitialSearchPoliticState()) {
    assert(politicoService != null);
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

  final UserFollowingPoliticsRepository userFollowingPoliticsRepository;
  final FollowRepository followRepository;
  final PoliticoService politicoService;
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
  Stream<SearchPoliticState> mapEventToState(SearchPoliticEvent event) async* {
    if (event is FetchPolitics) {
      yield* _mapFetchPoliticsToState(event);
    }
    if (event is ChangeSearchPoliticFilter) {
      yield* _mapChangeSearchPoliticFilterToState(event);
    }
    if (event is FollowUnfollowSearchPolitic) {
      yield* _mapFollowUnfollowSearchPoliticToState(event);
    }
    if (event is ChangeFollowPoliticStatus) {
      yield* _mapChangeFollowPoliticStatusToState(event);
    }
  }

  bool isPoliticBeingFollowed(PoliticoModel politico) =>
      isPoliticFollowed[politico.id] ?? false;

  void _initPoliticBeingFollowed() {
    for (var politic in followedPolitics) {
      isPoliticFollowed[politic.id] = true;
    }
  }

  Stream<SearchPoliticState> _mapFetchPoliticsToState(
      FetchPolitics event) async* {
    yield LoadingFetchPolitics();

    try {
      allPartidos = await partidoService.getAllPartidos();
      allPolitics = politics = await politicoService.getAllPoliticos();
      followedPolitics = await userFollowingPoliticsRepository
          .getFollowingPolitics(event.userId);
      _initPoliticBeingFollowed();

      yield FetchSearchPoliticsSuccess(politics);
    } on Exception {
      yield FetchSearchPoliticsFailed();
    }
  }

  Stream<SearchPoliticState> _mapChangeSearchPoliticFilterToState(
      ChangeSearchPoliticFilter event) async* {
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

  Stream<SearchPoliticState> _mapFollowUnfollowSearchPoliticToState(
      FollowUnfollowSearchPolitic event) async* {
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

      yield FollowedSearchPoliticsUpdated(
        followedPolitics: [...politics],
        politicoUpdated: politico,
        isFollowing: isBeingFollowed,
      );
    } on Exception {
      yield FollowUnfollowPoliticsFailed();
    }
  }

  Stream<SearchPoliticState> _mapChangeFollowPoliticStatusToState(
      ChangeFollowPoliticStatus event) async* {
    final politico = event.politico;
    final isUserFollowingPolitic = event.isUserFollowingPolitic;

    isPoliticFollowed[politico.id] = isUserFollowingPolitic;

    yield FollowedSearchPoliticsUpdated(
      followedPolitics: [...politics],
      politicoUpdated: event.politico,
      isFollowing: event.isUserFollowingPolitic,
    );
  }

  @override
  Future<void> close() {
    politicProfileSubscription?.cancel();
    politicProfileBloc.close();
    return super.close();
  }
}
