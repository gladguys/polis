import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';

import '../../../../core/domain/model/user_model.dart';
import '../../../../core/exception/exceptions.dart';
import '../../../utils/general_utils.dart';
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
          .document(getPostIdFromJson(post))
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
          .document(getPostIdFromJson(post))
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

  @override
  Future<Tuple2<Map<String, bool>, Map<String, bool>>> likePost(
      {String userId, String postId, String politicoId, bool isUnliked}) async {
    try {
      final isLiking = true;

      await _updateActivity(
        postId: postId,
        politicoId: politicoId,
        isLiking: isLiking,
        isUnliked: isUnliked,
      );

      return _updateUserLikesInfo(
        postId: postId,
        userId: userId,
        isLiking: isLiking,
      );
    } on Exception {
      throw ComunicationException();
    }
  }

  @override
  Future<Tuple2<Map<String, bool>, Map<String, bool>>> unlikePost(
      {String userId, String postId, String politicoId, bool isLiked}) async {
    try {
      final isLiking = false;

      await _updateActivity(
        postId: postId,
        politicoId: politicoId,
        isLiking: isLiking,
        isLiked: isLiked,
      );

      return _updateUserLikesInfo(
        postId: postId,
        userId: userId,
        isLiking: isLiking,
      );
    } on Exception {
      throw ComunicationException();
    }
  }

  @override
  Future<Map<String, bool>> stopLikingPost(
      {String userId, String postId, String politicoId}) async {
    try {
      final isLiking = true;

      await _updateActivityWithStop(
        postId: postId,
        politicoId: politicoId,
        isLiking: isLiking,
      );

      return _updateUserLikesInfoWhenStop(
        postId: postId,
        userId: userId,
        isLiking: isLiking,
      );
    } on Exception {
      throw ComunicationException();
    }
  }

  @override
  Future<Map<String, bool>> stopUnlikingPost(
      {String userId, String postId, String politicoId}) async {
    try {
      final isLiking = false;

      await _updateActivityWithStop(
        postId: postId,
        politicoId: politicoId,
        isLiking: isLiking,
      );

      return _updateUserLikesInfoWhenStop(
        postId: postId,
        userId: userId,
        isLiking: isLiking,
      );
    } on Exception {
      throw ComunicationException();
    }
  }

  Future<void> _updateActivity({
    String postId,
    String politicoId,
    bool isLiking,
    bool isLiked,
    bool isUnliked,
  }) async {
    final postInfo = await _getPostInfo(postId: postId, politicoId: politicoId);

    final postData = postInfo.item1;
    final actualLikesCount = postData[QTD_CURTIDAS_FIELD] ?? 0;
    final actualUnlikesCount = postData[QTD_NAO_CURTIDAS_FIELD] ?? 0;

    final docPost = postInfo.item2;
    if (isLiking) {
      await docPost.updateData({
        QTD_CURTIDAS_FIELD: actualLikesCount + 1,
        QTD_NAO_CURTIDAS_FIELD: actualUnlikesCount - (isUnliked ? 1 : 0)
      });
    } else {
      await docPost.updateData({
        QTD_CURTIDAS_FIELD: actualLikesCount - (isLiked ? 1 : 0),
        QTD_NAO_CURTIDAS_FIELD: actualUnlikesCount + 1,
      });
    }
  }

  Future<void> _updateActivityWithStop({
    String postId,
    String politicoId,
    bool isLiking,
  }) async {
    try {
      final postInfo =
          await _getPostInfo(postId: postId, politicoId: politicoId);

      final postData = postInfo.item1;
      final postDoc = postInfo.item2;

      if (isLiking) {
        final actualLikesCount = postData[QTD_CURTIDAS_FIELD] ?? 0;
        await postDoc.updateData({
          QTD_CURTIDAS_FIELD: actualLikesCount - 1,
        });
      } else {
        final actualUnlikesCount = postData[QTD_NAO_CURTIDAS_FIELD] ?? 0;
        await postDoc.updateData({
          QTD_NAO_CURTIDAS_FIELD: actualUnlikesCount - 1,
        });
      }
    } on Exception {
      rethrow;
    }
  }

  Future<Tuple2<Map<String, bool>, Map<String, bool>>> _updateUserLikesInfo({
    String userId,
    String postId,
    bool isLiking,
  }) async {
    try {
      final userInfo = await _getUserInfo(userId: userId);

      final userData = userInfo.item1;
      final userLikes =
          Map<String, bool>.from(userData[USER_LIKES_FIELD] ?? {});
      final userUnlikes =
          Map<String, bool>.from(userData[USER_UNLIKES_FIELD] ?? {});
      userLikes[postId] = isLiking;
      userUnlikes[postId] = !isLiking;

      final userDoc = userInfo.item2;
      await userDoc.updateData({
        USER_LIKES_FIELD: {
          ...userLikes,
        },
        USER_UNLIKES_FIELD: {
          ...userUnlikes,
        }
      });

      return Tuple2<Map<String, bool>, Map<String, bool>>(
        userLikes,
        userUnlikes,
      );
    } on Exception {
      rethrow;
    }
  }

  Future<Map<String, bool>> _updateUserLikesInfoWhenStop({
    String userId,
    String postId,
    bool isLiking,
  }) async {
    try {
      final userInfo = await _getUserInfo(userId: userId);
      final userData = userInfo.item1;
      final userDoc = userInfo.item2;

      if (isLiking) {
        final userLikes =
            Map<String, bool>.from(userData[USER_LIKES_FIELD] ?? {});
        userLikes[postId] = false;
        await userDoc.updateData({
          USER_LIKES_FIELD: {
            ...userLikes,
          }
        });
        return userLikes;
      } else {
        final userUnlikes =
            Map<String, bool>.from(userData[USER_UNLIKES_FIELD] ?? {});
        userUnlikes[postId] = false;

        await userDoc.updateData({
          USER_UNLIKES_FIELD: userUnlikes,
        });
        return userUnlikes;
      }
    } on Exception {
      rethrow;
    }
  }

  Future<Tuple2<Map<String, dynamic>, DocumentReference>> _getPostInfo({
    String politicoId,
    String postId,
  }) async {
    try {
      final documentReference = await atividadesRef
          .document(politicoId)
          .collection(ATIVIDADES_POLITICO_SUBCOLLECTION)
          .document(postId);
      final documentSnapshot = await documentReference.get();
      return Tuple2(documentSnapshot.data, documentReference);
    } on Exception {
      rethrow;
    }
  }

  Future<Tuple2<Map<String, dynamic>, DocumentReference>> _getUserInfo({
    String userId,
  }) async {
    try {
      final userDocumentReference = usersRef.document(userId);
      final userDocumentSnapshot = await userDocumentReference.get();
      return Tuple2(userDocumentSnapshot.data, userDocumentReference);
    } on Exception {
      throw ComunicationException();
    }
  }
}
