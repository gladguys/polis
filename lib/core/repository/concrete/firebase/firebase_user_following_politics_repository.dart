import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../../core/domain/model/models.dart';
import '../../../../core/exception/exceptions.dart';
import '../../abstract/user_following_politics_repository.dart';
import 'firebase.dart';

class FirebaseUserFollowingPoliticsRepository
    implements UserFollowingPoliticsRepository {
  FirebaseUserFollowingPoliticsRepository({@required this.firestore})
      : assert(firestore != null);

  final FirebaseFirestore firestore;
  CollectionReference get politicosSeguindoRef =>
      firestore.collection(POLITICOS_SEGUIDOS_COLLECTION);

  @override
  Future<List<PoliticoModel>> getFollowingPolitics(String userId) async {
    try {
      final collection = politicosSeguindoRef
          .doc(userId)
          .collection(POLITICOS_SEGUIDOS_SUBCOLLECTION);
      final querySnapshot = await collection.get();
      final documents = querySnapshot.docs;
      return List.generate(
          documents.length, (i) => PoliticoModel.fromJson(documents[i].data()));
    } on Exception {
      throw ComunicationException();
    }
  }
}
