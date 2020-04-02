import 'package:flutter/material.dart';

import '../../../model/models.dart';
import '../../../widget/tile/despesa_tile.dart';

class Timeline extends StatelessWidget {
  Timeline({this.activities});

  final List<dynamic> activities;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.only(top: 32),
      itemBuilder: (_, i) {
        if (activities[i] is DespesaModel) {
          return DespesaTile(activities[i]);
        } else {
          final proposta = activities[i] as PropostaModel;
          return ListTile(
            title: Text(proposta.ementa),
          );
        }
      },
      separatorBuilder: (_, i) => const Divider(
        color: Colors.grey,
        height: 8,
        indent: 16,
        endIndent: 16,
      ),
      itemCount: activities.length,
    );
  }
}
