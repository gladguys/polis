import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/blocs.dart';
import '../../core/domain/model/models.dart';
import '../../core/repository/concrete/repositories.dart';
import '../page_connected.dart';
import 'politic_expenses_page.dart';

class PoliticExpensesPageConnected extends StatelessWidget {
  PoliticExpensesPageConnected(this.politico);

  final PoliticoModel politico;

  @override
  Widget build(BuildContext context) {
    return PageConnected<PoliticExpensesBloc>(
      bloc: PoliticExpensesBloc(
        repository: context.repository<FirebasePoliticExpensesRepository>(),
      )..add(GetPoliticExpenses(politico.id)),
      page: PoliticExpensesPage(),
    );
  }
}
