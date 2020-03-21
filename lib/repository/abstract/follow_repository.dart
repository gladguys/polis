import '../../model/politico_model.dart';
import '../../model/user_model.dart';

abstract class FollowRepository {
  Future<void> followPolitic({UserModel user, PoliticoModel politico});
  Future<void> unfollowPolitic({UserModel user, PoliticoModel politico});
}
