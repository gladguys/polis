import 'package:equatable/equatable.dart';

import '../../model/despesa_model.dart';
import '../../model/proposta_model.dart';

abstract class TimelineEvent extends Equatable {
  const TimelineEvent();
}

class FetchUserTimeline extends TimelineEvent {
  FetchUserTimeline(this.userId);

  final String userId;

  @override
  List<Object> get props => [userId];
}

class UpdateTimeline extends TimelineEvent {
  UpdateTimeline({this.despesas, this.propostas});

  final List<DespesaModel> despesas;
  final List<PropostaModel> propostas;

  @override
  List<Object> get props => [despesas, propostas];
}
