import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/blocs.dart';
import '../../core/service/locator.dart';
import '../../core/service/services.dart';
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
        orgaoService: OrgaoService(
          firebaseRepository: context.repository<FirebaseOrgaoRepository>(),
          hiveRepository: context.repository<HiveOrgaoRepository>(),
          syncLogRepository: context.repository<FirebaseSyncLogRepository>(),
          sharedPreferencesService: G<SharedPreferencesService>(),
        ),
      )..add(FetchTramitacoesProposicao(proposta)),
      page: TramitacaoPropostaPage(),
    );
  }
}
