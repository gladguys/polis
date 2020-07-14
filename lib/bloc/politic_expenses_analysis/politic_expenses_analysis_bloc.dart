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
  PoliticExpensesAnalysisBloc(
      {this.politicExpensesAnalysisRepository,
      this.politicExpensesAnalysisConfigRepository,
      this.politicoId})
      : assert(politicExpensesAnalysisRepository != null),
        assert(politicExpensesAnalysisConfigRepository != null);

  final PoliticExpensesAnalysisRepository politicExpensesAnalysisRepository;
  final PoliticExpensesAnalysisConfigRepository
      politicExpensesAnalysisConfigRepository;
  final String politicoId;

  int beginYear;

  @override
  PoliticExpensesAnalysisState get initialState =>
      PoliticExpensesAnalysisInitial();

  @override
  Stream<PoliticExpensesAnalysisState> mapEventToState(
      PoliticExpensesAnalysisEvent event) async* {
    if (event is GetInitialInfo) {
      yield* _mapGetInitialInfoToState(event);
    }
    if (event is GetPoliticExpensesDataForYear) {
      yield* _mapGetPoliticExpensesDataToState(event);
    }
  }

  Stream<PoliticExpensesAnalysisState> _mapGetInitialInfoToState(
      GetInitialInfo event) async* {
    try {
      yield LoadingPoliticExpensesData();

      final currentYear = event.year;
      beginYear =
          await politicExpensesAnalysisConfigRepository.getExpensesBeginYear();
      add(GetPoliticExpensesDataForYear(currentYear));
    } on Exception {
      yield GetPoliticExpensesDataFailed();
    }
  }

  Stream<PoliticExpensesAnalysisState> _mapGetPoliticExpensesDataToState(
      GetPoliticExpensesDataForYear event) async* {
    try {
      yield LoadingPoliticExpensesData();

      final year = event.year;
      final despesasPorTipo = await politicExpensesAnalysisRepository
          .getYearExpensesByType(politicoId: politicoId, ano: year.toString());
      final totalDespesasAnuais = await politicExpensesAnalysisRepository
          .getYearExpensesData(politicoId: politicoId, ano: year.toString());

      yield GetPoliticExpensesDataSuccess(
        year: year,
        despesasAnuaisPorTipo: despesasPorTipo,
        totalDespesasAnuais: totalDespesasAnuais,
      );
    } on Exception {
      yield GetPoliticExpensesDataFailed();
    }
  }
}
