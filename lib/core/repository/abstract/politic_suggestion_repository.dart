import '../../../core/domain/model/models.dart';

abstract class PoliticSuggestionRepository {
  Future<List<PoliticoModel>> getSuggestedPolitics(String stateOption);
  Future<void> savePoliticsToFollow(
      {String userId, List<PoliticoModel> politics});
  Future<void> saveFollowerToPolitics(
      {UserModel user, List<PoliticoModel> politics});
}
