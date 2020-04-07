import 'package:flutter/material.dart';

import '../../../model/models.dart';
import '../../../widget/tile/despesa_tile_connected.dart';
import '../../../widget/tile/proposta_tile_connected.dart';

class Timeline extends StatelessWidget {
  Timeline({this.activities});

  final List<dynamic> activities;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.only(top: 8),
      itemBuilder: (_, i) {
        if (activities[i] is DespesaModel) {
          return DespesaTileConnected(activities[i] as DespesaModel);
        } else {
          return PropostaTileConnected(activities[i] as PropostaModel);
        }
      },
      separatorBuilder: (_, i) => const Divider(
        height: 1,
        indent: 8,
        endIndent: 8,
      ),
      itemCount: activities.length,
    );
  }
}
