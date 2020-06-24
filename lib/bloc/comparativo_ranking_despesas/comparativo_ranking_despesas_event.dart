import 'package:freezed_annotation/freezed_annotation.dart';

part 'comparativo_ranking_despesas_event.freezed.dart';

@freezed
abstract class ComparativoRankingDespesasEvent
    with _$ComparativoRankingDespesasEvent {
  factory ComparativoRankingDespesasEvent.getRankingResultados() =
      GetRankingResultados;
}
