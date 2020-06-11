import 'package:equatable/equatable.dart';
import 'package:sealed_class/sealed_class.dart';

import '../../core/domain/model/models.dart';

part 'tramitacao_proposta_state.g.dart';

@Sealed([
  InitialTramitacaoPropostaState,
  GetTramitacaoPropostaSuccess,
  LoadingTramitacaoProposta,
  GetTramitacaoPropostaFailed,
])
abstract class TramitacaoPropostaState extends Equatable {
  const TramitacaoPropostaState();
}

class InitialTramitacaoPropostaState extends TramitacaoPropostaState {
  @override
  List<Object> get props => [];
}

class GetTramitacaoPropostaSuccess extends TramitacaoPropostaState {
  GetTramitacaoPropostaSuccess(this.tramitacoes);

  final List<TramitacaoPropostaModel> tramitacoes;

  @override
  List<Object> get props => [tramitacoes];
}

class LoadingTramitacaoProposta extends TramitacaoPropostaState {
  @override
  List<Object> get props => [];
}

class GetTramitacaoPropostaFailed extends TramitacaoPropostaState {
  @override
  List<Object> get props => [];
}
