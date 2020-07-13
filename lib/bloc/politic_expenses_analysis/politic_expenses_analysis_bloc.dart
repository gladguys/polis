import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../core/domain/dto/despesa_anual_por_tipo.dart';
import '../../core/domain/dto/total_despesas_anuais.dart';
import '../../core/repository/abstract/repositories.dart';

part 'politic_expenses_analysis_event.dart';
part 'politic_expenses_analysis_state.dart';

class PoliticExpensesAnalysisBloc
    extends Bloc<PoliticExpensesAnalysisEvent, PoliticExpensesAnalysisState> {
  PoliticExpensesAnalysisBloc({this.repository, this.politicoId})
      : year = DateTime.now().year,
        assert(repository != null);

  final PoliticExpensesAnalysisRepository repository;
  final String politicoId;

  int year;

  @override
  PoliticExpensesAnalysisState get initialState =>
      PoliticExpensesAnalysisInitial();

  @override
  Stream<PoliticExpensesAnalysisState> mapEventToState(
      PoliticExpensesAnalysisEvent event) async* {
    if (event is GetPoliticExpensesData) {
      yield* _mapGetPoliticExpensesDataToState(event);
    }
    if (event is GetPoliticExpensesDataFromNextYear) {
      yield* _mapGetPoliticExpensesDataFromNextYearToState(event);
    }
    if (event is GetPoliticExpensesDataFromPreviousYear) {
      yield* _mapGetPoliticExpensesDataFromPreviousYearToState(event);
    }
  }

  Stream<PoliticExpensesAnalysisState> _mapGetPoliticExpensesDataToState(
      GetPoliticExpensesData event) async* {
    try {
      yield LoadingPoliticExpensesData();

      final despesasPorTipo = await repository.getYearExpensesByType(
          politicoId: politicoId, ano: year.toString());
      final totalDespesasAnuais = await repository.getYearExpensesData(
          politicoId: politicoId, ano: year.toString());

      yield GetPoliticExpensesDataSuccess(
        despesasAnuaisPorTipo: despesasPorTipo,
        totalDespesasAnuais: totalDespesasAnuais,
      );
    } on Exception {
      yield GetPoliticExpensesDataFailed();
    }
  }

  Stream<PoliticExpensesAnalysisState>
      _mapGetPoliticExpensesDataFromNextYearToState(
          GetPoliticExpensesDataFromNextYear event) async* {
    year++;
    add(GetPoliticExpensesData());
  }

  Stream<PoliticExpensesAnalysisState>
      _mapGetPoliticExpensesDataFromPreviousYearToState(
          GetPoliticExpensesDataFromPreviousYear event) async* {
    year--;
    add(GetPoliticExpensesData());
  }
}
