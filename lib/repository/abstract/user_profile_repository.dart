import '../../model/models.dart';

abstract class UserProfileRepository {
  Future<List<PoliticoModel>> getPoliticsFollowing(String userId);
  Future<List<dynamic>> getUserActivities(String userId);
}
