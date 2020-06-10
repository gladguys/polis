import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../core/domain/model/models.dart';
import '../../core/repository/abstract/repositories.dart';

part 'comparativo_ranking_despesas_event.dart';
part 'comparativo_ranking_despesas_state.dart';

class ComparativoRankingDespesasBloc extends Bloc<
    ComparativoRankingDespesasEvent, ComparativoRankingDespesasState> {
  ComparativoRankingDespesasBloc({@required this.repository})
      : assert(repository != null);

  final ComparativoRankingDespesasRepository repository;

  @override
  ComparativoRankingDespesasState get initialState =>
      InitialComparativoRankingDespesasState();

  @override
  Stream<ComparativoRankingDespesasState> mapEventToState(
      ComparativoRankingDespesasEvent event) async* {
    if (event is GetRankingResultados) {
      yield* _mapGetRankingResultadosToState();
    }
  }

  Stream<ComparativoRankingDespesasState>
      _mapGetRankingResultadosToState() async* {
    yield LoadingResultadosRanking();

    try {
      final resultadosRanking = await repository.getRankingResults();
      yield GetRankingResultadosSuccess(resultadosRanking);
    } on Exception {
      yield GetRankingResultadosFailed();
    }
  }
}
