import '../../model/politico_model.dart';
import '../../model/user_model.dart';

abstract class PoliticSuggestionRepository {
  Future<List<PoliticoModel>> getSuggestedPolitics();
  Future<void> savePoliticsToFollow(
      {String userId, List<PoliticoModel> politics});
  Future<void> saveFollowerToPolitics(
      {UserModel user, List<PoliticoModel> politics});
}
