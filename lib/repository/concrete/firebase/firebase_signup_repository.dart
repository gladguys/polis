import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import '../../../core/exception/exceptions.dart';
import '../../../model/user_model.dart';
import '../../abstract/signup_repository.dart';
import 'collection.dart';
import 'firebase_error_constants.dart';

class FirebaseSignupRepository extends SignupRepository {
  FirebaseSignupRepository(
      {@required this.firebaseAuth,
      @required this.firestore,
      @required this.storage})
      : assert(firebaseAuth != null),
        assert(firestore != null),
        assert(storage != null);

  final FirebaseAuth firebaseAuth;
  final Firestore firestore;
  final FirebaseStorage storage;
  CollectionReference get userRef => firestore.collection(USERS);

  @override
  Future<void> createUserWithEmailAndPassword(
      UserModel user, File profileImage) async {
    try {
      final authResult = await firebaseAuth.createUserWithEmailAndPassword(
          email: user.email, password: user.password);

      if (authResult != null && !await userExists(authResult.user.uid)) {
        String imageUrl;
        if (profileImage != null) {
          try {
            final storageReference =
                storage.ref().child(USERS).child(authResult.user.uid);
            await storageReference.putFile(profileImage).onComplete;
            imageUrl = await storageReference.getDownloadURL();
          } on Exception {
            throw UploadFileException();
          }
        }

        await createFirestoreUser(
          authResult.user.uid,
          user.copyWith(
            photoUrl: imageUrl,
            isFirstLoginDone: false,
          ),
        );
        return;
      }
    } on Exception catch (e) {
      if (e.toString().contains(ERROR_EMAIL_ALREADY_IN_USE)) {
        throw EmailAlreadyInUseException();
      } else if (e.toString().contains(ERROR_WEAK_PASSWORD)) {
        throw WeakPasswordException();
      } else if (e.toString().contains(ERROR_INVALID_EMAIL)) {
        throw InvalidEmailException();
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
