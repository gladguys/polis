import '../../model/user_model.dart';

abstract class SignupRepository {
  Future<UserModel> createUserWithEmailAndPassword(
      String email, String password);
}
