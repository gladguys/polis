import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../core/domain/model/models.dart';
import '../../core/repository/abstract/repositories.dart';
import '../../core/service/services.dart';

part 'tramitacao_proposta_state.dart';

class TramitacaoPropostaCubit extends Cubit<TramitacaoPropostaState> {
  TramitacaoPropostaCubit({
    @required this.repository,
    @required this.orgaoService,
  })  : assert(repository != null),
        assert(orgaoService != null),
        super(InitialTramitacaoPropostaState());

  final TramitacaoPropostaRepository repository;
  final OrgaoService orgaoService;

  PropostaModel proposta;
  Map<String, OrgaoModel> orgaosMap = {};

  void fetchTramitacoesProposicao(PropostaModel proposta) async {
    emit(LoadingTramitacaoProposta());

    orgaosMap = await orgaoService.getAllOrgaosMap();
    try {
      final tramitacoes = await repository.getTramitacoesProposta(proposta.id);
      emit(GetTramitacaoPropostaSuccess(tramitacoes));
    } on Exception {
      emit(GetTramitacaoPropostaFailed());
    }
  }
}
