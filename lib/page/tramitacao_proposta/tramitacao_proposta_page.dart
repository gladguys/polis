import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/blocs.dart';
import '../../core/routing/route_names.dart';
import '../../extension/extensions.dart';
import '../../i18n/label.dart';
import '../../model/tramitacao_proposta_model.dart';
import '../../widget/default_bottombar.dart';
import '../../widget/label_value.dart';
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
              return _buildList(state.tramitacoes, context);
            }
            return Loading();
          },
        ),
      ),
    );
  }

  Widget _buildList(
    List<TramitacaoPropostaModel> tramitacoes,
    BuildContext context,
  ) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 8),
        TextTitle(TRAMITATION_OF_PROPOSE),
        const SizedBox(height: 16),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.only(left: 8),
            itemCount: tramitacoes.length,
            itemBuilder: (_, i) => _buildListTile(
              context: _,
              tramitacao: tramitacoes[i],
              isLast: i == tramitacoes.length - 1,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildListTile({
    BuildContext context,
    TramitacaoPropostaModel tramitacao,
    bool isLast,
  }) {
    final orgao = context
        .bloc<TramitacaoPropostaBloc>()
        .orgaosMap[tramitacao.siglaOrgao]
        .nome;

    return TimelineTile(
      isLast: isLast,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            tramitacao.dataHora.formatDate(),
            style: const TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            tramitacao.descricaoTramitacao,
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 16,
            runSpacing: 8,
            children: <Widget>[
              LabelValue(
                label: AMBIT,
                value: tramitacao.ambito,
                emptyValue: NOT_INFORMED,
              ),
              LabelValue(
                label: SITUATION,
                value: tramitacao.descricaoSituacao,
                emptyValue: NOT_INFORMED,
              ),
              LabelValue(
                label: REGIME,
                value: tramitacao.regime,
                emptyValue: NOT_INFORMED,
              ),
              Tooltip(
                child: LabelValue(
                  label: ORGAN,
                  value: tramitacao.siglaOrgao,
                  emptyValue: NOT_INFORMED,
                  isDotted: true,
                ),
                message: orgao,
              ),
            ],
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
