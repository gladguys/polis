import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../core/exception/exceptions.dart';
import '../../../model/models.dart';
import '../../abstract/timeline_repository.dart';
import '../../utils.dart';
import 'collection.dart';

class FirebaseTimelineRepository implements TimelineRepository {
  FirebaseTimelineRepository({@required this.firestore})
      : assert(firestore != null);

  final Firestore firestore;

  CollectionReference get timelineRef =>
      firestore.collection(TIMELINE_COLLECTION);

  @override
  Stream<List<dynamic>> getUserTimeline(String userId) {
    try {
      return timelineRef
          .document(userId)
          .collection(ATIVIDADES_TIMELINE_SUBCOLLECTION)
          .orderBy(DATA_DOCUMENTO_FIELD, descending: true)
          .snapshots()
          .map((snapshot) {
        final documents = snapshot.documents;
        final activities = [];
        for (var document in documents) {
          if (isDocumentDespesa(document.data)) {
            activities.add(DespesaModel.fromJson(document.data));
          } else {
            activities.add(PropostaModel.fromJson(document.data));
          }
        }
        return activities;
      });
    } on Exception {
      throw ComunicationException();
    }
  }
}
