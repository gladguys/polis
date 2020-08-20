import 'package:flutter/material.dart';
import 'package:simple_router/simple_router.dart';

import '../../../core/extension/extensions.dart';
import '../../../core/i18n/i18n.dart';
import '../../../core/routing/route_names.dart';
import '../../../widget/photo.dart';
import '../../pages.dart';

class PoliticWithExpensesInfo extends StatelessWidget {
  const PoliticWithExpensesInfo({
    this.idPolitico,
    @required this.nome,
    @required this.foto,
    @required this.partido,
    @required this.estado,
    @required this.totalDespesas,
    this.posicao,
    this.exibePosicao = true,
  })  : assert(nome != null),
        assert(foto != null),
        assert(partido != null),
        assert(estado != null),
        assert(totalDespesas != null);

  final String idPolitico;
  final String nome;
  final String foto;
  final String partido;
  final String estado;
  final double totalDespesas;
  final int posicao;
  final bool exibePosicao;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: 46,
          child: exibePosicao
              ? _buildPosicao(context)
              : const SizedBox(height: 10),
        ),
        const SizedBox(width: 8),
        _buildPolitico(context),
      ],
    );
  }

  Widget _buildPosicao(BuildContext context) {
    return Container(
      width: 46,
      height: 46,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColorLight,
        borderRadius: BorderRadius.circular(23),
      ),
      child: Text(
        '$posicaoº',
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget _buildPolitico(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        GestureDetector(
          onTap: () => SimpleRouter.forward(
            PoliticProfilePageConnected(idPolitico),
            name: POLITIC_PROFILE_PAGE,
          ),
          child: Photo(
            url: foto,
            size: 60,
            borderRadius: BorderRadius.circular(35),
          ),
        ),
        const SizedBox(width: 4),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              nome,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '$FEDERAL_DEPUTY - $partido - $estado',
              style: TextStyle(
                color: Theme.of(context).brightness == Brightness.light
                    ? Colors.grey[600]
                    : Colors.grey[300],
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              totalDespesas.formatCurrency(),
              style: const TextStyle(
                fontWeight: FontWeight.w500,
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
