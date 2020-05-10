import 'package:flutter_test/flutter_test.dart';
import 'package:polis/bloc/blocs.dart';
import 'package:polis/model/models.dart';

void main() {
  group('PostEvent tests', () {
    group('LikePost', () {
      test('props', () {
        final ev1 = LikePost('1');
        final ev2 = LikePost('1');
        final ev3 = LikePost('2');

        expect(ev1, ev2);
        expect(ev1 == ev3, false);
      });
    });

    group('FavoritePostForUser', () {
      test('props', () {
        final ev1 = FavoritePostForUser(post: {}, user: UserModel());
        final ev2 = FavoritePostForUser(post: {}, user: UserModel());
        final ev3 =
            FavoritePostForUser(post: {'id': 1}, user: UserModel(userId: '1'));

        expect(ev1, ev2);
        expect(ev1 == ev3, false);
      });
    });

    group('SetPostVisible', () {
      test('props', () {
        final ev1 = SetPostVisible(userId: '1', postId: '1');
        final ev2 = SetPostVisible(userId: '1', postId: '1');
        final ev3 = SetPostVisible(userId: '2', postId: '2');

        expect(ev1, ev2);
        expect(ev1 == ev3, false);
      });
    });
  });
}
