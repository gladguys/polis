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
}
