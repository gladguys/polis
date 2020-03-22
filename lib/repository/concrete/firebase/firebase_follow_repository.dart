import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../core/exception/exceptions.dart';
import '../../../model/politico_model.dart';
import '../../../model/user_model.dart';
import '../../abstract/follow_repository.dart';
import 'collection.dart';

class FirebaseFollowRepository implements FollowRepository {
  FirebaseFollowRepository({@required this.firestore})
      : assert(firestore != null);

  final Firestore firestore;
  CollectionReference get politicosSeguidosRef =>
      firestore.collection(POLITICOS_SEGUIDOS);
  CollectionReference get usuariosSeguindoRef =>
      firestore.collection(USUARIOS_SEGUINDO);

  @override
  Future<void> followPolitic({UserModel user, PoliticoModel politico}) async {
    try {
      politicosSeguidosRef
          .document(user.userId)
          .collection(POLITICOS_SEGUIDOS_COLLECTION)
          .document(politico.id)
          .setData(politico.toJson());

      usuariosSeguindoRef
          .document(politico.id)
          .collection(USUARIOS_SEGUINDO_COLLECTION)
          .document(user.userId)
          .setData(user.toJson());
    } on Exception {
      throw ComunicationException();
    }
  }

  @override
  Future<void> unfollowPolitic({UserModel user, PoliticoModel politico}) async {
    try {
      politicosSeguidosRef
          .document(user.userId)
          .collection(POLITICOS_SEGUIDOS_COLLECTION)
          .document(politico.id)
          .delete();

      usuariosSeguindoRef
          .document(politico.id)
          .collection(USUARIOS_SEGUINDO_COLLECTION)
          .document(user.userId)
          .delete();
    } on Exception {
      throw ComunicationException();
    }
  }
}