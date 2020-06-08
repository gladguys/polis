import 'package:flutter/material.dart';

import '../../../core/extension/extensions.dart';
import '../../../core/i18n/i18n.dart';

class PoliticWithExpensesInfo extends StatelessWidget {
  const PoliticWithExpensesInfo({
    @required this.nome,
    @required this.foto,
    @required this.partido,
    @required this.estado,
    @required this.totalDespesas,
  })  : assert(nome != null),
        assert(foto != null),
        assert(partido != null),
        assert(estado != null),
        assert(totalDespesas != null);

  final String nome;
  final String foto;
  final String partido;
  final String estado;
  final double totalDespesas;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        CircleAvatar(
          backgroundImage: NetworkImage(foto),
          radius: 40,
        ),
        Column(
          children: <Widget>[
            Text(
              nome,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '$FEDERAL_DEPUTY - $partido - $estado',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
            Text(
              totalDespesas.formatCurrency(),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.green,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
