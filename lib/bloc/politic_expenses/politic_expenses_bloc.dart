import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core/repository/abstract/politic_expenses_repository.dart';
import 'politic_expenses_event.dart';
import 'politic_expenses_state.dart';

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
      PoliticExpensesEvent event) async* {
    yield LoadingPoliticExpenses();

    try {
      final expenses = await repository.getPoliticExpenses(event.politicoId);
      yield GetPoliticExpensesSuccess(expenses);
    } on Exception {
      yield GetPoliticExpensesFailed();
    }
  }
}
