import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../core/domain/model/models.dart';
import '../../core/repository/abstract/repositories.dart';

part 'resultados_ranking_event.dart';
part 'resultados_ranking_state.dart';

class ResultadosRankingBloc
    extends Bloc<ResultadosRankingEvent, ResultadosRankingState> {
  ResultadosRankingBloc({@required this.repository})
      : assert(repository != null);

  final ResultadosRankingRepository repository;

  @override
  ResultadosRankingState get initialState => InitialResultadosRankingState();

  @override
  Stream<ResultadosRankingState> mapEventToState(
      ResultadosRankingEvent event) async* {
    if (event is GetRankingResultados) {
      yield* _mapGetRankingResultadosToState();
    }
  }

  Stream<ResultadosRankingState> _mapGetRankingResultadosToState() async* {
    yield LoadingResultadosRanking();

    try {
      final resultadosRanking = await repository.getRankingResults();
      yield GetRankingResultadosSuccess(resultadosRanking);
    } on Exception {
      yield GetRankingResultadosFailed();
    }
  }
}
