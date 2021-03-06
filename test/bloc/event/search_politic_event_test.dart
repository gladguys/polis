import 'package:flutter_test/flutter_test.dart';
import 'package:polis/bloc/blocs.dart';
import 'package:polis/core/domain/model/models.dart';

void main() {
  group('SearchPoliticEvent tests', () {
    group('FetchPolitics', () {
      test('props', () {
        final ev1 = FetchPolitics('1');
        final ev2 = FetchPolitics('1');
        final ev3 = FetchPolitics('2');

        expect(ev1, ev2);
        expect(ev1 == ev3, false);
      });
    });

    group('FollowUnfollowSearchPolitic', () {
      test('props', () {
        final ev1 = FollowUnfollowSearchPolitic(
          user: UserModel(
            userId: '1',
          ),
          politico: PoliticoModel(id: '1'),
        );
        final ev2 = FollowUnfollowSearchPolitic(
          user: UserModel(
            userId: '1',
          ),
          politico: PoliticoModel(id: '1'),
        );
        final ev3 = FollowUnfollowSearchPolitic(
          user: UserModel(
            userId: '2',
          ),
          politico: PoliticoModel(id: '2'),
        );
        expect(ev1, ev2);
        expect(ev1 == ev3, false);
      });

      test('asserts', () {
        expect(
            () => FollowUnfollowSearchPolitic(
                  user: null,
                  politico: PoliticoModel(),
                ),
            throwsAssertionError);

        expect(
            () => FollowUnfollowSearchPolitic(
                  user: UserModel(),
                  politico: null,
                ),
            throwsAssertionError);
      });
    });

    group('ChangeFollowPoliticStatus', () {
      test('props', () {
        final ev1 = ChangeFollowPoliticStatus(
            politico: PoliticoModel(), isUserFollowingPolitic: true);
        final ev2 = ChangeFollowPoliticStatus(
            politico: PoliticoModel(), isUserFollowingPolitic: true);
        final ev3 = ChangeFollowPoliticStatus(
            politico: PoliticoModel(id: '1'), isUserFollowingPolitic: true);

        expect(ev1, ev2);
        expect(ev1 == ev3, false);
      });

      test('asserts', () {
        expect(
            () => ChangeFollowPoliticStatus(
                  politico: null,
                  isUserFollowingPolitic: true,
                ),
            throwsAssertionError);
        expect(
            () => ChangeFollowPoliticStatus(
                  politico: PoliticoModel(),
                  isUserFollowingPolitic: null,
                ),
            throwsAssertionError);
      });
    });
  });
}
