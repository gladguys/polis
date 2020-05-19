import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:simple_router/simple_router.dart';

import '../../../core/routing/route_names.dart';
import '../../../core/utils/date_utils.dart';
import '../../../extension/extensions.dart';
import '../../../i18n/i18n.dart';
import '../../../model/models.dart';
import '../../../widget/text_rich.dart';
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
    return Column(
      children: <Widget>[
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              InkWell(
                borderRadius: BorderRadius.circular(5),
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
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      quantidadeSeguidores == 1 ? FOLLOWER : FOLLOWERS,
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Column(
                children: <Widget>[
                  Text(
                    totalProposicoes.toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Container(
                    width: 90,
                    child: Text(
                      PROPOSERS,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Column(
              children: <Widget>[
                TextRich(
                  children: [
                    TextSpan(
                      text: totalDespesas.formatCurrency(),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    TextSpan(
                      text: ' ($position)',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text(
                      EXPENSES,
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Tooltip(
                      key: tooltipKey,
                      verticalOffset: 12,
                      message: getMonthPhrase(),
                      child: Container(
                        width: 18,
                        height: 20,
                        child: FlatButton(
                          padding: EdgeInsets.zero,
                          child: FaIcon(
                            FontAwesomeIcons.infoCircle,
                            size: 18,
                            color: Colors.grey[500],
                          ),
                          onPressed: () {
                            final dynamic tooltip = tooltipKey.currentState;
                            tooltip.ensureTooltipVisible();
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  String getMonthPhrase() {
    final now = DateTime.now();
    return '''$EXPENSES_UNTIL_THE_DAY ${getLastDayOfLastMonth()} $OF ${getLastMonthName()} $OF ${now.year}''';
  }
}
