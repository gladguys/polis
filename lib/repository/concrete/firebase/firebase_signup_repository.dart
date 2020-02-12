import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../core/exception/exceptions.dart';
import '../../../model/user_model.dart';
import '../../abstract/signup_repository.dart';
import 'constant.dart';

class FirebaseSignupRepository extends SignupRepository {
  FirebaseSignupRepository({this.firebaseAuth, this.firestore});

  final FirebaseAuth firebaseAuth;
  final Firestore firestore;
  CollectionReference get userRef => firestore.collection('users');

  @override
  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      final authResult = await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);

      if (authResult != null) {
        await createUserFromAuth(authResult.user);
      }
      return null;
    } on Exception catch (e) {
      if (e.toString().contains(ERROR_EMAIL_ALREADY_IN_USE)) {
        throw EmailAlreadyInUseException();
      } else if (e.toString().contains(ERROR_WEAK_PASSWORD)) {
        throw WeakPasswordException();
      }
      rethrow;
    }
  }

  @override
  Future<UserModel> createUserFromAuth(FirebaseUser firebaseUser) async {
    try {
      final user = UserModel.userFromFirebase(firebaseUser);
      await userRef.document(user.userId).setData(user.toJson());
      return user;
    } on Exception {
      throw CreateUserFromGoogleException();
    }
  }
}
