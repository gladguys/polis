import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../../core/domain/model/usuario_seguindo_politico_model.dart';
import '../../../../core/exception/exceptions.dart';
import '../../abstract/politic_followers_repository.dart';
import 'firebase.dart';

class FirebasePoliticFollowersRepository implements PoliticFollowersRepository {
  FirebasePoliticFollowersRepository({@required this.firestore})
      : assert(firestore != null);

  final FirebaseFirestore firestore;

  CollectionReference get usuariosSeguindoRef =>
      firestore.collection(USUARIOS_SEGUINDO_COLLECTION);

  @override
  Future<List<UsuarioSeguindoPolitico>> getUsersFollowingPolitic(
      String politicId) async {
    try {
      final usuariosSeguindoCollectionRef = usuariosSeguindoRef
          .doc(politicId)
          .collection(USUARIOS_SEGUINDO_SUBCOLLECTION);
      final querySnapshot = await usuariosSeguindoCollectionRef.get();
      final documents = querySnapshot.docs;
      return List.generate(documents.length,
          (i) => UsuarioSeguindoPolitico.fromJson(documents[i].data()));
    } on Exception {
      throw ComunicationException();
    }
  }
}
