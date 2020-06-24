import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core/domain/model/models.dart';

part 'comparativo_ranking_despesas_state.freezed.dart';

@freezed
abstract class ComparativoRankingDespesasState
    with _$ComparativoRankingDespesasState {
  factory ComparativoRankingDespesasState.initial() =
      InitialComparativoRankingDespesasState;
  factory ComparativoRankingDespesasState.getRankingResultadosSuccess(
      ResultadosRankingModel resultadosRanking) = GetRankingResultadosSuccess;
  factory ComparativoRankingDespesasState.loadingResultadosRanking() =
      LoadingResultadosRanking;
  factory ComparativoRankingDespesasState.getRankingResultadosFailed() =
      GetRankingResultadosFailed;
}
