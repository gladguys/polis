import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../domain/model/models.dart';
import '../../../exception/exceptions.dart';
import '../../abstract/repositories.dart';
import 'firebase.dart';

class FirebaseResultadosRankingRepository
    implements ResultadosRankingRepository {
  FirebaseResultadosRankingRepository({@required this.firestore})
      : assert(firestore != null);

  final Firestore firestore;

  CollectionReference get resultadosRankingRef =>
      firestore.collection(RESULTADOS_RANKING_COLLECTION);

  @override
  Future<ResultadosRankingModel> getRankingResults() async {
    try {
      final documentRef = resultadosRankingRef.document(RANKING);
      final documentSnapshot = await documentRef.get();
      return ResultadosRankingModel.fromJson(documentSnapshot.data);
    } on Exception {
      throw ComunicationException();
    }
  }
}
