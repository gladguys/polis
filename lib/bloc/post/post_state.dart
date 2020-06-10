part of 'post_bloc.dart';

@Sealed([
  InitialPostState,
  PostFavoritedSuccess,
  PostFavoriteStatusChanged,
  PostFavoritedFailed,
  PostViewedFailed,
])
abstract class PostState extends Equatable {
  const PostState();
}

class InitialPostState extends PostState {
  @override
  List<Object> get props => [];
}

class PostFavoritedSuccess extends PostState {
  @override
  List<Object> get props => [];
}

class PostFavoriteStatusChanged extends PostState {
  PostFavoriteStatusChanged({this.isFavorite});

  final bool isFavorite;

  @override
  List<Object> get props => [isFavorite];
}

class PostFavoritedFailed extends PostState {
  @override
  List<Object> get props => [];
}

class PostViewedFailed extends PostState {
  @override
  List<Object> get props => [];
}
