import 'package:equatable/equatable.dart';
import 'package:sealed_class/sealed_class.dart';

part 'favorite_posts_state.g.dart';

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
