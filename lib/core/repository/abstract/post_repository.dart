import 'package:tuple/tuple.dart';

import '../../../core/domain/model/models.dart';

abstract class PostRepository {
  Future<void> favoritePost({Map<String, dynamic> post, UserModel user});
  Future<void> unfavoritePost({Map<String, dynamic> post, UserModel user});
  Future<void> setPostVisible({String userId, String postId});
  Future<bool> isPostFavorited({String userId, String postId});
  Future<Tuple2<Map<String, bool>, Map<String, bool>>> likePost(
      {String userId, String postId, String politicoId, bool isUnliked});
  Future<Map<String, bool>> stopLikingPost(
      {String userId, String postId, String politicoId});
  Future<Tuple2<Map<String, bool>, Map<String, bool>>> unlikePost(
      {String userId, String postId, String politicoId, bool isLiked});
  Future<Map<String, bool>> stopUnlikingPost(
      {String userId, String postId, String politicoId});
}
