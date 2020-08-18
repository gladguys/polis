import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/abstract/polis_google_auth_provider.dart';
import '../../../../core/domain/enum/auth_provider.dart';
import '../../../../core/domain/model/models.dart';
import '../../../../core/exception/exceptions.dart';
import '../../abstract/signin_repository.dart';
import 'firebase.dart';
import 'firebase_error_constants.dart';

class FirebaseSigninRepository extends SigninRepository {
  FirebaseSigninRepository(
      {@required this.firebaseAuth,
      @required this.firestore,
      @required this.googleSignin,
      @required this.polisGoogleAuthProvider})
      : assert(firebaseAuth != null),
        assert(firestore != null),
        assert(googleSignin != null),
        assert(polisGoogleAuthProvider != null);

  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firestore;
  final GoogleSignIn googleSignin;
  final PolisGoogleAuthProvider polisGoogleAuthProvider;

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
    } on Exception catch (e) {
      if (e.toString().contains(ERROR_INVALID_EMAIL)) {
        throw InvalidCredentialsException();
      } else if (e.toString().contains(ERROR_WRONG_PASSWORD)) {
        throw InvalidCredentialsException();
      } else if (e.toString().contains(ERROR_USER_NOT_FOUND)) {
        throw InvalidCredentialsException();
      }
      rethrow;
    }
  }

  @override
  Future<UserModel> getUserById(String userId) async {
    try {
      final userDocument = await userRef.doc(userId).get();
      return userDocument.exists
          ? UserModel.fromJson(userDocument.data())
          : null;
    } on Exception {
      throw ComunicationException();
    }
  }

  @override
  Future<UserModel> signInWithGoogle() async {
    try {
      final googleSignInAccount = await googleSignin.signIn();

      if (googleSignInAccount != null) {
        final googleSignInAuthentication =
            await googleSignInAccount.authentication;

        final credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        await firebaseAuth.signInWithCredential(credential);

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
            isFirstLoginDone: false,
            authProvider: AuthProvider.google,
          );
          await _createUserOnFirestore(userToCreate);
          return userToCreate;
        }
      } else {
        throw GoogleSigninException();
      }
    } on Exception {
      throw ComunicationException();
    }
  }

  Future<UserModel> _createUserOnFirestore(UserModel user) async {
    try {
      await userRef.doc(user.userId).set(user.toJson());
      return user;
    } on Exception {
      throw ComunicationException();
    }
  }

  @override
  Future<UserModel> getUserByEmail(String email) async {
    try {
      final query = await userRef.where('email', isEqualTo: email);
      final querySnapshot = await query.get();
      final documents = querySnapshot.docs;

      return documents.isNotEmpty
          ? UserModel.fromJson(documents[0].data())
          : null;
    } on Exception {
      throw ComunicationException();
    }
  }

  @override
  Future<void> sendResetEmail(String email) async {
    try {
      await firebaseAuth.sendPasswordResetEmail(email: email);
    } on Exception {
      throw ComunicationException();
    }
  }
}
