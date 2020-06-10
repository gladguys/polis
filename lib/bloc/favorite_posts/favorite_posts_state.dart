part of 'favorite_posts_bloc.dart';

@Sealed([
  InitialFavoritePostsState,
  FetchUserFavoritePostsSuccess,
  LoadingFavoritesPosts,
  FetchUserFavoritePostsFailed,
])
abstract class FavoritePostsState extends Equatable {
  const FavoritePostsState();
}

class InitialFavoritePostsState extends FavoritePostsState {
  @override
  List<Object> get props => [];
}

class FetchUserFavoritePostsSuccess extends FavoritePostsState {
  FetchUserFavoritePostsSuccess(this.posts);

  final List<dynamic> posts;

  @override
  List<Object> get props => [posts];
}

class LoadingFavoritesPosts extends FavoritePostsState {
  @override
  List<Object> get props => [];
}

class FetchUserFavoritePostsFailed extends FavoritePostsState {
  @override
  List<Object> get props => [];
}
