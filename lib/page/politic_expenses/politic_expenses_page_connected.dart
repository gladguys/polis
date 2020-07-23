import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/cubits.dart';
import '../../core/domain/model/models.dart';
import '../../core/repository/concrete/repositories.dart';
import '../page_connected.dart';
import 'politic_expenses_page.dart';

class PoliticExpensesPageConnected extends StatelessWidget {
  PoliticExpensesPageConnected(this.politico);

  final PoliticoModel politico;

  @override
  Widget build(BuildContext context) {
    return PageConnected<PoliticExpensesCubit>(
      bloc: PoliticExpensesCubit(
        repository: context.repository<FirebasePoliticExpensesRepository>(),
      )..getPoliticExpenses(politico.id),
      page: PoliticExpensesPage(),
    );
  }
}
