import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:diacritic/diacritic.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../core/domain/model/models.dart';
import '../../core/repository/abstract/repositories.dart';
import '../../core/service/services.dart';
import '../cubits.dart';

part 'search_politic_state.dart';

class SearchPoliticCubit extends Cubit<SearchPoliticState> {
  SearchPoliticCubit({
    @required this.politicoService,
    @required this.userFollowingPoliticsRepository,
    @required this.followRepository,
    @required this.partidoService,
    @required this.politicProfileCubit,
  }) : super(InitialSearchPoliticState()) {
    assert(politicoService != null);
    assert(userFollowingPoliticsRepository != null);
    assert(followRepository != null);
    assert(partidoService != null);
    assert(politicProfileCubit != null);

    politicProfileSubscription = politicProfileCubit.listen((state) {
      if (state is UserFollowingPoliticChanged) {
        changeFollowPoliticStatus(
          politico: state.politico,
          isUserFollowingPolitic: state.isUserFollowingPolitic,
        );
      }
    });
  }

  final UserFollowingPoliticsRepository userFollowingPoliticsRepository;
  final FollowRepository followRepository;
  final PoliticoService politicoService;
  final PartidoService partidoService;
  final PoliticProfileCubit politicProfileCubit;

  StreamSubscription politicProfileSubscription;

  List<PartidoModel> allPartidos;
  List<PoliticoModel> allPolitics;
  List<PoliticoModel> followedPolitics;
  List<PoliticoModel> politics;
  String statePicked = 'T';
  String partidoPicked = 'T';
  String searchTerm = '';
  Map<String, bool> isPoliticFollowed = {};

  bool isPoliticBeingFollowed(PoliticoModel politico) =>
      isPoliticFollowed[politico.id] ?? false;

  void _initPoliticBeingFollowed() {
    for (var politic in followedPolitics) {
      isPoliticFollowed[politic.id] = true;
    }
  }

  void fetchPolitics(String userId) async {
    emit(LoadingFetchPolitics());

    try {
      allPartidos = await partidoService.getAllPartidos();
      allPolitics = politics = await politicoService.getAllPoliticos();
      followedPolitics =
          await userFollowingPoliticsRepository.getFollowingPolitics(userId);
      _initPoliticBeingFollowed();

      emit(FetchSearchPoliticsSuccess(politics));
    } on Exception {
      emit(FetchSearchPoliticsFailed());
    }
  }

  void changeSearchPoliticFilter(
      {String estado, String partido, String term}) async {
    statePicked = estado ?? statePicked;
    partidoPicked = partido ?? partidoPicked;
    searchTerm = term ?? searchTerm;

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

    emit(
      SearchPoliticFilterChanged(
        politics: politics,
        statePicked: statePicked,
        partidoPicked: partidoPicked,
        searchTerm: searchTerm,
      ),
    );
  }

  void followUnfollowSearchPolitic(
      {@required UserModel user, @required PoliticoModel politico}) async {
    assert(user != null);
    assert(politico != null);
    try {
      final isBeingFollowed = isPoliticBeingFollowed(politico);

      if (isBeingFollowed) {
        await followRepository.unfollowPolitic(user: user, politico: politico);
      } else {
        await followRepository.followPolitic(user: user, politico: politico);
      }
      isPoliticFollowed[politico.id] = !isBeingFollowed;

      emit(
        FollowedSearchPoliticsUpdated(
          followedPolitics: [...politics],
          politicoUpdated: politico,
          isFollowing: isBeingFollowed,
        ),
      );
    } on Exception {
      emit(FollowUnfollowPoliticsFailed());
    }
  }

  void changeFollowPoliticStatus({
    @required PoliticoModel politico,
    @required bool isUserFollowingPolitic,
  }) async {
    isPoliticFollowed[politico.id] = isUserFollowingPolitic;

    emit(
      FollowedSearchPoliticsUpdated(
        followedPolitics: [...politics],
        politicoUpdated: politico,
        isFollowing: isUserFollowingPolitic,
      ),
    );
  }

  @override
  Future<void> close() {
    politicProfileSubscription?.cancel();
    politicProfileCubit.close();
    return super.close();
  }
}
