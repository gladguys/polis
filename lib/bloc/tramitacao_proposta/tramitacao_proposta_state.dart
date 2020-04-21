import 'package:equatable/equatable.dart';

import '../../model/models.dart';

abstract class TramitacaoPropostaState extends Equatable {
  const TramitacaoPropostaState();
}

class InitialTramitacaoPropostaState extends TramitacaoPropostaState {
  @override
  List<Object> get props => [];
}

class LoadingTramitacaoProposta extends TramitacaoPropostaState {
  @override
  List<Object> get props => [];
}

class GetTramitacaoPropostaSuccess extends TramitacaoPropostaState {
  GetTramitacaoPropostaSuccess(this.tramitacoes);

  final List<TramitacaoPropostaModel> tramitacoes;

  @override
  List<Object> get props => [tramitacoes];
}

class GetTramitacaoPropostaFailed extends TramitacaoPropostaState {
  @override
  List<Object> get props => [];
}
