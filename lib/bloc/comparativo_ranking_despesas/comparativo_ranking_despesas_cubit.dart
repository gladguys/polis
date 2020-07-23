import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../core/domain/model/models.dart';
import '../../core/repository/abstract/repositories.dart';

part 'comparativo_ranking_despesas_state.dart';

class ComparativoRankingDespesasCubit
    extends Cubit<ComparativoRankingDespesasState> {
  ComparativoRankingDespesasCubit({@required this.repository})
      : assert(repository != null),
        super(InitialComparativoRankingDespesasState());

  final ComparativoRankingDespesasRepository repository;

  void getRankingResultados() async {
    emit(LoadingResultadosRanking());

    try {
      final resultadosRanking = await repository.getRankingResults();
      emit(GetRankingResultadosSuccess(resultadosRanking));
    } on Exception {
      emit(GetRankingResultadosFailed());
    }
  }
}
