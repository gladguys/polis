part of 'post_bloc.dart';

abstract class PostEvent extends Equatable {
  const PostEvent();
}

class LikePost extends PostEvent {
  LikePost(this.id);

  final String id;

  @override
  List<Object> get props => [id];
}

class FavoritePostForUser extends PostEvent {
  FavoritePostForUser({this.post, this.user});

  final Map<String, dynamic> post;
  final UserModel user;

  @override
  List<Object> get props => [post, user];
}

class SharePost extends PostEvent {
  SharePost({this.postImage});

  final File postImage;

  @override
  List<Object> get props => [postImage];
}

class SetPostViewed extends PostEvent {
  SetPostViewed({this.userId, this.postId});

  final String userId;
  final String postId;

  @override
  List<Object> get props => [userId, postId];
}

class SetPostFavorited extends PostEvent {
  SetPostFavorited({this.userId, this.postId});

  final String userId;
  final String postId;

  @override
  List<Object> get props => [userId, postId];
}
