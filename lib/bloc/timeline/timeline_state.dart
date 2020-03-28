import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../model/despesa_model.dart';
import '../../model/proposta_model.dart';

abstract class TimelineState extends Equatable {
  const TimelineState();
}

class InitialTimelineState extends TimelineState {
  @override
  List<Object> get props => [];
}

class TimelineUpdated extends TimelineState {
  TimelineUpdated({@required this.despesas, @required this.propostas})
      : assert(despesas != null),
        assert(propostas != null);

  final List<DespesaModel> despesas;
  final List<PropostaModel> propostas;

  @override
  List<Object> get props => [despesas, propostas];
}

class FetchTimelineFailed extends TimelineState {
  @override
  List<Object> get props => [];
}
