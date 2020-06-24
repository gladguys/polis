import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_state.freezed.dart';

@freezed
abstract class PostState with _$PostState {
  factory PostState.initial() = InitialPostState;
  factory PostState.postFavoriteStatusChanged({dynamic post, bool isFavorite}) =
      PostFavoriteStatusChanged;
  factory PostState.postFavoritedSuccess() = PostFavoritedSuccess;
  factory PostState.postFavoritedFailed() = PostFavoritedFailed;
  factory PostState.postSharedSuccess() = PostSharedSuccess;
  factory PostState.postSharedFailed() = PostSharedFailed;
  factory PostState.postViewedFailed() = PostViewedFailed;
}
