import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../core/exception/exceptions.dart';
import '../../../model/models.dart';
import '../../abstract/user_profile_repository.dart';
import 'collection.dart';

class FirebaseUserProfileRepository implements UserProfileRepository {
  FirebaseUserProfileRepository({@required this.firestore})
      : assert(firestore != null);

  final Firestore firestore;
  CollectionReference get politicosSeguidosRef =>
      firestore.collection(POLITICOS_SEGUIDOS_COLLECTION);

  @override
  Future<List<PoliticoModel>> getPoliticsFollowing(String userId) async {
    try {
      final collectionRef = await politicosSeguidosRef
          .document(userId)
          .collection(POLITICOS_SEGUIDOS_SUBCOLLECTION);
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
