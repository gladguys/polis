import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../core/domain/model/models.dart';
import '../../../../core/exception/exceptions.dart';
import '../../abstract/user_repository.dart';
import 'firebase.dart';

class FirebaseUserRepository implements UserRepository {
  FirebaseUserRepository(
      {@required this.firebaseAuth,
      @required this.googleSignIn,
      @required this.firestore})
      : assert(firebaseAuth != null),
        assert(googleSignIn != null),
        assert(firestore != null);

  final FirebaseAuth firebaseAuth;
  final GoogleSignIn googleSignIn;
  final Firestore firestore;

  CollectionReference get userRef => firestore.collection(USERS_COLLECTION);

  @override
  Future<void> signOut() async {
    try {
      await googleSignIn.signOut();
      await firebaseAuth.signOut();
    } on Exception {
      throw SignOutException();
    }
  }

  @override
  Future<void> setFirstLoginDone(UserModel user) async {
    final userWithFirstLoginDone = user.copyWith(isFirstLoginDone: true);
    try {
      await userRef
          .document(user.userId)
          .setData(userWithFirstLoginDone.toJson());
    } on Exception {
      throw ComunicationException();
    }
  }

  @override
  Future<void> saveUserComments(
      {UserModel user, Map<String, bool> comments}) async {
    try {
      await userRef.document(user.userId).updateData({
        USER_COMMENTS_FIELD: comments,
      });
    } on Exception {
      throw ComunicationException();
    }
  }
}
