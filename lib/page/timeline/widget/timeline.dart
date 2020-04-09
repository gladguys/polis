import 'package:flutter/material.dart';

import '../../../i18n/i18n.dart';
import '../../../model/models.dart';
import '../../../widget/text_rich.dart';
import '../../../widget/tile/despesa_tile_connected.dart';
import '../../../widget/tile/proposta_tile_connected.dart';

class Timeline extends StatelessWidget {
  Timeline({this.activities});

  final List<dynamic> activities;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: <Widget>[
        _buildList(),
        Positioned(
          top: 8,
          child: _buildUpdateButton(),
        ),
      ],
    );
  }

  Widget _buildList() {
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
        height: 16,
        indent: 8,
        endIndent: 8,
      ),
      itemCount: activities.length,
    );
  }

  Widget _buildUpdateButton() {
    return Container(
      height: 26,
      child: RaisedButton(
        child: TextRich(
          fontSize: 12,
          children: <InlineSpan>[
            TextSpan(
              text: '10', // TODO: trazer qtd de atualizações
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: ' $UPDATES',
            ),
          ],
        ),
        onPressed: () {},
      ),
    );
  }
}
