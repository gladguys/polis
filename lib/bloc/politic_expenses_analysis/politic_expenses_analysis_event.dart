part of 'politic_expenses_analysis_bloc.dart';

abstract class PoliticExpensesAnalysisEvent extends Equatable {
  const PoliticExpensesAnalysisEvent();
}

class GetPoliticExpensesData extends PoliticExpensesAnalysisEvent {
  GetPoliticExpensesData(this.politico);

  final PoliticoModel politico;

  @override
  List<Object> get props => [politico];
}
