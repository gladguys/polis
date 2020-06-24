import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core/domain/model/models.dart';

part 'post_event.freezed.dart';

@freezed
abstract class PostEvent with _$PostEvent {
  factory PostEvent.likePost(String id) = LikePost;
  factory PostEvent.favoritePostForUser(
      {Map<String, dynamic> post, UserModel user}) = FavoritePostForUser;
  factory PostEvent.sharePost({File postImage}) = SharePost;
  factory PostEvent.setPostViewed({String userId, String postId}) =
      SetPostViewed;
  factory PostEvent.setPostFavorited({String userId, String postId}) =
      SetPostFavorited;
}
