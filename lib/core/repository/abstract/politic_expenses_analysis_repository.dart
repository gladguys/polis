import '../../domain/dto/despesa_anual_por_tipo.dart';
import '../../domain/dto/total_despesas_anuais.dart';

abstract class PoliticExpensesAnalysisRepository {
  Future<TotalDespesasAnuais> getYearExpensesData(
      {String politicoId, String ano});
  Future<DespesaAnualPorTipo> getYearExpensesByType(
      {String politicoId, String ano});
}
