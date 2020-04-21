import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import './bloc.dart';
import '../../model/models.dart';
import '../../repository/abstract/tramitacao_proposta_repository.dart';
import 'bloc.dart';

class TramitacaoPropostaBloc
    extends Bloc<TramitacaoPropostaEvent, TramitacaoPropostaState> {
  TramitacaoPropostaBloc({@required this.repository})
      : assert(repository != null);

  final TramitacaoPropostaRepository repository;

  PropostaModel proposta;

  @override
  TramitacaoPropostaState get initialState => InitialTramitacaoPropostaState();

  @override
  Stream<TramitacaoPropostaState> mapEventToState(
      TramitacaoPropostaEvent event) async* {
    if (event is FetchTramitacoesProposicao) {
      yield LoadingTramitacaoProposta();
      try {
        proposta = event.proposta;
        final tramitacoes =
            await repository.getTramitacoesProposta(proposta.id);
        yield GetTramitacaoPropostaSuccess(tramitacoes);
      } on Exception {
        yield GetTramitacaoPropostaFailed();
      }
    }
  }
}
