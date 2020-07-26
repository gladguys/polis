import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smart_select/smart_select.dart';

import '../../bloc/blocs.dart';
import '../../core/domain/model/models.dart';
import '../../core/i18n/i18n.dart';
import '../../widget/card_base.dart';
import '../../widget/error_container.dart';
import '../../widget/image/photo_image.dart';
import '../../widget/loading.dart';
import '../../widget/photo.dart';
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
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    const SizedBox(height: 8),
                    TextTitle(EXPENSES_ANALYSIS),
                    const SizedBox(height: 16),
                    Row(
                      children: <Widget>[
                        Expanded(child: _buildPolitico(context)),
                        const SizedBox(width: 4),
                        _buildSelectYear(year, context),
                      ],
                    ),
                    ExpensesByTypeChart(
                      despesasPorTipo: despesasPorTipo,
                    ),
                    ExpensesByMonth(
                      despesasPorMes: totalDespesasAno.despesasPorMes,
                    ),
                    const SizedBox(height: 16),
                    SeeExpensesButton(politico),
                  ],
                ),
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

  Widget _buildPolitico(BuildContext context) {
    return CardBase(
      crossAxisAlignment: CrossAxisAlignment.center,
      withIndent: false,
      slotLeft: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          Photo(url: politico.urlFoto),
          Positioned(
            right: 0,
            bottom: 0,
            child: PhotoImage(
              url: politico.urlPartidoLogo,
              size: 18,
            ),
          ),
        ],
      ),
      slotCenter: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            politico.nomeEleitoral,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              height: 1,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            '$POLITIC · ${politico.siglaPartido}'
            ' · ${politico.siglaUf}',
            style: TextStyle(
              fontSize: 12,
              height: 1,
              color: Theme.of(context).brightness == Brightness.light
                  ? Colors.grey[600]
                  : Colors.grey[300],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSelectYear(int year, BuildContext context) {
    return Container(
      width: 132,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[700]),
        borderRadius: BorderRadius.circular(10),
      ),
      child: SmartSelect<int>.single(
        title: '$YEAR:',
        value: year,
        options: _getAllPossibleYears(context),
        onChange: (pickedYear) => context
            .bloc<PoliticExpensesAnalysisBloc>()
            .add(GetPoliticExpensesDataForYear(pickedYear)),
        trailing: FaIcon(
          FontAwesomeIcons.chevronDown,
          size: 12,
          color: Colors.grey[600],
        ),
        choiceConfig: SmartSelectChoiceConfig(
          style: SmartSelectChoiceStyle(
            activeColor: Theme.of(context).primaryColor,
            inactiveColor: Theme.of(context).brightness == Brightness.light
                ? null
                : Colors.grey[300],
            titleStyle: TextStyle(
              fontSize: 14,
              fontFamily: 'Ubuntu',
              color: Theme.of(context).brightness == Brightness.light
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
            backgroundColor: Theme.of(context).brightness == Brightness.light
                ? null
                : Colors.grey[800],
            textStyle: TextStyle(
              color: Theme.of(context).brightness == Brightness.light
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
