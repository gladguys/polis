import '../../domain/dto/despesa_por_tipo.dart';

abstract class PoliticExpensesByTypeAnalysisRepository {
  Future<List<DespesaPorTipo>> getYearExpensesByType(
      {String politicoId, String ano});
}
