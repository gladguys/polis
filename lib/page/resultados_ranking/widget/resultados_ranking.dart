import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

import '../../../core/domain/model/models.dart';
import '../../../core/extension/extensions.dart';
import '../../../core/i18n/i18n.dart';
import '../../../widget/text_title.dart';
import 'politic_with_expenses_info.dart';

class ResultadosRanking extends StatelessWidget {
  ResultadosRanking({this.politico, this.resultadosRanking});

  final PoliticoModel politico;
  final ResultadosRankingModel resultadosRanking;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Center(
              child: TextTitle(EXPENSES_COMPARATION),
            ),
          ),
          const SizedBox(height: 14),
          Row(
            children: <Widget>[
              const Icon(
                FontAwesome5.arrow_alt_circle_up,
                color: Colors.amber,
              ),
              const SizedBox(width: 8),
              const Text(
                MORE_EXPENSE,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          PoliticWithExpensesInfo(
            nome: resultadosRanking.nomePoliticoUltimo,
            foto: resultadosRanking.fotoPoliticoUltimo,
            estado: resultadosRanking.estadoPoliticoUltimo,
            partido: resultadosRanking.partidoPoliticoUltimo,
            totalDespesas: resultadosRanking.despesaPoliticoUltimo,
          ),
          const SizedBox(height: 48),
          PoliticWithExpensesInfo(
            nome: politico.nomeEleitoral,
            foto: politico.urlFoto,
            estado: politico.siglaUf,
            partido: politico.siglaPartido,
            totalDespesas: politico.totalDespesas,
          ),
          const SizedBox(height: 48),
          for (int i = 0;
              i < resultadosRanking.nomesPoliticoPrimeiro.length;
              i++) ...[
            PoliticWithExpensesInfo(
              nome: resultadosRanking.nomesPoliticoPrimeiro[i],
              foto: resultadosRanking.fotosPoliticoPrimeiro[i],
              estado: resultadosRanking.estadosPoliticoPrimeiro[i],
              partido: resultadosRanking.partidosPoliticoPrimeiro[i],
              totalDespesas: resultadosRanking.despesasPoliticoPrimeiro[i],
            ),
            const SizedBox(height: 8),
          ],
          const SizedBox(height: 4),
          Row(
            children: <Widget>[
              const Icon(
                FontAwesome5.arrow_alt_circle_down,
                color: Colors.amber,
              ),
              const SizedBox(width: 8),
              const Text(LESS_EXPENSE),
            ],
          ),
          const SizedBox(height: 18),
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: Colors.amber,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    EXPENSES_AVERAGE,
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    '${resultadosRanking.despesaMedia.formatCurrency()}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
