part of 'post_bloc.dart';

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
