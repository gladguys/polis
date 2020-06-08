part of 'resultados_ranking_bloc.dart';

abstract class ResultadosRankingState extends Equatable {
  const ResultadosRankingState();
}

class InitialResultadosRankingState extends ResultadosRankingState {
  @override
  List<Object> get props => [];
}

class GetRankingResultadosSuccess extends ResultadosRankingState {
  GetRankingResultadosSuccess(this.resultadosRanking);

  final ResultadosRankingModel resultadosRanking;

  @override
  List<Object> get props => [resultadosRanking];
}

class LoadingResultadosRanking extends ResultadosRankingState {
  @override
  List<Object> get props => [];
}

class GetRankingResultadosFailed extends ResultadosRankingState {
  @override
  List<Object> get props => [];
}
