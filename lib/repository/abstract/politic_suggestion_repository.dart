import '../../model/politico_model.dart';

abstract class PoliticSuggestionRepository {
  Future<List<PoliticoModel>> getSuggestedPolitics();
}
