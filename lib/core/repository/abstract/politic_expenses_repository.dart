import '../../domain/model/models.dart';

abstract class PoliticExpensesRepository {
  Future<List<DespesaModel>> getPoliticExpenses(String politicId);
}
