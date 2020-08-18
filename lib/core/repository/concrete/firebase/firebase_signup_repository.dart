import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/domain/enum/auth_provider.dart';
import '../../../../core/domain/model/models.dart';
import '../../../../core/exception/exceptions.dart';
import '../../abstract/signup_repository.dart';
import 'firebase.dart';
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
  final FirebaseFirestore firestore;
  final FirebaseStorage storage;

  CollectionReference get userRef => firestore.collection(USERS_COLLECTION);

  @override
  Future<void> createUserWithEmailAndPassword(
      UserModel user, File profileImage) async {
    UserCredential userCredential;
    try {
      userCredential = await firebaseAuth.createUserWithEmailAndPassword(
          email: user.email, password: user.password);

      if (userCredential != null &&
          !await userExists(userCredential.user.uid)) {
        String imageUrl;
        if (profileImage != null) {
          try {
            final storageReference = storage
                .ref()
                .child(USERS_COLLECTION)
                .child(userCredential.user.uid)
                .child(Uuid().v1());
            await storageReference.putFile(profileImage).onComplete;
            imageUrl = await storageReference.getDownloadURL();
          } on Exception {
            throw UploadFileException();
          }
        }

        await createFirestoreUser(
          userCredential.user.uid,
          user.copyWith(
            photoUrl: imageUrl,
            authProvider: AuthProvider.emailAndPassword,
          ),
        );
        return;
      }
    } on Exception catch (e) {
      await userCredential?.user?.delete();
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
      final doc = await userRef.doc(uid).get();
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
      photoUrl: user.photoUrl,
      isFirstLoginDone: false,
    );

    try {
      await userRef.doc(userToSave.userId).set(userToSave.toJson());
      return user;
    } on Exception {
      throw ComunicationException();
    }
  }
}
