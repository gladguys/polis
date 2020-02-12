import 'package:firebase_auth/firebase_auth.dart';

import '../../model/user_model.dart';

abstract class SignupRepository {
  Future<void> createUserWithEmailAndPassword(String email, String password);
  Future<UserModel> createUserFromAuth(FirebaseUser firebaseUser);
}
