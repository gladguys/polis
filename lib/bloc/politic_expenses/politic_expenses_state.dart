part of 'politic_expenses_cubit.dart';

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

class GetPoliticExpensesFailed extends PoliticExpensesState {
  @override
  List<Object> get props => [];
}

class LoadingPoliticExpenses extends PoliticExpensesState {
  @override
  List<Object> get props => [];
}
