import '../../model/user_model.dart';

abstract class SignupRepository {
  Future<void> createUserWithEmailAndPassword(UserModel user);
  Future<UserModel> createFirestoreUser(String uid, UserModel user);
  Future<bool> userExists(String uid);
}
