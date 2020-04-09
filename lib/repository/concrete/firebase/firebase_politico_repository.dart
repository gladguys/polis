import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../core/exception/exceptions.dart';
import '../../../model/models.dart';
import '../../abstract/politico_repository.dart';
import 'collection.dart';

class FirebasePoliticoRepository implements PoliticoRepository {
  FirebasePoliticoRepository({@required this.firestore})
      : assert(firestore != null);

  final Firestore firestore;

  CollectionReference get politicosRef =>
      firestore.collection(POLITICOS_COLLECTION);

  @override
  Future<List<PoliticoModel>> getAllPoliticos() async {
    try {
      final querySnapshot = await politicosRef.getDocuments();
      final documents = querySnapshot.documents;
      return List.generate(
          documents.length, (i) => PoliticoModel.fromJson(documents[i].data));
    } on Exception {
      throw ComunicationException();
    }
  }
}
