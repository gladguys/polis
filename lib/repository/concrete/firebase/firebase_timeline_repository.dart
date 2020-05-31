import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';

import '../../../core/exception/exceptions.dart';
import '../../../model/models.dart';
import '../../abstract/timeline_repository.dart';
import '../../utils.dart';
import 'firebase.dart';

class FirebaseTimelineRepository implements TimelineRepository {
  FirebaseTimelineRepository({@required this.firestore})
      : assert(firestore != null);

  final Firestore firestore;

  CollectionReference get timelineRef =>
      firestore.collection(TIMELINE_COLLECTION);

  @override
  Stream<int> getNewActivitiesCounter(String userId) {
    try {
      return timelineRef
          .document(userId)
          .collection(ATIVIDADES_TIMELINE_SUBCOLLECTION)
          .orderBy(DATA_ATUALIZACAO_FIELD, descending: true)
          .snapshots()
          .map((snapshot) {
        var changes = 0;
        final documentChanges = snapshot.documentChanges;
        for (var change in documentChanges) {
          if (change.type == DocumentChangeType.added) {
            changes += 1;
          }
        }
        return changes;
      });
    } on Exception {
      throw ComunicationException();
    }
  }

  @override
  Future<Tuple2<List<dynamic>, DocumentSnapshot>> getTimelineFirstPosts(
      String userId, int count) async {
    try {
      final query = await timelineRef
          .document(userId)
          .collection(ATIVIDADES_TIMELINE_SUBCOLLECTION)
          .orderBy(DATA_ATUALIZACAO_FIELD, descending: true)
          .limit(count);

      final querySnapshot = await query.getDocuments(source: Source.cache);
      final activities = getActivitiesFromSnapshot(querySnapshot);
      final documentsSnapshot = querySnapshot.documents;

      return Tuple2<List<dynamic>, DocumentSnapshot>(
        activities,
        documentsSnapshot.isNotEmpty ? querySnapshot.documents.last : null,
      );
    } on Exception {
      throw ComunicationException();
    }
  }

  @override
  Future<Tuple2<List, DocumentSnapshot>> getMorePosts(
      String userId, int count, DocumentSnapshot lastDocument) async {
    try {
      final query = await timelineRef
          .document(userId)
          .collection(ATIVIDADES_TIMELINE_SUBCOLLECTION)
          .orderBy(DATA_ATUALIZACAO_FIELD, descending: true)
          .startAfterDocument(lastDocument)
          .limit(count);

      final querySnapshot = await query.getDocuments(source: Source.cache);
      final activities = getActivitiesFromSnapshot(querySnapshot);
      final documentsSnapshot = querySnapshot.documents;

      return Tuple2<List<dynamic>, DocumentSnapshot>(
        activities,
        documentsSnapshot.isNotEmpty
            ? querySnapshot.documents.last
            : lastDocument,
      );
    } on Exception {
      throw ComunicationException();
    }
  }

  List<dynamic> getActivitiesFromSnapshot(QuerySnapshot querySnapshot) {
    final activities = <dynamic>[];

    final documents = querySnapshot.documents;
    for (var document in documents) {
      if (isDocumentDespesa(document.data)) {
        final despesaModel = DespesaModel.fromJson(document.data);
        activities.add(despesaModel.copyWith(id: document.documentID));
      } else {
        final propostaModel = PropostaModel.fromJson(document.data);
        activities.add(
          propostaModel.copyWith(idPropostaPolitico: document.documentID),
        );
      }
    }
    return activities;
  }
}
