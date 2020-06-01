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
                    Container(
                      width: 160,
                      child: Text(
                        quantidadeSeguidores == 1 ? FOLLOWER : FOLLOWERS,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
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
                    width: 120,
                    child: Text(
                      PROJECTS_PARTICIPATIONS,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 12,
                        height: 1,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    totalDespesas.formatCurrency(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Container(
                    width: 160,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
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
                              key: expensesTooltipKey,
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
                  ),
                ],
              ),
              const SizedBox(width: 8),
              Column(
                children: <Widget>[
                  Text(
                    '$position',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Container(
                    width: 100,
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      WITH_LESS_EXPENSES,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 12,
                        height: 1,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  String getMonthPhrase() {
    final now = DateTime.now();
    return '''$EXPENSES_UNTIL_THE_DAY ${getLastDayOfLastMonth()} $OF ${getLastMonthName()} $OF ${now.year}''';
  }
}
