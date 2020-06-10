import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../core/domain/model/models.dart';
import '../../../core/extension/extensions.dart';
import '../../../core/i18n/i18n.dart';
import '../../../widget/text_title.dart';
import '../../theme/main_theme.dart';
import 'politic_with_expenses_info.dart';

class ResultadosRanking extends StatelessWidget {
  ResultadosRanking({this.politico, this.resultadosRanking});

  final PoliticoModel politico;
  final ResultadosRankingModel resultadosRanking;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: TextTitle(EXPENSES_COMPARATION),
          ),
          const SizedBox(height: 16),
          Row(
            children: <Widget>[
              FaIcon(
                FontAwesomeIcons.arrowAltCircleUp,
                color: theme.primaryColor,
              ),
              const SizedBox(width: 8),
              const Text(
                MORE_EXPENSE,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          _buildBorder(
            child: PoliticWithExpensesInfo(
              nome: resultadosRanking.nomePoliticoUltimo,
              foto: resultadosRanking.fotoPoliticoUltimo,
              estado: resultadosRanking.estadoPoliticoUltimo,
              partido: resultadosRanking.partidoPoliticoUltimo,
              totalDespesas: resultadosRanking.despesaPoliticoUltimo,
              posicao: 513,
            ),
          ),
          _buildSeparator(),
          _buildBorder(
            child: PoliticWithExpensesInfo(
              nome: politico.nomeEleitoral,
              foto: politico.urlFoto,
              estado: politico.siglaUf,
              partido: politico.siglaPartido,
              totalDespesas: politico.totalDespesas,
              posicao: politico.rankingPosDespesa,
            ),
          ),
          _buildSeparator(),
          _buildBorder(
            child: Column(
              children: <Widget>[
                for (int i = 0;
                    i < resultadosRanking.nomesPoliticoPrimeiro.length;
                    i++) ...[
                  PoliticWithExpensesInfo(
                    nome: resultadosRanking.nomesPoliticoPrimeiro[i],
                    foto: resultadosRanking.fotosPoliticoPrimeiro[i],
                    estado: resultadosRanking.estadosPoliticoPrimeiro[i],
                    partido: resultadosRanking.partidosPoliticoPrimeiro[i],
                    totalDespesas:
                        resultadosRanking.despesasPoliticoPrimeiro[i],
                    exibePosicao: i == 1 ? false : true,
                    posicao: 1,
                  ),
                  const SizedBox(height: 8),
                ],
              ],
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: <Widget>[
              const FaIcon(
                FontAwesomeIcons.arrowAltCircleDown,
                color: Colors.amber,
              ),
              const SizedBox(width: 8),
              const Text(
                LESS_EXPENSE,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 12,
            ),
            decoration: BoxDecoration(
              color: theme.primaryColorLight.withOpacity(.2),
              border: Border.all(
                width: 1,
                color: theme.primaryColorLight,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text('$EXPENSES_AVERAGE_BETWEEN_POLITICIS:'),
                Text(
                  '${resultadosRanking.despesaMedia.formatCurrency()}',
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildSeparator() {
    return Container(
      width: 72,
      alignment: Alignment.center,
      child: Container(
        height: 32,
        width: 2,
        color: theme.primaryColorLight,
      ),
    );
  }

  Widget _buildBorder({Widget child}) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 12,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: theme.primaryColorLight,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }
}
