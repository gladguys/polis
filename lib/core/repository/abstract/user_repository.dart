import '../../../core/domain/model/models.dart';

abstract class UserRepository {
  Future<void> signOut();
  Future<void> setFirstLoginDone(UserModel user);
  Future<void> saveUserComments({UserModel user, Map<String, bool> comments});
  Future<void> updateUserConfigs(UserModel user);
}
