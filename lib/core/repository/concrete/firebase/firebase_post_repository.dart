import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../../core/domain/model/user_model.dart';
import '../../../../core/exception/exceptions.dart';
import '../../abstract/repositories.dart';
import 'firebase.dart';

class FirebasePostRepository implements PostRepository {
  FirebasePostRepository({@required this.firestore})
      : assert(firestore != null);

  final Firestore firestore;

  CollectionReference get postsFavoritosRef =>
      firestore.collection(POSTS_FAVORITOS_COLLECTION);
  CollectionReference get timelineRef =>
      firestore.collection(TIMELINE_COLLECTION);

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

  @override
  Future<void> setPostVisible({String userId, String postId}) async {
    try {
      await timelineRef
          .document(userId)
          .collection(ATIVIDADES_TIMELINE_SUBCOLLECTION)
          .document(postId)
          .updateData({VISUALIZADO_FIELD: true});
    } on Exception {
      throw ComunicationException();
    }
  }

  @override
  Future<bool> isPostFavorited({String userId, String postId}) async {
    try {
      final documentReference = await postsFavoritosRef
          .document(userId)
          .collection(POSTS_FAVORITOS_USUARIO_SUBCOLLECTION)
          .document(postId);
      final documentSnapshot = await documentReference.get();
      return documentSnapshot.exists;
    } on Exception {
      throw ComunicationException();
    }
  }
}
