import 'package:flutter_test/flutter_test.dart';
import 'package:polis/bloc/blocs.dart';

void main() {
  group('FavoritePostsEvent tests', () {
    group('FetchUserFavoritePosts', () {
      test('props', () {
        final ev1 = FetchUserFavoritePosts(userId: '1');
        final ev2 = FetchUserFavoritePosts(userId: '1');
        final ev3 = FetchUserFavoritePosts(userId: '2');

        expect(ev1, ev2);
        expect(ev1 == ev3, false);
      });
    });
  });
}
