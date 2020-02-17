import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../core/exception/exceptions.dart';
import '../../../core/exception/invalid_credentials_exception.dart';
import '../../../model/user_model.dart';
import '../../abstract/signin_repository.dart';
import 'collection.dart';

class FirebaseSigninRepository extends SigninRepository {
  FirebaseSigninRepository(
      {@required this.firebaseAuth, @required this.firestore})
      : assert(firebaseAuth != null),
        assert(firestore != null);

  final FirebaseAuth firebaseAuth;
  final Firestore firestore;
  final _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );
  CollectionReference get userRef => firestore.collection(USERS);

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
    final googleSignInAccount = await _googleSignIn.signIn();
    print(googleSignInAccount);
    return UserModel();
  }
}
