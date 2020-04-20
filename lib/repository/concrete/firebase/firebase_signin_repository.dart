import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:uuid/uuid.dart';

import '../../../core/exception/exceptions.dart';
import '../../../model/models.dart';
import '../../abstract/signin_repository.dart';
import 'collection.dart';

class FirebaseSigninRepository extends SigninRepository {
  FirebaseSigninRepository(
      {@required this.firebaseAuth,
      @required this.firestore,
      @required this.googleSignin})
      : assert(firebaseAuth != null),
        assert(firestore != null),
        assert(googleSignin != null);

  final FirebaseAuth firebaseAuth;
  final Firestore firestore;
  final GoogleSignIn googleSignin;
  CollectionReference get userRef => firestore.collection(USERS_COLLECTION);

  @override
  Future<UserModel> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      final authResult = await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      if (authResult != null) {
        return await getUserById(authResult.user.uid);
      }
      return null;
    } on ComunicationException {
      rethrow;
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

  @override
  Future<UserModel> signInWithGoogle() async {
    final googleSignInAccount = await googleSignin.signIn();
    if (googleSignInAccount != null) {
      final userCreatedPreviously =
          await getUserByEmail(googleSignInAccount.email);
      if (userCreatedPreviously != null) {
        return userCreatedPreviously;
      } else {
        final userToCreate = UserModel(
          userId: Uuid().v1(),
          name: googleSignInAccount.displayName,
          email: googleSignInAccount.email,
          photoUrl: googleSignInAccount.photoUrl,
        );
        await _createUserOnFirestore(userToCreate);
        return userToCreate;
      }
    } else {
      throw GoogleSigninException();
    }
  }

  Future<UserModel> _createUserOnFirestore(UserModel user) async {
    try {
      await userRef.document(user.userId).setData(user.toJson());
      return user;
    } on Exception {
      throw ComunicationException();
    }
  }

  @override
  Future<UserModel> getUserByEmail(String email) async {
    try {
      final query = await userRef.where('email', isEqualTo: email);
      final querySnapshot = await query.getDocuments();
      final documents = querySnapshot.documents;

      return documents.isNotEmpty
          ? UserModel.fromJson(documents[0].data)
          : null;
    } on Exception {
      throw ComunicationException();
    }
  }

  @override
  Future<void> sendResetEmail(String email) async {
    await firebaseAuth.sendPasswordResetEmail(email: email);
  }
}
