import '../../domain/model/models.dart';

abstract class ComparativoRankingDespesasRepository {
  Future<ResultadosRankingModel> getRankingResults();
}
