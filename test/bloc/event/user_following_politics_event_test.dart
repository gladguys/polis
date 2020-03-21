import 'package:flutter_test/flutter_test.dart';
import 'package:polis/bloc/blocs.dart';
import 'package:polis/model/politico_model.dart';
import 'package:polis/model/user_model.dart';

void main() {
  group('UserFollowingPoliticsEvent tests', () {
    group('FetchFollowingPolitics', () {
      test('props', () {
        final ev1 = FetchFollowingPolitics(userId: '1');
        final ev2 = FetchFollowingPolitics(userId: '1');
        final ev3 = FetchFollowingPolitics(userId: '2');

        expect(ev1, ev2);
        expect(ev1 == ev3, false);
      });

      test('assert', () {
        expect(
            () => FetchFollowingPolitics(userId: null), throwsAssertionError);
      });
    });

    group('SearchPoliticsByTerm', () {
      test('props', () {
        final ev1 = SearchPoliticsByTerm('a');
        final ev2 = SearchPoliticsByTerm('a');
        final ev3 = SearchPoliticsByTerm('b');

        expect(ev1, ev2);
        expect(ev1 == ev3, false);
      });
    });

    group('FollowUnfollowPolitic', () {
      test('props', () {
        final ev1 = FollowUnfollowPolitic(
          user: UserModel(userId: '1'),
          politico: PoliticoModel(id: '1'),
        );
        final ev2 = FollowUnfollowPolitic(
          user: UserModel(userId: '1'),
          politico: PoliticoModel(id: '1'),
        );
        final ev3 = FollowUnfollowPolitic(
          user: UserModel(userId: '2'),
          politico: PoliticoModel(id: '2'),
        );

        expect(ev1, ev2);
        expect(ev1 == ev3, false);
      });

      test('assert', () {
        expect(
            () => FollowUnfollowPolitic(user: null, politico: PoliticoModel()),
            throwsAssertionError);
        expect(() => FollowUnfollowPolitic(user: UserModel(), politico: null),
            throwsAssertionError);
      });
    });
  });
}
