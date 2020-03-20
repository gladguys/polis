import '../../model/politico_model.dart';

abstract class UserFollowingPoliticsRepository {
  Future<List<PoliticoModel>> getFollowingPolitics(String userId);
}
