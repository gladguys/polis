import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../core/exception/exceptions.dart';
import '../../../model/user_model.dart';
import '../../abstract/signup_repository.dart';
import 'collection.dart';
import 'firebase_error_constants.dart';

class FirebaseSignupRepository extends SignupRepository {
  FirebaseSignupRepository(
      {@required this.firebaseAuth, @required this.firestore})
      : assert(firebaseAuth != null),
        assert(firestore != null);

  final FirebaseAuth firebaseAuth;
  final Firestore firestore;
  CollectionReference get userRef => firestore.collection(USERS);

  @override
  Future<void> createUserWithEmailAndPassword(UserModel user) async {
    try {
      final authResult = await firebaseAuth.createUserWithEmailAndPassword(
          email: user.email, password: user.password);
      print(authResult);
      if (authResult != null && !await userExists(authResult.user.uid)) {
        await createFirestoreUser(authResult.user.uid, user);
        return;
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
  Future<bool> userExists(String uid) async {
    try {
      final doc = await userRef.document(uid).get();
      return doc.exists;
    } on Exception {
      throw ComunicationException();
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
