import '../../model/models.dart';

abstract class SearchPoliticRepository {
  Future<List<PoliticoModel>> getAllPolitics();
  Future<List<PoliticoModel>> getPoliticsFollowing(String userId);
}
