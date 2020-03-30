import '../../model/models.dart';

abstract class FollowRepository {
  Future<void> followPolitic({UserModel user, PoliticoModel politico});
  Future<void> unfollowPolitic({UserModel user, PoliticoModel politico});
}
