import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../core/domain/dto/despesa_por_tipo.dart';
import '../../core/domain/dto/total_despesas_anuais.dart';
import '../../core/repository/abstract/repositories.dart';

part 'politic_expenses_analysis_event.dart';
part 'politic_expenses_analysis_state.dart';

class PoliticExpensesAnalysisBloc
    extends Bloc<PoliticExpensesAnalysisEvent, PoliticExpensesAnalysisState> {
  PoliticExpensesAnalysisBloc({
    @required this.politicExpensesAnalysisRepository,
    @required this.politicExpensesAnalysisConfigRepository,
    @required this.politicExpensesAnalysisQuotaRepository,
    @required this.politicExpensesByTypeAnalysisRepository,
    @required this.politicoId,
    @required this.politicoUf,
  })  : assert(politicExpensesAnalysisRepository != null),
        assert(politicExpensesAnalysisConfigRepository != null),
        assert(politicExpensesAnalysisQuotaRepository != null),
        assert(politicExpensesByTypeAnalysisRepository != null),
        assert(politicoId != null),
        assert(politicoUf != null),
        super(PoliticExpensesAnalysisInitial());

  final PoliticExpensesAnalysisRepository politicExpensesAnalysisRepository;
  final PoliticExpensesAnalysisConfigRepository
      politicExpensesAnalysisConfigRepository;
  final PoliticExpensesAnalysisQuotaRepository
      politicExpensesAnalysisQuotaRepository;
  final PoliticExpensesByTypeAnalysisRepository
      politicExpensesByTypeAnalysisRepository;
  final String politicoId;
  final String politicoUf;

  int beginYear;
  double maxQuotaForState;

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

      maxQuotaForState = await politicExpensesAnalysisQuotaRepository
          .getMaxQuotaForStateUf(politicoUf);
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

      final despesasPorTipo = await politicExpensesByTypeAnalysisRepository
          .getYearExpensesByType(politicoId: politicoId, ano: year.toString());

      final totalDespesasAnuais = await politicExpensesAnalysisRepository
          .getYearExpensesData(politicoId: politicoId, ano: year.toString());

      yield GetPoliticExpensesDataSuccess(
        year: year,
        despesasPorTipo: despesasPorTipo,
        totalDespesasAnuais: totalDespesasAnuais,
      );
    } on Exception {
      yield GetPoliticExpensesDataFailed();
    }
  }
}
