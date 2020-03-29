import '../../model/politico_model.dart';

abstract class SearchPoliticRepository {
  Future<List<PoliticoModel>> getAllPolitics();
  Future<List<PoliticoModel>> getPoliticsFollowing(String userId);
}
