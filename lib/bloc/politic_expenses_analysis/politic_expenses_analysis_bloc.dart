import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../core/domain/dto/despesa_anual_por_tipo.dart';
import '../../core/domain/dto/total_despesas_anuais.dart';
import '../../core/domain/model/models.dart';
import '../../core/repository/abstract/repositories.dart';

part 'politic_expenses_analysis_event.dart';
part 'politic_expenses_analysis_state.dart';

class PoliticExpensesAnalysisBloc
    extends Bloc<PoliticExpensesAnalysisEvent, PoliticExpensesAnalysisState> {
  PoliticExpensesAnalysisBloc({this.repository}) : assert(repository != null);

  final PoliticExpensesAnalysisRepository repository;

  @override
  PoliticExpensesAnalysisState get initialState =>
      PoliticExpensesAnalysisInitial();

  @override
  Stream<PoliticExpensesAnalysisState> mapEventToState(
      PoliticExpensesAnalysisEvent event) async* {
    if (event is GetPoliticExpensesData) {
      yield* _mapGetPoliticExpensesDataToState(event);
    }
  }

  Stream<PoliticExpensesAnalysisState> _mapGetPoliticExpensesDataToState(
      GetPoliticExpensesData event) async* {
    try {
      yield LoadingPoliticExpensesData();

      final politico = event.politico;
      final despesasPorTipo = await repository.getYearExpensesByType(
          politicoId: politico.id, ano: '2020');
      final totalDespesasAnuais = await repository.getYearExpensesData(
          politicoId: politico.id, ano: '2020');

      yield GetPoliticExpensesDataSuccess(
        despesasAnuaisPorTipo: despesasPorTipo,
        totalDespesasAnuais: totalDespesasAnuais,
      );
    } on Exception {
      yield GetPoliticExpensesDataFailed();
    }
  }
}
