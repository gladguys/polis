import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_select/smart_select.dart';

import '../../bloc/blocs.dart';
import '../../core/domain/model/models.dart';
import '../../core/i18n/i18n.dart';
import '../../widget/error_container.dart';
import '../../widget/loading.dart';
import '../../widget/text_title.dart';
import 'widget/expenses_by_month.dart';
import 'widget/expenses_by_type_chart.dart';
import 'widget/see_expenses_button.dart';

class PoliticExpensesAnalysisPage extends StatelessWidget {
  PoliticExpensesAnalysisPage(this.politico);

  final PoliticoModel politico;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<PoliticExpensesAnalysisBloc,
            PoliticExpensesAnalysisState>(builder: (_, state) {
          if (state is GetPoliticExpensesDataSuccess) {
            final year = state.year;
            final despesasAnuaisPorTipo = state.despesasAnuaisPorTipo;
            final totalDespesasAno = state.totalDespesasAnuais;
            return Column(
              children: <Widget>[
                const SizedBox(height: 8),
                TextTitle(EXPENSES_ANALYSIS),
                const SizedBox(height: 18),
                Expanded(
                  child: ExpensesByTypeChart(
                    despesasAnuaisPorTipo: despesasAnuaisPorTipo,
                  ),
                ),
                const SizedBox(height: 8),
                SmartSelect<int>.single(
                  title: EXPENSES_ON_YEAR,
                  value: year,
                  options: _getAllPossibleYears(context),
                  onChange: (pickedYear) => context
                      .bloc<PoliticExpensesAnalysisBloc>()
                      .add(GetPoliticExpensesDataForYear(pickedYear)),
                ),
                const SizedBox(height: 8),
                Expanded(
                  child: SingleChildScrollView(
                    child: ExpensesByMonth(
                      despesasPorMes: totalDespesasAno.despesasPorMes,
                    ),
                  ),
                ),
                SeeExpensesButton(politico),
              ],
            );
          } else if (state is LoadingPoliticExpensesData) {
            return const Loading();
          }
          return const ErrorContainer();
        }),
      ),
    );
  }

  List<SmartSelectOption<int>> _getAllPossibleYears(BuildContext context) {
    var yearOptions = <SmartSelectOption<int>>[];
    final beginYear = context.bloc<PoliticExpensesAnalysisBloc>().beginYear;
    final currentYear = DateTime.now().year;
    for (var year = beginYear; year <= currentYear; year++) {
      yearOptions.add(
        SmartSelectOption(title: year.toString(), value: year),
      );
    }
    return yearOptions;
  }
}
