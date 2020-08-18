import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../domain/model/models.dart';
import '../../../exception/exceptions.dart';
import '../../abstract/politic_expenses_repository.dart';
import 'firebase.dart';

class FirebasePoliticExpensesRepository implements PoliticExpensesRepository {
  FirebasePoliticExpensesRepository({@required this.firestore})
      : assert(firestore != null);

  final FirebaseFirestore firestore;

  CollectionReference get atividadesRef =>
      firestore.collection(ATIVIDADES_COLLECTION);

  @override
  Future<List<DespesaModel>> getPoliticExpenses(String politicId) async {
    try {
      final query = atividadesRef
          .doc(politicId)
          .collection(ATIVIDADES_POLITICO_SUBCOLLECTION)
          .where(TIPO_ATIVIDADE_FIELD, isEqualTo: 'DESPESA')
          .orderBy(DATA_DOCUMENTO_FIELD, descending: true);
      final querySnapshot = await query.get();
      final documents = querySnapshot.docs;
      return List.generate(
          documents.length, (i) => DespesaModel.fromJson(documents[i].data()));
    } on Exception {
      throw ComunicationException();
    }
  }
}
