import '../../../core/domain/model/models.dart';

abstract class SigninRepository {
  Future<UserModel> signInWithEmailAndPassword(String email, String password);
  Future<UserModel> signInWithGoogle();
  Future<UserModel> getUserById(String userId);
  Future<UserModel> getUserByEmail(String email);
  Future<void> sendResetEmail(String email);
}
