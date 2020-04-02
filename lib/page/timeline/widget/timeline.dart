import 'package:flutter/material.dart';

import '../../../model/models.dart';
import '../../../widget/tile/despesa_tile.dart';

class Timeline extends StatelessWidget {
  Timeline({this.despesas, this.propostas});

  final List<DespesaModel> despesas;
  final List<PropostaModel> propostas;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.only(top: 32),
      itemBuilder: (_, i) => DespesaTile(despesas[i]),
      separatorBuilder: (_, i) => const Divider(
        color: Colors.grey,
        height: 8,
        indent: 16,
        endIndent: 16,
      ),
      itemCount: despesas.length,
    );
  }
}
