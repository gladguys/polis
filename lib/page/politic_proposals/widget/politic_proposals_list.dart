import 'package:flutter/material.dart';

import '../../../core/domain/model/models.dart';
import '../../../widget/tile/politic_proposta_tile_connected.dart';

class PoliticProposalsList extends StatelessWidget {
  PoliticProposalsList(this.propostas);

  final List<PropostaModel> propostas;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (_, i) => PoliticPropostaTileConnected(
        propostas[i],
        clickableImage: false,
      ),
      itemCount: propostas.length,
    );
  }
}
