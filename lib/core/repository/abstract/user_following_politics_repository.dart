import '../../../core/domain/model/models.dart';

abstract class UserFollowingPoliticsRepository {
  Future<List<PoliticoModel>> getFollowingPolitics(String userId);
}
