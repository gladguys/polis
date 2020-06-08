part of 'resultados_ranking_bloc.dart';

abstract class ResultadosRankingEvent extends Equatable {
  const ResultadosRankingEvent();
}

class GetRankingResultados extends ResultadosRankingEvent {
  @override
  List<Object> get props => [];
}
