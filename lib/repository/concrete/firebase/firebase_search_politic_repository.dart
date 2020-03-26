import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../core/exception/exceptions.dart';
import '../../../model/politico_model.dart';
import '../../abstract/search_politic_repository.dart';
import 'collection.dart';

class FirebaseSearchPoliticRepository implements SearchPoliticRepository {
  FirebaseSearchPoliticRepository({@required this.firestore})
      : assert(firestore != null);

  final Firestore firestore;

  CollectionReference get politicosRef => firestore.collection(POLITICOS);

  @override
  Future<List<PoliticoModel>> getPoliticsByFilter() async {
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
