import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core/domain/model/models.dart';

part 'politic_expenses_state.freezed.dart';

@freezed
abstract class PoliticExpensesState with _$PoliticExpensesState {
  factory PoliticExpensesState.initial() = InitialPoliticExpensesState;
  factory PoliticExpensesState.getPoliticExpensesSuccess(
      List<DespesaModel> despesas) = GetPoliticExpensesSuccess;
  factory PoliticExpensesState.getPoliticExpensesFailed() =
      GetPoliticExpensesFailed;
  factory PoliticExpensesState.loadingPoliticExpenses() =
      LoadingPoliticExpenses;
}
