import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../core/exception/exceptions.dart';
import '../../../model/models.dart';
import '../../abstract/user_profile_repository.dart';
import 'firebase.dart';

class FirebaseUserProfileRepository implements UserProfileRepository {
  FirebaseUserProfileRepository({@required this.firestore})
      : assert(firestore != null);

  final Firestore firestore;

  CollectionReference get politicosSeguidosRef =>
      firestore.collection(POLITICOS_SEGUIDOS_COLLECTION);
  CollectionReference get acoesRef => firestore.collection(ACOES_COLLECTION);

  @override
  Future<List<PoliticoModel>> getPoliticsFollowing(String userId) async {
    try {
      final collectionRef = await politicosSeguidosRef
          .document(userId)
          .collection(POLITICOS_SEGUIDOS_SUBCOLLECTION);
      final querySnapshot =
          await collectionRef.getDocuments(source: Source.cache);
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
      final querySnapshot =
          await collectionRef.getDocuments(source: Source.cache);
      final documents = querySnapshot.documents;
      return List.generate(
        documents.length,
        (i) => AcaoUsuarioModel.fromJson(documents[i].data),
      );
    } on Exception {
      throw ComunicationException();
    }
  }
}
