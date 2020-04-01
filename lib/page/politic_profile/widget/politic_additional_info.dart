import 'package:flutter/material.dart';
import 'package:simple_router/simple_router.dart';

import '../../../core/routing/route_names.dart';
import '../../../model/models.dart';
import '../../pages.dart';

class PoliticAdditionalInfo extends StatelessWidget {
  PoliticAdditionalInfo(this.politic);

  final PoliticoModel politic;

  int get quantidadeSeguidores => (politic.quantidadeSeguidores ?? 0).toInt();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        GestureDetector(
          onTap: () => SimpleRouter.forward(
            PoliticFollowersPageConnected(politic.id),
            name: POLITIC_FOLLOWERS_PAGE,
          ),
          child: Column(
            children: <Widget>[
              Text(
                quantidadeSeguidores.toString(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
              const Text(
                'Seguidores',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
        Column(
          children: <Widget>[
            const Text(
              '50',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            const Text(
              'Proposições',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ],
        ),
        Column(
          children: <Widget>[
            const Text(
              'R\$ 20k',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            const Text(
              'Despesas',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
