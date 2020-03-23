import '../../model/user_model.dart';

abstract class UserRepository {
  Future<void> signOut();
  Future<void> setFirstLoginDone(UserModel user);
}
