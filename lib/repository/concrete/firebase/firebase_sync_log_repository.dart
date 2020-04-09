import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../abstract/sync_log_repository.dart';
import 'collection.dart';

class FirebaseSyncLogRepository implements SyncLogRepository {
  FirebaseSyncLogRepository({@required this.firestore})
      : assert(firestore != null);

  final Firestore firestore;

  CollectionReference get syncLogRef =>
      firestore.collection(SYNC_LOG_COLLECTION);

  @override
  Future<String> getPartidoHash() async {
    final documentSnapshot = await syncLogRef.document(PARTIDO_SYNC).get();
    return documentSnapshot.data[HASH];
  }

  @override
  Future<String> getPoliticoHash() async {
    final documentSnapshot = await syncLogRef.document(POLITICO_SYNC).get();
    return documentSnapshot.data[HASH];
  }
}
