part of 'comparativo_ranking_despesas_bloc.dart';

abstract class ComparativoRankingDespesasEvent extends Equatable {
  const ComparativoRankingDespesasEvent();
}

class GetRankingResultados extends ComparativoRankingDespesasEvent {
  @override
  List<Object> get props => [];
}
