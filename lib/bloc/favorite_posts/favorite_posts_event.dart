import 'package:freezed_annotation/freezed_annotation.dart';

part 'favorite_posts_event.freezed.dart';

@freezed
abstract class FavoritePostsEvent with _$FavoritePostsEvent {
  factory FavoritePostsEvent.fetchUserFavoritePosts({@required String userId}) =
      FetchUserFavoritePosts;
}
