import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../../core/domain/model/models.dart';
import '../../../../core/exception/exceptions.dart';
import '../../abstract/repositories.dart';
import 'firebase.dart';

class FirebasePoliticSuggestionRepository
    implements PoliticSuggestionRepository {
  FirebasePoliticSuggestionRepository({@required this.firestore})
      : assert(firestore != null);

  final Firestore firestore;

  CollectionReference get politicosRef =>
      firestore.collection(POLITICOS_COLLECTION);
  CollectionReference get politicosSeguidosRef =>
      firestore.collection(POLITICOS_SEGUIDOS_COLLECTION);
  CollectionReference get usuariosSeguindoRef =>
      firestore.collection(USUARIOS_SEGUINDO_COLLECTION);

  @override
  Future<List<PoliticoModel>> getSuggestedPolitics(String stateOption) async {
    try {
      final querySnapshot = stateOption == 'T'
          ? await politicosRef.getDocuments()
          : await politicosRef
              .where(SIGLA_UF_FIELD, isEqualTo: stateOption)
              .getDocuments();

      final documents = querySnapshot.documents;
      return List.generate(
          documents.length, (i) => PoliticoModel.fromJson(documents[i].data));
    } on Exception {
      throw ComunicationException();
    }
  }

  @override
  Future<void> savePoliticsToFollow(
      {String userId, List<PoliticoModel> politics}) async {
    try {
      final listPoliticsToFollow =
          List.generate(politics.length, (i) => politics[i].toJson());

      for (var politic in listPoliticsToFollow) {
        await politicosSeguidosRef
            .document(userId)
            .collection(POLITICOS_SEGUIDOS_SUBCOLLECTION)
            .document(politic[ID_FIELD])
            .setData(politic);
      }
    } on Exception {
      throw ComunicationException();
    }
  }

  @override
  Future<void> saveFollowerToPolitics(
      {UserModel user, List<PoliticoModel> politics}) async {
    try {
      for (var politic in politics) {
        await usuariosSeguindoRef
            .document(politic.id)
            .collection(USUARIOS_SEGUINDO_SUBCOLLECTION)
            .document(user.userId)
            .setData(user.toJson());
      }
    } on Exception {
      throw ComunicationException();
    }
  }
}
