import 'package:flutter_test/flutter_test.dart';
import 'package:polis/bloc/blocs.dart';

void main() {
  group('PostState tests', () {
    test('states', () {
      expect(InitialFavoritePostsState(), InitialFavoritePostsState());
      expect(
          FetchUserFavoritePostsSuccess([]), FetchUserFavoritePostsSuccess([]));
      expect(FetchUserFavoritePostsFailed(), FetchUserFavoritePostsFailed());
      expect(LoadingFavoritesPosts(), LoadingFavoritesPosts());
    });
  });
}
