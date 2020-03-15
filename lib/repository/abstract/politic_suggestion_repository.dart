import '../../model/politico_model.dart';

abstract class PoliticSuggestionRepository {
  Future<List<PoliticoModel>> getSuggestedPolitics();
  Future<void> savePoliticsToFollow(
      {String userId, List<PoliticoModel> politics});
}
