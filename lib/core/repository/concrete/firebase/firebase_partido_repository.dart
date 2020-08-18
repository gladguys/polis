import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../../core/domain/model/models.dart';
import '../../../../core/exception/exceptions.dart';
import '../../abstract/partido_repository.dart';
import 'firebase.dart';

class FirebasePartidoRepository implements PartidoRepository {
  FirebasePartidoRepository({@required this.firestore})
      : assert(firestore != null);

  final FirebaseFirestore firestore;

  CollectionReference get partidosRef =>
      firestore.collection(PARTIDOS_COLLECTION);

  @override
  Future<List<PartidoModel>> getAllPartidos() async {
    try {
      final querySnapshot = await partidosRef.get();
      final documents = querySnapshot.docs;
      return List.generate(
          documents.length,
          (i) =>
              PartidoModel.fromJson(documents[i].data as Map<String, dynamic>));
    } on Exception {
      throw ComunicationException();
    }
  }
}
