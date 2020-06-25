import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../core/domain/model/models.dart';
import '../../core/repository/abstract/politic_expenses_repository.dart';

part 'politic_expenses_event.dart';
part 'politic_expenses_state.dart';

class PoliticExpensesBloc
    extends Bloc<PoliticExpensesEvent, PoliticExpensesState> {
  PoliticExpensesBloc({@required this.repository}) : assert(repository != null);

  final PoliticExpensesRepository repository;

  @override
  PoliticExpensesState get initialState => InitialPoliticExpensesState();

  @override
  Stream<PoliticExpensesState> mapEventToState(
      PoliticExpensesEvent event) async* {
    yield* event.map(
      getPoliticExpenses: _mapGetPoliticExpensesToState,
    );
  }

  Stream<PoliticExpensesState> _mapGetPoliticExpensesToState(
      String politicoId) async* {
    yield LoadingPoliticExpenses();

    try {
      final expenses = await repository.getPoliticExpenses(politicoId);
      yield GetPoliticExpensesSuccess(expenses);
    } on Exception {
      yield GetPoliticExpensesFailed();
    }
  }
}
