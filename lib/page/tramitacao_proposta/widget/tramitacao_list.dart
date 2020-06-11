import 'package:flutter/material.dart';

import '../../../core/domain/model/models.dart';
import '../../../core/i18n/i18n.dart';
import '../../../widget/text_title.dart';
import 'tramitacao_tile.dart';

class TramitacaoList extends StatelessWidget {
  TramitacaoList(this.tramitacoes);

  final List<TramitacaoPropostaModel> tramitacoes;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 8),
        TextTitle(TRAMITATION_OF_PROPOSE),
        const SizedBox(height: 16),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.only(left: 8),
            itemCount: tramitacoes.length,
            itemBuilder: (_, i) => TramitacaoTile(
              tramitacao: tramitacoes[i],
              isFirst: i == 0,
              isLast: i == tramitacoes.length - 1,
            ),
          ),
        ),
      ],
    );
  }
}
