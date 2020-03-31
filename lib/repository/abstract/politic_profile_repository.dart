import '../../model/models.dart';

abstract class PoliticProfileRepository {
  Future<PoliticoModel> getInfoPolitic(String politicId);
}
