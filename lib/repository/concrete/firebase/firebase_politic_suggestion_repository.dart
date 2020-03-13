import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import '../../../core/constants.dart';
import '../../../model/politico_model.dart';
import '../../abstract/politic_suggestion_repository.dart';
import 'collection.dart';

class FirebasePoliticSuggestionRepository
    implements PoliticSuggestionRepository {
  FirebasePoliticSuggestionRepository({@required this.firestore})
      : assert(firestore != null);

  final Firestore firestore;
  CollectionReference get politicosRef => firestore.collection(POLITICOS);

  @override
  Future<List<PoliticoModel>> getSuggestedPolitics() async {
    final querySnapshot = await politicosRef.getDocuments();
    final documents =
        querySnapshot.documents.sublist(0, kMaxNumberSuggestedPolitics);
    return List.generate(
        documents.length, (i) => PoliticoModel.fromJson(documents[i].data));
  }
}
