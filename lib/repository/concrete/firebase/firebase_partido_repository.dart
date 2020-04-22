import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../core/exception/exceptions.dart';
import '../../../model/models.dart';
import '../../abstract/partido_repository.dart';
import 'firebase.dart';

class FirebasePartidoRepository implements PartidoRepository {
  FirebasePartidoRepository({@required this.firestore})
      : assert(firestore != null);

  final Firestore firestore;

  CollectionReference get partidosRef =>
      firestore.collection(PARTIDOS_COLLECTION);

  @override
  Future<List<PartidoModel>> getAllPartidos() async {
    try {
      final querySnapshot = await partidosRef.getDocuments();
      final documents = querySnapshot.documents;
      return List.generate(
          documents.length, (i) => PartidoModel.fromJson(documents[i].data));
    } on Exception {
      throw ComunicationException();
    }
  }
}
