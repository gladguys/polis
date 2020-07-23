import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../core/domain/dto/despesa_por_tipo.dart';
import '../../core/domain/dto/total_despesas_anuais.dart';
import '../../core/repository/abstract/repositories.dart';

part 'politic_expenses_analysis_state.dart';

class PoliticExpensesAnalysisCubit extends Cubit<PoliticExpensesAnalysisState> {
  PoliticExpensesAnalysisCubit({
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

  void getInitialInfo({int year}) async {
    try {
      emit(LoadingPoliticExpensesData());

      final currentYear = year;

      maxQuotaForState = await politicExpensesAnalysisQuotaRepository
          .getMaxQuotaForStateUf(politicoUf);
      beginYear =
          await politicExpensesAnalysisConfigRepository.getExpensesBeginYear();

      getPoliticExpensesDataForYear(year: currentYear);
    } on Exception {
      emit(GetPoliticExpensesDataFailed());
    }
  }

  void getPoliticExpensesDataForYear({int year}) async {
    try {
      emit(LoadingPoliticExpensesData());

      final despesasPorTipo = await politicExpensesByTypeAnalysisRepository
          .getYearExpensesByType(politicoId: politicoId, ano: year.toString());

      final totalDespesasAnuais = await politicExpensesAnalysisRepository
          .getYearExpensesData(politicoId: politicoId, ano: year.toString());

      emit(
        GetPoliticExpensesDataSuccess(
          year: year,
          despesasPorTipo: despesasPorTipo,
          totalDespesasAnuais: totalDespesasAnuais,
        ),
      );
    } on Exception {
      emit(GetPoliticExpensesDataFailed());
    }
  }
}
