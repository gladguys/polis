import '../../../core/domain/model/models.dart';

abstract class UserRepository {
  Future<void> signOut();
  Future<void> setFirstLoginDone(UserModel user);
  Future<void> updateUserConfigs(UserModel user);
}
