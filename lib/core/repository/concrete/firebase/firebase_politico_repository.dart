import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diacritic/diacritic.dart';
import 'package:flutter/material.dart';

import '../../../../core/domain/model/models.dart';
import '../../../../core/exception/exceptions.dart';
import '../../abstract/repositories.dart';
import 'firebase.dart';

class FirebasePoliticoRepository implements PoliticoRepository {
  FirebasePoliticoRepository({@required this.firestore})
      : assert(firestore != null);

  final FirebaseFirestore firestore;

  CollectionReference get politicosRef =>
      firestore.collection(POLITICOS_COLLECTION);

  @override
  Future<List<PoliticoModel>> getAllPoliticos() async {
    try {
      final querySnapshot = await politicosRef.get();
      final documents = querySnapshot.docs;
      final politicos = List.generate(
          documents.length, (i) => PoliticoModel.fromJson(documents[i].data()));
      politicos.sort((p1, p2) => removeDiacritics(p1.nomeEleitoral)
          .compareTo(removeDiacritics(p2.nomeEleitoral)));
      return politicos;
    } on Exception {
      throw ComunicationException();
    }
  }
}
