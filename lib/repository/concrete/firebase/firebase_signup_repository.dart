import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:polis/core/exception/exceptions.dart';
import 'package:polis/model/user_model.dart';
import 'package:polis/repository/abstract/signup_repository.dart';

import 'constant.dart';

class FirebaseSignupRepository extends SignupRepository {
  FirebaseSignupRepository(this._firebaseAuth);

  final FirebaseAuth _firebaseAuth;
  final userRef = Firestore.instance.collection('users');

  @override
  Future<UserModel> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      final authResult = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);

      if (authResult != null) {
        return UserModel();
      }
      return null;
    } catch (e) {
      if (e.toString().contains(ERROR_EMAIL_ALREADY_IN_USE)) {
        throw EmailAlreadyInUseException();
      } else {
        throw WeakPasswordException();
      }
    }
  }
}
