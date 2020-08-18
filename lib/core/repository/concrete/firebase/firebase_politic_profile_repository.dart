import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';

import '../../../../core/domain/model/models.dart';
import '../../../../core/exception/exceptions.dart';
import '../../abstract/repositories.dart';
import '../../utils.dart';
import 'firebase.dart';

class FirebasePoliticProfileRepository implements PoliticProfileRepository {
  FirebasePoliticProfileRepository({@required this.firestore})
      : assert(firestore != null);

  final FirebaseFirestore firestore;

  CollectionReference get politicoRef =>
      firestore.collection(POLITICOS_COLLECTION);
  CollectionReference get atividadesRef =>
      firestore.collection(ATIVIDADES_COLLECTION);

  @override
  Future<PoliticoModel> getInfoPolitic(String politicId) async {
    try {
      final documentReference = politicoRef.doc(politicId);
      final documentSnapshot = await documentReference.get();
      return PoliticoModel.fromJson(documentSnapshot.data());
    } on Exception {
      throw ComunicationException();
    }
  }

  @override
  Future<Tuple2<List<dynamic>, DocumentSnapshot>> getLastActivities(
      {String politicId, int count}) async {
    try {
      final query = atividadesRef
          .doc(politicId)
          .collection(ATIVIDADES_POLITICO_SUBCOLLECTION)
          .orderBy(DATA_PUBLICACAO_FIELD, descending: true)
          .limit(count);

      final querySnapshot = await query.get();
      final activities = getActivitiesFromSnapshot(querySnapshot);
      final lastDocument =
          querySnapshot.docs.isNotEmpty ? querySnapshot.docs.last : null;

      return Tuple2<List<dynamic>, DocumentSnapshot>(
        activities,
        lastDocument,
      );
    } on Exception {
      throw ComunicationException();
    }
  }

  @override
  Future<Tuple2<List<dynamic>, DocumentSnapshot>> getMoreActivities(
      {String politicId, int count, DocumentSnapshot lastDocument}) async {
    try {
      final query = atividadesRef
          .doc(politicId)
          .collection(ATIVIDADES_POLITICO_SUBCOLLECTION)
          .orderBy(DATA_PUBLICACAO_FIELD, descending: true)
          .startAfterDocument(lastDocument)
          .limit(count);

      final querySnapshot = await query.get();
      final activities = getActivitiesFromSnapshot(querySnapshot);

      return Tuple2<List<dynamic>, DocumentSnapshot>(
        activities,
        querySnapshot.docs.isEmpty ? null : querySnapshot.docs?.last,
      );
    } on Exception {
      throw ComunicationException();
    }
  }

  List<dynamic> getActivitiesFromSnapshot(QuerySnapshot querySnapshot) {
    final activities = <dynamic>[];

    final documents = querySnapshot.docs;
    for (var document in documents) {
      if (isDocumentDespesa(document.data())) {
        final despesaModel = DespesaModel.fromJson(document.data());
        activities.add(despesaModel.copyWith(id: document.id));
      } else {
        final propostaModel = PropostaModel.fromJson(document.data());
        activities.add(
          propostaModel.copyWith(idPropostaPolitico: document.id),
        );
      }
    }
    return activities;
  }
}
