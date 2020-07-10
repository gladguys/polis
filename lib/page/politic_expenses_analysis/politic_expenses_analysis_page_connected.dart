import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/politic_expenses_analysis/politic_expenses_analysis_bloc.dart';
import '../../core/domain/model/models.dart';
import '../../core/repository/concrete/repositories.dart';
import '../page_connected.dart';
import 'politic_expenses_analysis_page.dart';

class PoliticExpensesAnalysisPageConnected extends StatelessWidget {
  PoliticExpensesAnalysisPageConnected(this.politico);

  final PoliticoModel politico;

  @override
  Widget build(BuildContext context) {
    return PageConnected<PoliticExpensesAnalysisBloc>(
      bloc: PoliticExpensesAnalysisBloc(
        repository:
            context.repository<FirebasePoliticExpensesAnalysisRepository>(),
      )..add(GetPoliticExpensesData(politico)),
      page: PoliticExpensesAnalysisPage(politico),
    );
  }
}
