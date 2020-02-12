import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../model/user_model.dart';
import '../../abstract/signin_repository.dart';

class FirebaseSigninRepository extends SigninRepository {
  FirebaseSigninRepository(this._firebaseAuth);

  final FirebaseAuth _firebaseAuth;
  final CollectionReference userRef = Firestore.instance.collection('users');

  @override
  Future<UserModel> signInWithEmailAndPassword(
      String email, String password) async {
    final authResult = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);

    if (authResult != null) {
      return UserModel();
    }
    return null;
  }
}
