import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:simple_router/simple_router.dart';

import '../../../core/domain/model/models.dart';
import '../../../core/extension/extensions.dart';
import '../../../core/i18n/i18n.dart';
import '../../../core/keys.dart';
import '../../../core/routing/route_names.dart';
import '../../../core/utils/date_utils.dart';
import '../../pages.dart';

class PoliticAdditionalInfo extends StatelessWidget {
  PoliticAdditionalInfo(this.politic);

  final tooltipKey = GlobalKey();
  final PoliticoModel politic;

  int get quantidadeSeguidores => (politic.quantidadeSeguidores ?? 0).toInt();
  double get totalDespesas => (politic.totalDespesas ?? 0).toDouble();
  int get totalProposicoes => (politic.totalProposicoes ?? 0).toInt();
  String get position =>
      '${politic.rankingPosDespesa?.toString()}º' ?? NO_POSITION;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: <Widget>[
        _buildButton(
          context: context,
          onPressed: () => SimpleRouter.forward(
            PoliticFollowersPageConnected(politic.id),
            name: POLITIC_FOLLOWERS_PAGE,
          ),
          value: quantidadeSeguidores.toString(),
          label: quantidadeSeguidores == 1 ? FOLLOWER : FOLLOWERS,
        ),
        _buildButton(
          context: context,
          onPressed: () => SimpleRouter.forward(
            PoliticProposalsPageConnected(politic),
            name: POLITIC_PROPOSALS_PAGE,
          ),
          value: totalProposicoes.toString(),
          label: PROJECTS_PARTICIPATIONS,
        ),
        _buildButton(
          context: context,
          onPressed: () => SimpleRouter.forward(
            ComparativoRankingDespesasPageConnected(politic),
            name: RESULTADOS_RANKING_PAGE,
          ),
          value: '$position',
          label: WITH_LESS_EXPENSES,
        ),
        _buildButton(
          context: context,
          onPressed: () => SimpleRouter.forward(
            PoliticExpensesAnalysisPageConnected(politic),
            name: POLITIC_EXPENSES_ANALYSIS_PAGE,
          ),
          value: totalDespesas.formatCurrency(),
          label: EXPENSES,
          tooltipMsg: getMonthPhrase(),
          onPressedTooltip: () {
            final dynamic tooltip = tooltipKey.currentState;
            tooltip.ensureTooltipVisible();
          },
        ),
      ],
    );
  }

  String getMonthPhrase() {
    final now = DateTime.now();
    return '''$EXPENSES_UNTIL_THE_DAY ${getLastDayOfLastMonth()} $OF ${getLastMonthName()} $OF ${now.year}''';
  }

  Widget _buildButton({
    Function onPressed,
    String value,
    String label,
    String tooltipMsg,
    Function onPressedTooltip,
    BuildContext context,
  }) {
    return OutlineButton(
      onPressed: onPressed,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      highlightedBorderColor: Colors.grey,
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      child: Container(
        constraints: const BoxConstraints(minWidth: 160),
        height: 60,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              value,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 150),
                  child: Text(
                    label,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    style: TextStyle(
                      height: 1,
                      color: Theme.of(context).brightness == Brightness.light
                          ? Colors.grey[600]
                          : Colors.grey[300],
                    ),
                  ),
                ),
                if (tooltipMsg != null)
                  Tooltip(
                    key: tooltipKey,
                    verticalOffset: 12,
                    message: tooltipMsg,
                    child: Container(
                      width: 20,
                      height: 20,
                      margin: const EdgeInsets.only(left: 8),
                      child: FlatButton(
                        key: expensesTooltipKey,
                        padding: EdgeInsets.zero,
                        child: FaIcon(
                          FontAwesomeIcons.infoCircle,
                          size: 20,
                          color: Colors.grey[500],
                        ),
                        onPressed: onPressedTooltip,
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
