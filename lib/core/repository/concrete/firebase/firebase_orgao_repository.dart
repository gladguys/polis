import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../../core/domain/model/models.dart';
import '../../../../core/exception/exceptions.dart';
import '../../abstract/orgao_repository.dart';
import 'firebase.dart';

class FirebaseOrgaoRepository implements OrgaoRepository {
  FirebaseOrgaoRepository({@required this.firestore})
      : assert(firestore != null);

  final FirebaseFirestore firestore;

  CollectionReference get orgaosRef => firestore.collection(ORGAOS_COLLECTION);

  @override
  Future<Map<String, OrgaoModel>> getAllOrgaosMap() async {
    try {
      final querySnapshot = await orgaosRef.get();
      final documents = querySnapshot.docs;
      final orgaosList = List.generate(
          documents.length,
          (i) =>
              OrgaoModel.fromJson(documents[i].data as Map<String, dynamic>));
      final orgaosMap = <String, OrgaoModel>{};
      for (var orgao in orgaosList) {
        orgaosMap.putIfAbsent(orgao.sigla, () => orgao);
      }
      return orgaosMap;
    } on Exception {
      throw ComunicationException();
    }
  }

  Future<List<OrgaoModel>> getAllOrgaos() async {
    try {
      final querySnapshot = await orgaosRef.get();
      final documents = querySnapshot.docs;
      return List.generate(
          documents.length,
          (i) =>
              OrgaoModel.fromJson(documents[i].data as Map<String, dynamic>));
    } on Exception {
      throw ComunicationException();
    }
  }
}
