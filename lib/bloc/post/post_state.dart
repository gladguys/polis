part of 'post_bloc.dart';

abstract class PostState extends Equatable {
  const PostState();
}

class InitialPostState extends PostState {
  @override
  List<Object> get props => [];
}

class PostFavoriteStatusChanged extends PostState {
  PostFavoriteStatusChanged({this.isFavorite});

  final bool isFavorite;

  @override
  List<Object> get props => [isFavorite];
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
