import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/politic_expenses_analysis/politic_expenses_analysis_cubit.dart';
import '../../core/domain/model/models.dart';
import '../../core/repository/abstract/repositories.dart';
import '../../core/repository/concrete/repositories.dart';
import '../page_connected.dart';
import 'politic_expenses_analysis_page.dart';

class PoliticExpensesAnalysisPageConnected extends StatelessWidget {
  PoliticExpensesAnalysisPageConnected(this.politico);

  final PoliticoModel politico;

  @override
  Widget build(BuildContext context) {
    final year = DateTime.now().year;
    return PageConnected<PoliticExpensesAnalysisCubit>(
      bloc: PoliticExpensesAnalysisCubit(
        politicoId: politico.id,
        politicoUf: politico.siglaUf,
        politicExpensesAnalysisRepository:
            context.repository<FirebasePoliticExpensesAnalysisRepository>(),
        politicExpensesAnalysisConfigRepository: context
            .repository<FirebasePoliticExpensesAnalysisConfigRepository>(),
        politicExpensesAnalysisQuotaRepository:
            context.repository<PoliticExpensesAnalysisQuotaRepository>(),
        politicExpensesByTypeAnalysisRepository:
            context.repository<PoliticExpensesByTypeAnalysisRepository>(),
      )..getInitialInfo(year: year),
      page: PoliticExpensesAnalysisPage(politico),
    );
  }
}
