import 'package:flutter_test/flutter_test.dart';
import 'package:polis/bloc/cubits.dart';

void main() {
  group('PostState tests', () {
    test('states', () {
      expect(InitialPostState(), InitialPostState());
      expect(PostFavoriteStatusChanged(isFavorite: true),
          PostFavoriteStatusChanged(isFavorite: true));
      expect(PostFavoritedSuccess(), PostFavoritedSuccess());
      expect(PostFavoritedFailed(), PostFavoritedFailed());
      expect(PostViewedFailed(), PostViewedFailed());
      expect(PostLikedSuccess(postId: '1'), PostLikedSuccess(postId: '1'));
      expect(PostLikedFailed(), PostLikedFailed());
      expect(PostUnlikedSuccess(postId: '1'), PostUnlikedSuccess(postId: '1'));
      expect(PostUnlikedFailed(), PostUnlikedFailed());
      expect(StoppedLikingPostSuccess(postId: '1'),
          StoppedLikingPostSuccess(postId: '1'));
      expect(StoppedLikingPostFailed(), StoppedLikingPostFailed());
      expect(StoppedUnlikingPostSuccess(postId: '1'),
          StoppedUnlikingPostSuccess(postId: '1'));
      expect(StoppedUnlikingPostFailed(postId: '1'),
          StoppedUnlikingPostFailed(postId: '1'));
    });
  });
}
