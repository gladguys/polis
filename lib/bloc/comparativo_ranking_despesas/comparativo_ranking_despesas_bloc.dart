import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../core/repository/abstract/repositories.dart';
import 'comparativo_ranking_despesas_event.dart';
import 'comparativo_ranking_despesas_state.dart';

class ComparativoRankingDespesasBloc extends Bloc<
    ComparativoRankingDespesasEvent, ComparativoRankingDespesasState> {
  ComparativoRankingDespesasBloc({@required this.repository})
      : assert(repository != null);

  final ComparativoRankingDespesasRepository repository;

  @override
  ComparativoRankingDespesasState get initialState =>
      ComparativoRankingDespesasState.initial();

  @override
  Stream<ComparativoRankingDespesasState> mapEventToState(
      ComparativoRankingDespesasEvent event) async* {
    yield* event.map(
      getRankingResultados: _mapGetRankingResultadosToState,
    );
  }

  Stream<ComparativoRankingDespesasState> _mapGetRankingResultadosToState(
      ComparativoRankingDespesasEvent event) async* {
    yield ComparativoRankingDespesasState.loadingResultadosRanking();

    try {
      final resultadosRanking = await repository.getRankingResults();
      yield ComparativoRankingDespesasState.getRankingResultadosSuccess(
          resultadosRanking);
    } on Exception {
      yield ComparativoRankingDespesasState.getRankingResultadosFailed();
    }
  }
}
