import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/cubits.dart';
import '../../core/domain/model/models.dart';
import '../../core/repository/concrete/repositories.dart';
import '../../core/service/locator.dart';
import '../../core/service/services.dart';
import '../page_connected.dart';
import '../pages.dart';

class TramitacaoPropostaPageConnected extends StatelessWidget {
  TramitacaoPropostaPageConnected(this.proposta);

  final PropostaModel proposta;

  @override
  Widget build(BuildContext context) {
    return PageConnected<TramitacaoPropostaCubit>(
      bloc: TramitacaoPropostaCubit(
        repository: context.repository<FirebaseTramitacaoPropostaRepository>(),
        orgaoService: OrgaoService(
          firebaseRepository: context.repository<FirebaseOrgaoRepository>(),
          hiveRepository: context.repository<HiveOrgaoRepository>(),
          syncLogRepository: context.repository<FirebaseSyncLogRepository>(),
          sharedPreferencesService: G<SharedPreferencesService>(),
        ),
      )..fetchTramitacoesProposicao(proposta),
      page: TramitacaoPropostaPage(),
    );
  }
}
