import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../core/exception/exceptions.dart';
import '../../../model/models.dart';
import '../../abstract/favorite_posts_repository.dart';
import '../../utils.dart';
import 'firebase.dart';

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
          .orderBy(DATA_FAVORITADO_FIELD, descending: true)
          .getDocuments(source: Source.cache);
      final documents = querySnapshot.documents;
      final posts = [];
      for (var document in documents) {
        if (isDocumentDespesa(document.data)) {
          final despesa = DespesaModel.fromJson(document.data);
          posts.add(
            despesa.copyWith(
              id: document.documentID,
              favorito: true,
            ),
          );
        } else {
          final proposta = PropostaModel.fromJson(document.data);
          posts.add(
            proposta.copyWith(
              id: document.documentID,
              favorito: true,
            ),
          );
        }
      }
      return posts;
    } on Exception {
      throw ComunicationException();
    }
  }
}
