import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../core/exception/exceptions.dart';
import '../../../core/exception/invalid_credentials_exception.dart';
import '../../../model/user_model.dart';
import '../../abstract/signin_repository.dart';
import 'collection.dart';

class FirebaseSigninRepository extends SigninRepository {
  FirebaseSigninRepository({this.firebaseAuth});

  final FirebaseAuth firebaseAuth;
  final CollectionReference userRef = Firestore.instance.collection(USERS);

  @override
  Future<UserModel> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      final authResult = await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      if (authResult != null) {
        final user = await getUserById(authResult.user.uid);
        if (user == null) {
          throw UserDeletedException();
        }
        return user;
      }
      return null;
    } on Exception {
      throw InvalidCredentialsException();
    }
  }

  @override
  Future<UserModel> getUserById(String userId) async {
    try {
      final userDocument = await userRef.document(userId).get();
      return userDocument.exists ? UserModel.fromJson(userDocument.data) : null;
    } on Exception {
      throw ComunicationException();
    }
  }
}
