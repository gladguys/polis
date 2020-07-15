import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../../core/domain/model/models.dart';
import '../../../../core/exception/exceptions.dart';
import '../../../domain/enum/post_type.dart';
import '../../abstract/user_profile_repository.dart';
import 'firebase.dart';

class FirebaseUserProfileRepository implements UserProfileRepository {
  FirebaseUserProfileRepository({@required this.firestore})
      : assert(firestore != null);

  final Firestore firestore;

  CollectionReference get politicosSeguidosRef =>
      firestore.collection(POLITICOS_SEGUIDOS_COLLECTION);
  CollectionReference get acoesRef => firestore.collection(ACOES_COLLECTION);
  CollectionReference get atividadesRef =>
      firestore.collection(ATIVIDADES_COLLECTION);

  @override
  Future<List<PoliticoModel>> getPoliticsFollowing(String userId) async {
    try {
      final collectionRef = await politicosSeguidosRef
          .document(userId)
          .collection(POLITICOS_SEGUIDOS_SUBCOLLECTION);
      final querySnapshot = await collectionRef.getDocuments();
      final documents = querySnapshot.documents;
      return List.generate(
          documents.length, (i) => PoliticoModel.fromJson(documents[i].data));
    } on Exception {
      throw ComunicationException();
    }
  }

  @override
  Future<List<AcaoUsuarioModel>> getUserActions(String userId) async {
    try {
      final collectionRef = await acoesRef
          .document(userId)
          .collection(ACOES_USUARIO_SUBCOLLECTION)
          .orderBy(DATA_ACAO, descending: true);
      final querySnapshot = await collectionRef.getDocuments();
      final documents = querySnapshot.documents;
      return List.generate(documents.length,
          (i) => AcaoUsuarioModel.fromJson(documents[i].data));
    } on Exception {
      throw ComunicationException();
    }
  }

  @override
  Future<dynamic> getPostInfo(
      {String postId, String politicoId, PostType postType}) async {
    try {
      final docReference = await atividadesRef
          .document(politicoId)
          .collection(ATIVIDADES_POLITICO_SUBCOLLECTION)
          .document(postId)
          .get();

      if (postType == PostType.PROPOSICAO) {
        return PropostaModel.fromJson(docReference.data);
      } else {
        return DespesaModel.fromJson(docReference.data);
      }
    } on Exception {
      throw ComunicationException();
    }
  }
}
