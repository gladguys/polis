import '../../model/models.dart';

abstract class PoliticProfileRepository {
  Future<PoliticoModel> getInfoPolitic(String politicId);
  Future<List<dynamic>> getLastActivities({String politicId, int count});
}
