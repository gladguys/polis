import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../core/exception/exceptions.dart';
import '../../../model/models.dart';
import '../../abstract/politic_profile_repository.dart';
import 'collection.dart';

class FirebasePoliticProfileRepository implements PoliticProfileRepository {
  FirebasePoliticProfileRepository({@required this.firestore})
      : assert(firestore != null);

  final Firestore firestore;

  CollectionReference get politicoRef =>
      firestore.collection(POLITICOS_COLLECTION);
  CollectionReference get usuariosSeguindoRef =>
      firestore.collection(USUARIOS_SEGUINDO_COLLECTION);

  @override
  Future<PoliticoModel> getInfoPolitic(String politicId) async {
    try {
      final documentReference = politicoRef.document(politicId);
      final documentSnapshot = await documentReference.get();
      return PoliticoModel.fromJson(documentSnapshot.data);
    } on Exception {
      throw ComunicationException();
    }
  }

  @override
  Future<List<UsuarioSeguindoPolitico>> getUsersFollowingPolitic(
      String politicId) async {
    try {
      final usuariosSeguindoCollectionRef = usuariosSeguindoRef
          .document(politicId)
          .collection(USUARIOS_SEGUINDO_SUBCOLLECTION);
      final querySnapshot = await usuariosSeguindoCollectionRef.getDocuments();
      final documents = querySnapshot.documents;
      return List.generate(documents.length,
          (i) => UsuarioSeguindoPolitico.fromJson(documents[i].data));
    } on Exception {
      throw ComunicationException();
    }
  }
}
