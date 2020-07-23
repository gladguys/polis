part of 'post_cubit.dart';

abstract class PostState extends Equatable {
  const PostState();
}

class InitialPostState extends PostState {
  @override
  List<Object> get props => [];
}

class PostFavoriteStatusChanged extends PostState {
  PostFavoriteStatusChanged({this.post, this.isFavorite});

  final dynamic post;
  final bool isFavorite;

  @override
  List<Object> get props => [post, isFavorite];
}

class PostFavoritedSuccess extends PostState {
  @override
  List<Object> get props => [];
}

class PostFavoritedFailed extends PostState {
  @override
  List<Object> get props => [];
}

class PostViewedFailed extends PostState {
  @override
  List<Object> get props => [];
}

class PostLikedSuccess extends PostState {
  PostLikedSuccess({this.postId});

  final String postId;

  @override
  List<Object> get props => [postId];
}

class PostLikedFailed extends PostState {
  @override
  List<Object> get props => [];
}

class PostUnlikedSuccess extends PostState {
  PostUnlikedSuccess({this.postId});

  final String postId;

  @override
  List<Object> get props => [postId];
}

class PostUnlikedFailed extends PostState {
  @override
  List<Object> get props => [];
}

class StoppedLikingPostSuccess extends PostState {
  StoppedLikingPostSuccess({this.postId});

  final String postId;

  @override
  List<Object> get props => [postId];
}

class StoppedLikingPostFailed extends PostState {
  @override
  List<Object> get props => [];
}

class StoppedUnlikingPostSuccess extends PostState {
  StoppedUnlikingPostSuccess({this.postId});

  final String postId;

  @override
  List<Object> get props => [postId];
}

class StoppedUnlikingPostFailed extends PostState {
  StoppedUnlikingPostFailed({this.postId});

  final String postId;

  @override
  List<Object> get props => [postId];
}
