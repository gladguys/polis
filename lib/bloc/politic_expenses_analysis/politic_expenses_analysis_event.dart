part of 'politic_expenses_analysis_bloc.dart';

abstract class PoliticExpensesAnalysisEvent extends Equatable {
  const PoliticExpensesAnalysisEvent();
}

class GetInitialInfo extends PoliticExpensesAnalysisEvent {
  GetInitialInfo(this.year);

  final int year;

  @override
  List<Object> get props => [year];
}

class GetPoliticExpensesDataForYear extends PoliticExpensesAnalysisEvent {
  GetPoliticExpensesDataForYear(this.year);

  final int year;

  @override
  List<Object> get props => [year];
}
