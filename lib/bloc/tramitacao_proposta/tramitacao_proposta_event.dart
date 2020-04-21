import 'package:equatable/equatable.dart';

import '../../model/models.dart';

abstract class TramitacaoPropostaEvent extends Equatable {
  const TramitacaoPropostaEvent();
}

class FetchTramitacoesProposicao extends TramitacaoPropostaEvent {
  FetchTramitacoesProposicao(this.proposta);

  final PropostaModel proposta;

  @override
  List<Object> get props => [proposta];
}
