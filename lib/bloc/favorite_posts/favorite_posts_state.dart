import 'package:freezed_annotation/freezed_annotation.dart';

part 'favorite_posts_state.freezed.dart';

@freezed
abstract class FavoritePostsState with _$FavoritePostsState {
  factory FavoritePostsState.initial() = InitialFavoritePostsState;
  factory FavoritePostsState.fetchUserFavoritePostsSuccess(
      List<dynamic> posts) = FetchUserFavoritePostsSuccess;
  factory FavoritePostsState.fetchUserFavoritePostsFailed() =
      FetchUserFavoritePostsFailed;
  factory FavoritePostsState.loadingFavoritesPosts() = LoadingFavoritesPosts;
}
