import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../core/domain/model/models.dart';
import '../../core/repository/abstract/politic_expenses_repository.dart';

part 'politic_expenses_state.dart';

class PoliticExpensesCubit extends Cubit<PoliticExpensesState> {
  PoliticExpensesCubit({@required this.repository})
      : assert(repository != null),
        super(InitialPoliticExpensesState());

  final PoliticExpensesRepository repository;

  void getPoliticExpenses(String politicoId) async {
    emit(LoadingPoliticExpenses());

    try {
      final expenses = await repository.getPoliticExpenses(politicoId);
      emit(GetPoliticExpensesSuccess(expenses));
    } on Exception {
      emit(GetPoliticExpensesFailed());
    }
  }
}
