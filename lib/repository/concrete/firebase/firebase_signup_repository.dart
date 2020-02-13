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
  Future<void> createUserWithEmailAndPassword(UserModel user) async {
    try {
      final authResult = await firebaseAuth.createUserWithEmailAndPassword(
          email: user.email, password: user.password);

      if (authResult != null) {
        await createFirestoreUser(authResult.user.uid, user);
      }
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
  Future<UserModel> createFirestoreUser(String uid, UserModel user) async {
    final userToSave = UserModel(
        userId: uid,
        name: user.name,
        email: user.email,
        photoUrl: user.photoUrl);

    try {
      await userRef.document(userToSave.userId).setData(userToSave.toJson());
      return user;
    } on Exception {
      throw ComunicationException();
    }
  }
}
