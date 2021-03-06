import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../../core/exception/exceptions.dart';
import '../../abstract/sync_log_repository.dart';
import 'firebase.dart';

class FirebaseSyncLogRepository implements SyncLogRepository {
  FirebaseSyncLogRepository({@required this.firestore})
      : assert(firestore != null);

  final Firestore firestore;

  CollectionReference get syncLogRef =>
      firestore.collection(SYNC_LOG_COLLECTION);

  @override
  Future<String> getPartidoHash() async {
    try {
      final documentSnapshot = await syncLogRef.document(PARTIDO_SYNC).get();
      return documentSnapshot.data[HASH];
    } on Exception {
      throw ComunicationException();
    }
  }

  @override
  Future<String> getPoliticoHash() async {
    try {
      final documentSnapshot = await syncLogRef.document(POLITICO_SYNC).get();
      return documentSnapshot.data[HASH];
    } on Exception {
      throw ComunicationException();
    }
  }

  @override
  Future<String> getOrgaoHash() async {
    try {
      final documentSnapshot = await syncLogRef.document(ORGAO_SYNC).get();
      return documentSnapshot.data[HASH];
    } on Exception {
      throw ComunicationException();
    }
  }
}
