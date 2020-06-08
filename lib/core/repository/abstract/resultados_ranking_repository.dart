import '../../domain/model/models.dart';

abstract class ResultadosRankingRepository {
  Future<ResultadosRankingModel> getRankingResults();
}
