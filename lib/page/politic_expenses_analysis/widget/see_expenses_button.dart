import 'package:flutter/material.dart';
import 'package:simple_router/simple_router.dart';

import '../../../core/domain/model/models.dart';
import '../../../core/i18n/i18n.dart';
import '../../../core/routing/route_names.dart';
import '../../pages.dart';

class SeeExpensesButton extends StatelessWidget {
  SeeExpensesButton(this.politico);

  final PoliticoModel politico;

  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      child: Text(
        SEE_EXPENSES,
        style: const TextStyle(fontSize: 16),
      ),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
      highlightedBorderColor: Colors.grey,
      onPressed: () => SimpleRouter.forward(
        PoliticExpensesPageConnected(politico),
        name: RANKING_EXPENSES_COMPARE_PAGE,
      ),
    );
  }
}
