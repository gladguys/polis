import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../bloc/blocs.dart';
import '../../core/domain/model/models.dart';
import '../../core/i18n/i18n.dart';
import '../../core/routing/route_names.dart';
import '../../widget/default_bottombar.dart';
import '../../widget/empty_info.dart';
import '../../widget/error_container.dart';
import '../../widget/text_title.dart';
import '../../widget/tile/politic_expense_tile.dart';
import 'widget/politic_expenses_skeleton.dart';

class PoliticExpensesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: DefaultBottombar(
        SEARCH_POLITIC_PAGE,
        withBack: true,
      ),
      body: SafeArea(
        child: BlocBuilder<PoliticExpensesBloc, PoliticExpensesState>(
          builder: (_, state) {
            if (state is GetPoliticExpensesSuccess) {
              return _buildList(state.despesas);
            } else if (state is LoadingPoliticExpenses) {
              return const PoliticExpensesSkeleton();
            } else {
              return const ErrorContainer();
            }
          },
        ),
      ),
    );
  }

  Widget _buildList(List<DespesaModel> despesas) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 8),
        TextTitle(POLITIC_EXPENSES),
        despesas.isNotEmpty
            ? Expanded(
                child: ListView.builder(
                  itemBuilder: (_, i) => PoliticExpenseTile(despesas[i]),
                  itemCount: despesas.length,
                ),
              )
            : Expanded(
                child: EmptyInfo(
                  text: POLITIC_HAS_NO_EXPENSE,
                  icon: FontAwesomeIcons.folderOpen,
                ),
              ),
      ],
    );
  }
}
