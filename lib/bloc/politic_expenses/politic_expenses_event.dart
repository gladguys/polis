import 'package:equatable/equatable.dart';

abstract class PoliticExpensesEvent extends Equatable {
  const PoliticExpensesEvent();
}

class GetPoliticExpenses extends PoliticExpensesEvent {
  GetPoliticExpenses(this.politicoId);

  final String politicoId;

  @override
  List<Object> get props => [politicoId];
}
