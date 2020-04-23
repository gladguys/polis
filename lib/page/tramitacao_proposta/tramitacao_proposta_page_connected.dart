import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/blocs.dart';
import '../../model/models.dart';
import '../../repository/concrete/repositories.dart';
import '../page_connected.dart';
import '../pages.dart';

class TramitacaoPropostaPageConnected extends StatelessWidget {
  TramitacaoPropostaPageConnected(this.proposta);

  final PropostaModel proposta;

  @override
  Widget build(BuildContext context) {
    return PageConnected<TramitacaoPropostaBloc>(
      bloc: TramitacaoPropostaBloc(
        repository: context.repository<FirebaseTramitacaoPropostaRepository>(),
      )..add(FetchTramitacoesProposicao(proposta)),
      page: TramitacaoPropostaPage(),
    );
  }
}
