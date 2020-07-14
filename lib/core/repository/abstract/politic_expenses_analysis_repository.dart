import '../../domain/dto/total_despesas_anuais.dart';

abstract class PoliticExpensesAnalysisRepository {
  Future<TotalDespesasAnuais> getYearExpensesData(
      {String politicoId, String ano});
}
