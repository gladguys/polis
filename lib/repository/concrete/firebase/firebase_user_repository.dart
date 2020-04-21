import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../core/exception/exceptions.dart';
import '../../../model/models.dart';
import '../../abstract/user_repository.dart';
import 'collection.dart';

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
}
