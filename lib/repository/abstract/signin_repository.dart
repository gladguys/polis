import '../../model/user_model.dart';

abstract class SigninRepository {
  Future<UserModel> signInWithEmailAndPassword(String email, String password);
}
