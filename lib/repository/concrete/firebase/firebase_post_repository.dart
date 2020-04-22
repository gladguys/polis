import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../core/exception/exceptions.dart';
import '../../../model/user_model.dart';
import '../../abstract/post_repository.dart';
import 'firebase.dart';

class FirebasePostRepository implements PostRepository {
  FirebasePostRepository({@required this.firestore})
      : assert(firestore != null);

  final Firestore firestore;

  CollectionReference get postsFavoritosRef =>
      firestore.collection(POSTS_FAVORITOS_COLLECTION);

  @override
  Future<void> favoritePost({Map<String, dynamic> post, UserModel user}) async {
    final postWithTimestamp = {
      ...post,
      DATA_FAVORITADO_FIELD: Timestamp.now(),
    };
    try {
      await postsFavoritosRef
          .document(user.userId)
          .collection(POSTS_FAVORITOS_USUARIO_SUBCOLLECTION)
          .document(post['id'])
          .setData(postWithTimestamp);
    } on Exception {
      throw ComunicationException();
    }
  }

  @override
  Future<void> unfavoritePost(
      {Map<String, dynamic> post, UserModel user}) async {
    try {
      await postsFavoritosRef
          .document(user.userId)
          .collection(POSTS_FAVORITOS_USUARIO_SUBCOLLECTION)
          .document(post['id'])
          .delete();
    } on Exception {
      throw ComunicationException();
    }
  }
}
