import '../../model/models.dart';

abstract class FollowRepository {
  Future<bool> isPoliticBeingFollowed({UserModel user, String politicId});
  Future<void> followPolitic({UserModel user, PoliticoModel politico});
  Future<void> unfollowPolitic({UserModel user, PoliticoModel politico});
}
