import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../core/exception/exceptions.dart';
import '../../../model/models.dart';
import '../../abstract/favorite_posts_repository.dart';
import '../../utils.dart';
import 'collection.dart';

class FirebaseFavoritePostsRepository implements FavoritePostsRepository {
  FirebaseFavoritePostsRepository({@required this.firestore})
      : assert(firestore != null);

  final Firestore firestore;

  CollectionReference get postsFavoritosRef =>
      firestore.collection(POSTS_FAVORITOS_COLLECTION);

  @override
  Future<List<dynamic>> getUserFavoritePosts(String userId) async {
    try {
      final querySnapshot = await postsFavoritosRef
          .document(userId)
          .collection(POSTS_FAVORITOS_USUARIO_SUBCOLLECTION)
          .getDocuments();
      final documents = querySnapshot.documents;
      final posts = [];
      for (var document in documents) {
        if (isDocumentDespesa(document.data)) {
          posts.add(DespesaModel.fromJson(document.data));
        } else {
          posts.add(PropostaModel.fromJson(document.data));
        }
      }
      return posts;
    } on Exception {
      throw ComunicationException();
    }
  }
}
