import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../core/exception/comunication_exception.dart';
import '../../../model/politico_model.dart';
import '../../abstract/user_profile_repository.dart';
import 'collection.dart';

class FirebaseUserProfileRepository implements UserProfileRepository {
  FirebaseUserProfileRepository({@required this.firestore})
      : assert(firestore != null);

  final Firestore firestore;
  CollectionReference get followingRef => firestore.collection(FOLLOWING);

  @override
  Future<List<PoliticoModel>> getPoliticsFollowing(String userId) async {
    try {
      final collectionRef =
          await followingRef.document(userId).collection(POLITICOS_FOLLOWING);
      final querySnapshot = await collectionRef.getDocuments();
      final documents = querySnapshot.documents;
      return List.generate(
          documents.length, (i) => PoliticoModel.fromJson(documents[i].data));
    } on Exception {
      throw ComunicationException();
    }
  }

  @override
  Future<List> getUserActivities(String userId) async {
    return [];
  }
}
