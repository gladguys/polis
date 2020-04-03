import 'package:flutter/material.dart';

import '../../../i18n/i18n.dart';
import '../../../model/despesa_model.dart';
import '../../../model/models.dart';
import '../../../widget/tile/despesa_tile.dart';

class PoliticActivities extends StatelessWidget {
  PoliticActivities(this.lastActivities) : assert(lastActivities != null);

  final List<dynamic> lastActivities;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          const Text(
            LAST_ACTIVITIES,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          _getActivities(lastActivities),
        ],
      ),
    );
  }

  Widget _getActivities(List<dynamic> lastActivities) {
    if (lastActivities.isNotEmpty) {
      return ListView.builder(
        shrinkWrap: true,
        itemBuilder: (_, i) {
          final activity = lastActivities[i];
          if (activity is DespesaModel) {
            return DespesaTile(activity);
          } else {
            final proposicao = activity as PropostaModel;
            return ListTile(
              dense: true,
              title: Text(proposicao.numero?.toString() ?? ''),
            );
          }
        },
        itemCount: lastActivities.length,
      );
    } else {
      return const Center(
        child: Text(NO_ACTIVITY_FOR_POLITIC),
      );
    }
  }
}
