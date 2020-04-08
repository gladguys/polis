import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../core/exception/exceptions.dart';
import '../../../model/models.dart';
import '../../abstract/politic_profile_repository.dart';
import '../../utils.dart';
import 'collection.dart';

class FirebasePoliticProfileRepository implements PoliticProfileRepository {
  FirebasePoliticProfileRepository({@required this.firestore})
      : assert(firestore != null);

  final Firestore firestore;

  CollectionReference get politicoRef =>
      firestore.collection(POLITICOS_COLLECTION);
  CollectionReference get atividadesRef =>
      firestore.collection(ATIVIDADES_COLLECTION);

  @override
  Future<PoliticoModel> getInfoPolitic(String politicId) async {
    try {
      final documentReference = politicoRef.document(politicId);
      final documentSnapshot = await documentReference.get();
      return PoliticoModel.fromJson(documentSnapshot.data);
    } on Exception {
      throw ComunicationException();
    }
  }

  @override
  Future<List<dynamic>> getLastActivities({String politicId, int count}) async {
    final activities = [];

    try {
      final query = atividadesRef
          .document(politicId)
          .collection(ATIVIDADES_POLITICO_SUBCOLLECTION)
          .orderBy(DATA_DOCUMENTO_FIELD, descending: true)
          .limit(count);

      final querySnapshot = await query.getDocuments();
      final documents = querySnapshot.documents;
      for (var document in documents) {
        if (isDocumentDespesa(document.data)) {
          activities.add(DespesaModel.fromJson(document.data));
        } else {
          activities.add(PropostaModel.fromJson(document.data));
        }
      }
      return activities;
    } on Exception {
      throw ComunicationException();
    }
  }
}
