import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../../core/domain/model/models.dart';
import '../../../../core/exception/exceptions.dart';
import '../../abstract/repositories.dart';
import 'firebase.dart';

class FirebasePoliticoRepository implements PoliticoRepository {
  FirebasePoliticoRepository({@required this.firestore})
      : assert(firestore != null);

  final Firestore firestore;

  CollectionReference get politicosRef =>
      firestore.collection(POLITICOS_COLLECTION);

  @override
  Future<List<PoliticoModel>> getAllPoliticos() async {
    try {
      final querySnapshot =
          await politicosRef.orderBy(NOME_ELEITORAL_FIELD).getDocuments();
      final documents = querySnapshot.documents;
      return List.generate(
          documents.length, (i) => PoliticoModel.fromJson(documents[i].data));
    } on Exception {
      throw ComunicationException();
    }
  }
}
