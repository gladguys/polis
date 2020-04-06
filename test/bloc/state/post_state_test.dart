import 'package:flutter_test/flutter_test.dart';
import 'package:polis/bloc/blocs.dart';

void main() {
  group('PostState tests', () {
    test('states', () {
      expect(InitialPostState(), InitialPostState());
      expect(PostFavoriteStatusChanged(isFavorite: true),
          PostFavoriteStatusChanged(isFavorite: true));
      expect(PostFavoritedSuccess(), PostFavoritedSuccess());
      expect(PostFavoritedFailed(), PostFavoritedFailed());
    });
  });
}
