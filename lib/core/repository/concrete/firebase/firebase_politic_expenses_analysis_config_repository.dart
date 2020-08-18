import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../exception/exceptions.dart';
import '../../abstract/repositories.dart';
import 'firebase.dart';

class FirebasePoliticExpensesAnalysisConfigRepository
    implements PoliticExpensesAnalysisConfigRepository {
  FirebasePoliticExpensesAnalysisConfigRepository({@required this.firestore})
      : assert(firestore != null);

  final FirebaseFirestore firestore;

  CollectionReference get syncLogRef =>
      firestore.collection(SYNC_LOG_COLLECTION);

  @override
  Future<int> getExpensesBeginYear() async {
    try {
      final documentSnapshot = await syncLogRef.doc(INICIO_ANO_DESPESAS).get();
      return documentSnapshot.data()[VALUE];
    } on Exception {
      throw ComunicationException();
    }
  }
}
