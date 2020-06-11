import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/blocs.dart';
import '../../../core/domain/model/models.dart';
import '../../../core/extension/extensions.dart';
import '../../../core/i18n/i18n.dart';
import '../../../widget/label_value.dart';
import '../../../widget/timeline_tile.dart';

class TramitacaoTile extends StatelessWidget {
  TramitacaoTile({
    this.tramitacao,
    this.isFirst,
    this.isLast,
  });

  final TramitacaoPropostaModel tramitacao;
  final bool isFirst;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
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
