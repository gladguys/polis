part of 'politic_expenses_analysis_bloc.dart';

abstract class PoliticExpensesAnalysisEvent extends Equatable {
  const PoliticExpensesAnalysisEvent();
}

class GetPoliticExpensesData extends PoliticExpensesAnalysisEvent {
  @override
  List<Object> get props => [];
}

class GetPoliticExpensesDataFromNextYear extends PoliticExpensesAnalysisEvent {
  @override
  List<Object> get props => [];
}

class GetPoliticExpensesDataFromPreviousYear
    extends PoliticExpensesAnalysisEvent {
  @override
  List<Object> get props => [];
}
