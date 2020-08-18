import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../domain/model/proposta_model.dart';
import '../../../exception/exceptions.dart';
import '../../abstract/politic_proposals_repository.dart';
import 'firebase.dart';

class FirebasePoliticProposalsRepository implements PoliticProposalsRepository {
  FirebasePoliticProposalsRepository({@required this.firestore})
      : assert(firestore != null);

  final FirebaseFirestore firestore;

  CollectionReference get atividadesRef =>
      firestore.collection(ATIVIDADES_COLLECTION);

  @override
  Future<List<PropostaModel>> getPoliticProposals(String politicId) async {
    try {
      final query = atividadesRef
          .doc(politicId)
          .collection(ATIVIDADES_POLITICO_SUBCOLLECTION)
          .where(TIPO_ATIVIDADE_FIELD, isEqualTo: 'PROPOSICAO')
          .where(DESCRICAO_TIPO_FIELD, isEqualTo: 'Projeto de Lei');
      final querySnapshot = await query.get();
      final documents = querySnapshot.docs;
      return List.generate(
          documents.length, (i) => PropostaModel.fromJson(documents[i].data()));
    } on Exception {
      throw ComunicationException();
    }
  }
}
