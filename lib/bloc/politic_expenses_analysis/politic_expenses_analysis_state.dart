part of 'politic_expenses_analysis_bloc.dart';

abstract class PoliticExpensesAnalysisState extends Equatable {
  const PoliticExpensesAnalysisState();
}

class PoliticExpensesAnalysisInitial extends PoliticExpensesAnalysisState {
  @override
  List<Object> get props => [];
}

class GetPoliticExpensesDataSuccess extends PoliticExpensesAnalysisState {
  GetPoliticExpensesDataSuccess(
      {this.year, this.totalDespesasAnuais, this.despesasAnuaisPorTipo});

  final int year;
  final TotalDespesasAnuais totalDespesasAnuais;
  final DespesaAnualPorTipo despesasAnuaisPorTipo;

  @override
  List<Object> get props => [year];
}

class LoadingPoliticExpensesData extends PoliticExpensesAnalysisState {
  @override
  List<Object> get props => [];
}

class GetPoliticExpensesDataFailed extends PoliticExpensesAnalysisState {
  @override
  List<Object> get props => [];
}
