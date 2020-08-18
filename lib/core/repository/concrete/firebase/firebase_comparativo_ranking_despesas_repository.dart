import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../domain/model/models.dart';
import '../../../exception/exceptions.dart';
import '../../abstract/repositories.dart';
import 'firebase.dart';

class FirebaseComparativoRankingDespesasRepository
    implements ComparativoRankingDespesasRepository {
  FirebaseComparativoRankingDespesasRepository({@required this.firestore})
      : assert(firestore != null);

  final FirebaseFirestore firestore;

  CollectionReference get resultadosRankingRef =>
      firestore.collection(RESULTADOS_RANKING_COLLECTION);

  @override
  Future<ResultadosRankingModel> getRankingResults() async {
    try {
      final documentRef = resultadosRankingRef.doc(RANKING);
      final documentSnapshot = await documentRef.get();
      return ResultadosRankingModel.fromJson(documentSnapshot.data());
    } on Exception {
      throw ComunicationException();
    }
  }
}
