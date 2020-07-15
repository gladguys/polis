import 'package:flutter_test/flutter_test.dart';
import 'package:polis/bloc/blocs.dart';
import 'package:polis/core/domain/model/models.dart';

void main() {
  group('PostEvent tests', () {
    group('LikePost', () {
      test('props', () {
        final ev1 = LikePost(user: UserModel(), postId: '1');
        final ev2 = LikePost(user: UserModel(), postId: '1');
        final ev3 = LikePost(user: UserModel(), postId: '2');

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
        final ev1 = SetPostViewed(userId: '1', postId: '1');
        final ev2 = SetPostViewed(userId: '1', postId: '1');
        final ev3 = SetPostViewed(userId: '2', postId: '2');

        expect(ev1, ev2);
        expect(ev1 == ev3, false);
      });
    });

    group('SetPostFavorited', () {
      test('props', () {
        final ev1 = SetPostFavorited(userId: '1', postId: '1');
        final ev2 = SetPostFavorited(userId: '1', postId: '1');
        final ev3 = SetPostFavorited(userId: '2', postId: '2');

        expect(ev1, ev2);
        expect(ev1 == ev3, false);
      });
    });

    group('StopLikingPost', () {
      test('props', () {
        final ev1 =
            StopLikingPost(user: UserModel(), postId: '1', politicoId: '1');
        final ev2 =
            StopLikingPost(user: UserModel(), postId: '1', politicoId: '1');
        final ev3 =
            StopLikingPost(user: UserModel(), postId: '2', politicoId: '2');

        expect(ev1, ev2);
        expect(ev1 == ev3, false);
      });
    });

    group('UnlikePost', () {
      test('props', () {
        final ev1 = UnlikePost(
            user: UserModel(), postId: '1', politicoId: '1', isLiked: true);
        final ev2 = UnlikePost(
            user: UserModel(), postId: '1', politicoId: '1', isLiked: true);
        final ev3 = UnlikePost(
            user: UserModel(), postId: '2', politicoId: '2', isLiked: false);

        expect(ev1, ev2);
        expect(ev1 == ev3, false);
      });
    });

    group('StopUnlikingPost', () {
      test('props', () {
        final ev1 =
            StopUnlikingPost(user: UserModel(), postId: '1', politicoId: '1');
        final ev2 =
            StopUnlikingPost(user: UserModel(), postId: '1', politicoId: '1');
        final ev3 =
            StopUnlikingPost(user: UserModel(), postId: '2', politicoId: '2');

        expect(ev1, ev2);
        expect(ev1 == ev3, false);
      });
    });
  });
}
