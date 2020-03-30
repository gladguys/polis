import '../../model/models.dart';

abstract class UserFollowingPoliticsRepository {
  Future<List<PoliticoModel>> getFollowingPolitics(String userId);
}
