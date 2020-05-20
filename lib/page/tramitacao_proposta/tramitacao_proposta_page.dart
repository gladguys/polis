import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
        .nome;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        if (isFirst)
          Padding(
            padding: const EdgeInsets.fromLTRB(6, 6, 0, 12),
            child: Row(
              children: <Widget>[
                const Icon(
                  FontAwesomeIcons.alignLeft,
                  color: Colors.amber,
                  size: 18,
                ),
                const SizedBox(width: 8),
                const Text(
                  START,
                  style: TextStyle(
                    color: Colors.amber,
                    fontSize: 18,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        TimelineTile(
          isFirst: isFirst,
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
                    value: tramitacao.regime == '.'
                        ? NOT_INFORMED
                        : tramitacao.regime,
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
        ),
        if (isLast)
          Padding(
            padding: const EdgeInsets.fromLTRB(6, 0, 0, 6),
            child: Row(
              children: <Widget>[
                const Icon(
                  FontAwesomeIcons.alignRight,
                  color: Colors.amber,
                  size: 18,
                ),
                const SizedBox(width: 8),
                const Text(
                  END,
                  style: TextStyle(
                    color: Colors.amber,
                    fontSize: 18,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
