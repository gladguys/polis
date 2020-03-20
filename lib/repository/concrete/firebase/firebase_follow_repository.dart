import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../model/politico_model.dart';
import '../../../model/user_model.dart';
import '../../abstract/follow_repository.dart';
import 'collection.dart';

class FirebaseFollowRepository implements FollowRepository {
  FirebaseFollowRepository({@required this.firestore})
      : assert(firestore != null);

  final Firestore firestore;
  CollectionReference get politicosRef => firestore.collection(POLITICOS);
  CollectionReference get politicosSeguidosRef =>
      firestore.collection(POLITICOS_SEGUIDOS);
  CollectionReference get usuariosSeguindoRef =>
      firestore.collection(USUARIOS_SEGUINDO);

  @override
  Future<void> followPolitic({UserModel user, PoliticoModel politico}) async {
    politicosSeguidosRef
        .document(user.userId)
        .collection(POLITICOS_SEGUIDOS_COLLECTION)
        .document(politico.id)
        .setData(politico.toJson());

    usuariosSeguindoRef
        .document(politico.id)
        .collection(USUARIOS_SEGUINDO_COLLECTIONS)
        .document(user.userId)
        .setData(user.toJson());
  }

  @override
  Future<void> unfollowPolitic({UserModel user, PoliticoModel politico}) async {
    politicosSeguidosRef
        .document(user.userId)
        .collection(POLITICOS_SEGUIDOS_COLLECTION)
        .document(politico.id)
        .delete();

    usuariosSeguindoRef
        .document(politico.id)
        .collection(USUARIOS_SEGUINDO_COLLECTIONS)
        .document(user.userId)
        .delete();
  }
}
