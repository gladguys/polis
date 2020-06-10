part of 'politic_expenses_bloc.dart';

@Sealed([
  InitialPoliticExpensesState,
  GetPoliticExpensesSuccess,
  LoadingPoliticExpenses,
  GetPoliticExpensesFailed,
])
abstract class PoliticExpensesState extends Equatable {
  const PoliticExpensesState();
}

class InitialPoliticExpensesState extends PoliticExpensesState {
  @override
  List<Object> get props => [];
}

class GetPoliticExpensesSuccess extends PoliticExpensesState {
  GetPoliticExpensesSuccess(this.despesas);

  final List<DespesaModel> despesas;

  @override
  List<Object> get props => [despesas];
}

class LoadingPoliticExpenses extends PoliticExpensesState {
  @override
  List<Object> get props => [];
}

class GetPoliticExpensesFailed extends PoliticExpensesState {
  @override
  List<Object> get props => [];
}
