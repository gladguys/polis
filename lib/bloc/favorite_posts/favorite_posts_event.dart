part of 'favorite_posts_bloc.dart';

abstract class FavoritePostsEvent extends Equatable {
  const FavoritePostsEvent();
}

class FetchUserFavoritePosts extends FavoritePostsEvent {
  FetchUserFavoritePosts({@required this.userId}) : assert(userId != null);

  final String userId;

  @override
  List<Object> get props => [userId];
}
