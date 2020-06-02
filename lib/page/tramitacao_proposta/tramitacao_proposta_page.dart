import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/blocs.dart';
import '../../core/domain/model/tramitacao_proposta_model.dart';
import '../../core/extension/extensions.dart';
import '../../core/i18n/label.dart';
import '../../core/routing/route_names.dart';
import '../../widget/default_bottombar.dart';
import '../../widget/label_value.dart';
import '../../widget/loading.dart';
import '../../widget/text_title.dart';
import '../../widget/timeline_tile.dart';
import '../theme/main_theme.dart';

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
              isFirst: i == 0,
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
    bool isFirst,
    bool isLast,
  }) {
    final orgao = context
        .bloc<TramitacaoPropostaBloc>()
        .orgaosMap[tramitacao.siglaOrgao]
        ?.nome;

    return TimelineTile(
      isFirst: isFirst,
      isLast: isLast,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Wrap(
            spacing: 8,
            runSpacing: 8,
            crossAxisAlignment: WrapCrossAlignment.end,
            children: <Widget>[
              Text(
                tramitacao.dataHora.formatDate(),
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
              if (isFirst)
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 2,
                    horizontal: 8,
                  ),
                  decoration: BoxDecoration(
                    color: theme.primaryColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    LAST_UPDATE.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
              else if (isLast)
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 2,
                    horizontal: 8,
                  ),
                  decoration: BoxDecoration(
                    color: theme.primaryColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    START.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
            ],
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
                label: DISPATCH,
                value: tramitacao.despacho,
                emptyValue: NOT_INFORMED,
              ),
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
                value:
                    tramitacao.regime == '.' ? NOT_INFORMED : tramitacao.regime,
                emptyValue: NOT_INFORMED,
              ),
              orgao != null
                  ? Tooltip(
                      child: LabelValue(
                        label: ORGAN,
                        value: tramitacao.siglaOrgao,
                        emptyValue: NOT_INFORMED,
                        isDotted: true,
                      ),
                      message: orgao,
                    )
                  : LabelValue(
                      label: ORGAN,
                      value: tramitacao.siglaOrgao,
                      emptyValue: NOT_INFORMED,
                      isDotted: false,
                    ),
            ],
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
