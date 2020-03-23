import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../core/exception/exceptions.dart';
import '../../../model/politico_model.dart';
import '../../../model/user_model.dart';
import '../../abstract/politic_suggestion_repository.dart';
import '../../abstract/user_info_repository.dart';
import 'collection.dart';

class FirebasePoliticSuggestionRepository
    implements PoliticSuggestionRepository {
  FirebasePoliticSuggestionRepository(
      {@required this.firestore, @required this.userInfoRepository})
      : assert(firestore != null),
        assert(userInfoRepository != null);

  final Firestore firestore;
  final UserInfoRepository userInfoRepository;

  CollectionReference get politicosRef => firestore.collection(POLITICOS);
  CollectionReference get politicosSeguidosRef =>
      firestore.collection(POLITICOS_SEGUIDOS);
  CollectionReference get usuariosSeguindoRef =>
      firestore.collection(USUARIOS_SEGUINDO);

  @override
  Future<List<PoliticoModel>> getSuggestedPolitics() async {
    try {
      final userInfo = await userInfoRepository.getUserPositionInfo();
      final querySnapshot = (userInfo != null && userInfo.isBrazil)
          ? await politicosRef
              // TODO(rodrigo): tirar esse siglaUf
              .where('siglaUf', isEqualTo: userInfo.stateId)
              .getDocuments()
          : await politicosRef.getDocuments();

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
            .collection(POLITICOS_SEGUIDOS_COLLECTION)
            .document(politic['id'])
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
            .collection(USUARIOS_SEGUINDO_COLLECTION)
            .document(user.userId)
            .setData(user.toJson());
      }
    } on Exception {
      throw ComunicationException();
    }
  }
}
