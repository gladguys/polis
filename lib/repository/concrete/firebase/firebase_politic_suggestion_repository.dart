import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../core/constants.dart';
import '../../../core/exception/exceptions.dart';
import '../../../model/politico_model.dart';
import '../../abstract/politic_suggestion_repository.dart';
import 'collection.dart';

class FirebasePoliticSuggestionRepository
    implements PoliticSuggestionRepository {
  FirebasePoliticSuggestionRepository({@required this.firestore})
      : assert(firestore != null);

  final Firestore firestore;
  CollectionReference get politicosRef => firestore.collection(POLITICOS);
  CollectionReference get followingRef => firestore.collection(FOLLOWING);

  @override
  Future<List<PoliticoModel>> getSuggestedPolitics() async {
    try {
      final querySnapshot = await politicosRef.getDocuments();
      final documents = querySnapshot.documents.sublist(
          0, min(querySnapshot.documents.length, kMaxNumberSuggestedPolitics));
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
        // TODO(rodrigo): does this to be syncronous?
        await followingRef
            .document(userId)
            .collection(POLITICOS_FOLLOWING)
            .add(politic);
      }
    } on Exception {
      throw ComunicationException();
    }
  }
}
