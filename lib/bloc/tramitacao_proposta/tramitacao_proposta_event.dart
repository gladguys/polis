part of 'tramitacao_proposta_bloc.dart';

abstract class TramitacaoPropostaEvent extends Equatable {
  const TramitacaoPropostaEvent();
}

class FetchTramitacoesProposicao extends TramitacaoPropostaEvent {
  FetchTramitacoesProposicao(this.proposta);

  final PropostaModel proposta;

  @override
  List<Object> get props => [proposta];
}
