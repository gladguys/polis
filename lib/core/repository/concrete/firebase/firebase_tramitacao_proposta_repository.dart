import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../../core/domain/model/tramitacao_proposta_model.dart';
import '../../../../core/exception/exceptions.dart';
import '../../abstract/tramitacao_proposta_repository.dart';
import 'firebase.dart';

class FirebaseTramitacaoPropostaRepository
    implements TramitacaoPropostaRepository {
  FirebaseTramitacaoPropostaRepository({@required this.firestore})
      : assert(firestore != null);

  final FirebaseFirestore firestore;

  CollectionReference get tramitacoesRef =>
      firestore.collection(TRAMITACOES_COLLECTION);

  @override
  Future<List<TramitacaoPropostaModel>> getTramitacoesProposta(
      String propostaId) async {
    try {
      final querySnapshot = await tramitacoesRef
          .doc(propostaId)
          .collection(TRAMITACOES_PROPOSICAO_SUBCOLLECTION)
          .orderBy(SEQUENCIA_FIELD, descending: true)
          .get();
      final documents = querySnapshot.docs;
      return List.generate(documents.length,
          (i) => TramitacaoPropostaModel.fromJson(documents[i].data()));
    } on Exception {
      throw ComunicationException();
    }
  }
}
