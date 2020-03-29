import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';

import '../../../core/exception/exceptions.dart';
import '../../../model/despesa_model.dart';
import '../../../model/proposta_model.dart';
import '../../abstract/timeline_repository.dart';
import 'collection.dart';

class FirebaseTimelineRepository implements TimelineRepository {
  FirebaseTimelineRepository({@required this.firestore})
      : assert(firestore != null);

  final Firestore firestore;

  CollectionReference get timelineRef => firestore.collection(TIMELINE);

  @override
  Stream<Tuple2<List<DespesaModel>, List<PropostaModel>>> getUserTimeline(
      String userId) {
    try {
      return timelineRef
          .document(userId)
          .collection(ATIVIDADES_TIMELINE_COLLECTION)
          .snapshots()
          .map((snapshot) {
        final despesas = snapshot.documents
            .where(
                (document) => document.data[TIPO_ATIVIDADE_FIELD] == 'DESPESA')
            .map((document) => DespesaModel.fromJson(document.data))
            .toList();

        final propostas = snapshot.documents
            .where(
                (document) => document.data[TIPO_ATIVIDADE_FIELD] != 'DESPESA')
            .map((document) => PropostaModel.fromJson(document.data))
            .toList();

        return Tuple2<List<DespesaModel>, List<PropostaModel>>(
            despesas, propostas);
      });
    } on Exception {
      throw ComunicationException();
    }
  }
}
