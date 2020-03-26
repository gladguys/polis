import '../../model/politico_model.dart';

abstract class SearchPoliticRepository {
  Future<List<PoliticoModel>> getPoliticsByFilter();
}
