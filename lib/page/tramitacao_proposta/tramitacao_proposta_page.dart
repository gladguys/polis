import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/blocs.dart';
import '../../core/routing/route_names.dart';
import '../../extension/formatters.dart';
import '../../i18n/label.dart';
import '../../widget/default_bottombar.dart';
import '../../widget/loading.dart';
import '../../widget/text_title.dart';
import '../../widget/timeline_tile.dart';

class TramitacaoPropostaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: DefaultBottombar(TIMELINE_PAGE, withBack: true),
      body: SafeArea(
        child: BlocBuilder<TramitacaoPropostaBloc, TramitacaoPropostaState>(
          builder: (_, state) {
            if (state is GetTramitacaoPropostaSuccess) {
              final tramitacoes = state.tramitacoes;

              return Column(
                children: <Widget>[
                  const SizedBox(height: 8),
                  TextTitle(TRAMITATION_OF_PROPOSE),
                  const SizedBox(height: 16),
                  Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.only(left: 8),
                      itemBuilder: (_, i) => TimelineTile(
                        isLast: i == tramitacoes.length - 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              tramitacoes[i].dataHora.formatDate(),
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              tramitacoes[i].descricaoTramitacao,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              '''${tramitacoes[i].siglaOrgao}: ${context.bloc<TramitacaoPropostaBloc>().orgaosMap[tramitacoes[i].siglaOrgao].nome}''',
                            ),
                            const SizedBox(height: 8),
                          ],
                        ),
                      ),
                      itemCount: tramitacoes.length,
                    ),
                  ),
                ],
              );
            }
            return Loading();
          },
        ),
      ),
    );
  }
}
