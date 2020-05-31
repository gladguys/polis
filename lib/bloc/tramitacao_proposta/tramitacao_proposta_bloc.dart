import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../core/domain/model/models.dart';
import '../../core/repository/abstract/repositories.dart';
import '../../core/service/services.dart';

part 'tramitacao_proposta_event.dart';
part 'tramitacao_proposta_state.dart';

class TramitacaoPropostaBloc
    extends Bloc<TramitacaoPropostaEvent, TramitacaoPropostaState> {
  TramitacaoPropostaBloc(
      {@required this.repository, @required this.orgaoService})
      : assert(repository != null),
        assert(orgaoService != null);

  final TramitacaoPropostaRepository repository;
  final OrgaoService orgaoService;

  PropostaModel proposta;
  Map<String, OrgaoModel> orgaosMap = {};

  @override
  TramitacaoPropostaState get initialState => InitialTramitacaoPropostaState();

  @override
  Stream<TramitacaoPropostaState> mapEventToState(
      TramitacaoPropostaEvent event) async* {
    if (event is FetchTramitacoesProposicao) {
      yield* _mapFetchTramitacoesProposicaoToState(event);
    }
  }

  Stream<TramitacaoPropostaState> _mapFetchTramitacoesProposicaoToState(
      FetchTramitacoesProposicao event) async* {
    yield LoadingTramitacaoProposta();

    orgaosMap = await orgaoService.getAllOrgaosMap();
    try {
      proposta = event.proposta;
      final tramitacoes = await repository.getTramitacoesProposta(proposta.id);
      yield GetTramitacaoPropostaSuccess(tramitacoes);
    } on Exception {
      yield GetTramitacaoPropostaFailed();
    }
  }
}
