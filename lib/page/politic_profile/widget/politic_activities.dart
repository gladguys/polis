import 'package:flutter/material.dart';

import '../../../i18n/i18n.dart';
import '../../../model/despesa_model.dart';
import '../../../model/models.dart';
import '../../../widget/not_found.dart';
import '../../../widget/tile/despesa_tile_connected.dart';
import '../../../widget/tile/proposta_tile_connected.dart';

class PoliticActivities extends StatelessWidget {
  PoliticActivities(this.lastActivities) : assert(lastActivities != null);

  final List<dynamic> lastActivities;

  @override
  Widget build(BuildContext context) {
    if (lastActivities.isNotEmpty) {
      return Container(
        height: (MediaQuery.of(context).size.height * 0.97) - 50 - 72,
        child: ListView.separated(
          shrinkWrap: true,
          padding: const EdgeInsets.only(bottom: 24),
          separatorBuilder: (_, i) => const Divider(indent: 8, endIndent: 8),
          itemBuilder: (_, i) {
            final activity = lastActivities[i];
            if (activity is DespesaModel) {
              return DespesaTileConnected(activity, clickableImage: false);
            } else {
              final proposicao = activity as PropostaModel;
              return PropostaTileConnected(proposicao, clickableImage: false);
            }
          },
          itemCount: lastActivities.length,
        ),
      );
    } else {
      return NotFound(msg: NO_ACTIVITY_FOR_POLITIC);
    }
  }
}
