import 'package:google_sign_in/google_sign_in.dart';

import '../../model/user_model.dart';

abstract class SigninRepository {
  Future<UserModel> signInWithEmailAndPassword(String email, String password);
  Future<UserModel> signInWithGoogle();
  Future<UserModel> getUserById(String userId);
  Future<UserModel> createUserFromGoogle(
      GoogleSignInAccount googleSignInAccount);
}
