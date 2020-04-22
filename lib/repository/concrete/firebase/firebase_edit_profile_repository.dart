import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import '../../../core/exception/exceptions.dart';
import '../../../model/user_model.dart';
import '../../abstract/edit_profile_repository.dart';
import 'firebase.dart';

class FirebaseEditProfileRepository implements EditProfileRepository {
  FirebaseEditProfileRepository(
      {@required this.firestore,
      @required this.firebaseAuth,
      @required this.firebaseStorage})
      : assert(firestore != null),
        assert(firebaseAuth != null),
        assert(firebaseStorage != null);

  final Firestore firestore;
  final FirebaseAuth firebaseAuth;
  final FirebaseStorage firebaseStorage;

  CollectionReference get userRef => firestore.collection(USERS_COLLECTION);

  @override
  Future<UserModel> updateUserInfo(
      {UserModel currentUser,
      String name,
      String email,
      File pickedPhoto}) async {
    String imageUrl;
    if (pickedPhoto != null) {
      try {
        final storageReference = firebaseStorage
            .ref()
            .child(USERS_COLLECTION)
            .child(currentUser.userId);
        await storageReference.putFile(pickedPhoto).onComplete;
        imageUrl = await storageReference.getDownloadURL();
      } on Exception {
        throw UploadFileException();
      }
    }
    try {
      UserModel userToSave;
      if (imageUrl != null) {
        userToSave = currentUser.copyWith(
          name: name,
          email: email,
          photoUrl: imageUrl,
        );
      } else {
        userToSave = currentUser.copyWith(
          name: name,
          email: email,
        );
      }
      await userRef.document(currentUser.userId).setData(userToSave.toJson());
      return userToSave;
    } on Exception {
      throw ComunicationException();
    }
  }
}
