import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
            final despesasPorTipo = state.despesasPorTipo;
            final totalDespesasAno = state.totalDespesasAnuais;
            return SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 8),
                  TextTitle(EXPENSES_ANALYSIS),
                  ExpensesByTypeChart(
                    despesasPorTipo: despesasPorTipo,
                  ),
                  Container(
                    width: 195,
                    child: SmartSelect<int>.single(
                      title: '$EXPENSES_ON_YEAR:',
                      value: year,
                      options: _getAllPossibleYears(context),
                      onChange: (pickedYear) => context
                          .bloc<PoliticExpensesAnalysisBloc>()
                          .add(GetPoliticExpensesDataForYear(pickedYear)),
                      padding: EdgeInsets.zero,
                      trailing: FaIcon(
                        FontAwesomeIcons.chevronDown,
                        size: 14,
                      ),
                      choiceConfig: SmartSelectChoiceConfig(
                        style: SmartSelectChoiceStyle(
                          activeColor: Theme.of(context).primaryColor,
                          inactiveColor:
                              Theme.of(context).brightness == Brightness.light
                                  ? null
                                  : Colors.grey[300],
                          titleStyle: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Ubuntu',
                            color:
                                Theme.of(context).brightness == Brightness.light
                                    ? Colors.grey[600]
                                    : Colors.grey[300],
                          ),
                        ),
                      ),
                      modalType: SmartSelectModalType.popupDialog,
                      modalConfig: SmartSelectModalConfig(
                        style: SmartSelectModalStyle(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        headerStyle: SmartSelectModalHeaderStyle(
                          backgroundColor:
                              Theme.of(context).brightness == Brightness.light
                                  ? null
                                  : Colors.grey[800],
                          textStyle: TextStyle(
                            color:
                                Theme.of(context).brightness == Brightness.light
                                    ? Colors.black
                                    : Colors.grey[300],
                          ),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  ExpensesByMonth(
                    despesasPorMes: totalDespesasAno.despesasPorMes,
                  ),
                  const SizedBox(height: 16),
                  SeeExpensesButton(politico),
                ],
              ),
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
