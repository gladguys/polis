part of 'comparativo_ranking_despesas_bloc.dart';

abstract class ComparativoRankingDespesasState extends Equatable {
  const ComparativoRankingDespesasState();
}

class InitialComparativoRankingDespesasState
    extends ComparativoRankingDespesasState {
  @override
  List<Object> get props => [];
}

class GetRankingResultadosSuccess extends ComparativoRankingDespesasState {
  GetRankingResultadosSuccess(this.resultadosRanking);

  final ResultadosRankingModel resultadosRanking;

  @override
  List<Object> get props => [resultadosRanking];
}

class LoadingResultadosRanking extends ComparativoRankingDespesasState {
  @override
  List<Object> get props => [];
}

class GetRankingResultadosFailed extends ComparativoRankingDespesasState {
  @override
  List<Object> get props => [];
}
