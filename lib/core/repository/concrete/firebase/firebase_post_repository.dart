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
  CollectionReference get atividadesRef =>
      firestore.collection(ATIVIDADES_COLLECTION);
  CollectionReference get usersRef => firestore.collection(USERS_COLLECTION);

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
          .document(_getIdFromPost(post))
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
          .document(_getIdFromPost(post))
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

  String _getIdFromPost(Map<String, dynamic> post) {
    return post['idPropostaPolitico'] ?? post['id'];
  }

  @override
  Future<Map<String, bool>> likePost(
      {String userId, String postId, String politicoId}) async {
    try {
      final documentReference = await atividadesRef
          .document(politicoId)
          .collection(ATIVIDADES_POLITICO_SUBCOLLECTION)
          .document(postId);
      final documentSnapshot = await documentReference.get();
      final actualLikesCount = documentSnapshot.data[QTD_CURTIDAS_FIELD] ?? 0;
      await documentReference.updateData({
        QTD_CURTIDAS_FIELD: actualLikesCount + 1,
      });

      final userDocumentReference = usersRef.document(userId);
      final userDocumentSnapshot = await userDocumentReference.get();
      final userLikes = Map<String, bool>.from(
          userDocumentSnapshot.data[USER_LIKES_FIELD] ?? {});
      userLikes[postId] = true;
      await userDocumentReference.updateData({
        USER_LIKES_FIELD: {
          ...userLikes,
        }
      });
      return userLikes;
    } on Exception {
      throw ComunicationException();
    }
  }

  @override
  Future<Map<String, bool>> unlikePost(
      {String userId, String postId, String politicoId}) async {
    try {
      final documentReference = await atividadesRef
          .document(politicoId)
          .collection(ATIVIDADES_POLITICO_SUBCOLLECTION)
          .document(postId);
      final documentSnapshot = await documentReference.get();
      final actualUnlikesCount =
          documentSnapshot.data[QTD_NAO_CURTIDAS_FIELD] ?? 0;
      await documentReference.updateData({
        QTD_NAO_CURTIDAS_FIELD: actualUnlikesCount + 1,
      });

      final userDocumentReference = usersRef.document(userId);
      final userDocumentSnapshot = await userDocumentReference.get();
      final userUnlikes = Map<String, bool>.from(
          userDocumentSnapshot.data[USER_UNLIKES_FIELD] ?? {});
      userUnlikes[postId] = true;

      await userDocumentReference.updateData({
        USER_UNLIKES_FIELD: userUnlikes,
      });
      return userUnlikes;
    } on Exception {
      throw ComunicationException();
    }
  }
}
