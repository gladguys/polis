import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../core/exception/exceptions.dart';
import '../../../model/models.dart';
import '../../abstract/search_politic_repository.dart';
import 'collection.dart';

class FirebaseSearchPoliticRepository implements SearchPoliticRepository {
  FirebaseSearchPoliticRepository({@required this.firestore})
      : assert(firestore != null);

  final Firestore firestore;

  CollectionReference get politicosRef =>
      firestore.collection(POLITICOS_COLLECTION);
  CollectionReference get politicosSeguidosRef =>
      firestore.collection(POLITICOS_SEGUIDOS_COLLECTION);

  @override
  Future<List<PoliticoModel>> getAllPolitics() async {
    try {
      final querySnapshot = await politicosRef.getDocuments();
      final documents = querySnapshot.documents;
      return List.generate(
          documents.length, (i) => PoliticoModel.fromJson(documents[i].data));
    } on Exception {
      throw ComunicationException();
    }
  }

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
}
