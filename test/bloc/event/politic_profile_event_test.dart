import 'package:flutter_test/flutter_test.dart';
import 'package:polis/bloc/blocs.dart';

void main() {
  group('PoliticProfileEvent tests', () {
    group('GetPoliticInfo', () {
      test('props', () {
        final ev1 = GetPoliticInfo('1');
        final ev2 = GetPoliticInfo('1');
        final ev3 = GetPoliticInfo('2');

        expect(ev1, ev2);
        expect(ev1 == ev3, false);
      });
    });

    group('SendEmailToPolitic', () {
      test('props', () {
        final ev1 = SendEmailToPolitic();
        final ev2 = SendEmailToPolitic();

        expect(ev1, ev2);
      });
    });

    group('GetMoreActivities', () {
      test('props', () {
        final ev1 = GetMoreActivities('1');
        final ev2 = GetMoreActivities('1');

        expect(ev1, ev2);
      });
    });

    group('FollowUnfollowProfilePolitic', () {
      test('asserts', () {
        expect(() => FollowUnfollowProfilePolitic(isFollowing: null),
            throwsAssertionError);
      });

      test('props', () {
        final ev1 = FollowUnfollowProfilePolitic(isFollowing: true);
        final ev2 = FollowUnfollowProfilePolitic(isFollowing: true);
        final ev3 = FollowUnfollowProfilePolitic(isFollowing: false);

        expect(ev1, ev2);
        expect(ev1 == ev3, false);
      });
    });
  });
}
