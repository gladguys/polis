import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import './bloc.dart';
import '../../model/politico_model.dart';
import '../../repository/abstract/search_politic_repository.dart';

class SearchPoliticBloc extends Bloc<SearchPoliticEvent, SearchPoliticState> {
  SearchPoliticBloc({@required this.repository}) : assert(repository != null);

  final SearchPoliticRepository repository;
  List<PoliticoModel> allPolitics;
  List<PoliticoModel> politics;
  String statePicked = 'T';
  String partidoPicked = 'T';
  String searchTerm = '';

  @override
  SearchPoliticState get initialState => InitialSearchPoliticState();

  @override
  Stream<SearchPoliticState> mapEventToState(SearchPoliticEvent event) async* {
    if (event is FetchPolitics) {
      yield LoadingFetchPolitics();

      try {
        allPolitics = politics = await repository.getPoliticsByFilter();
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
  }
}
