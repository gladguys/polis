part of 'politic_expenses_bloc.dart';

abstract class PoliticExpensesEvent extends Equatable {
  const PoliticExpensesEvent();
}

class GetPoliticExpenses extends PoliticExpensesEvent {
  GetPoliticExpenses(this.politicoId);

  final String politicoId;

  @override
  List<Object> get props => [politicoId];
}
