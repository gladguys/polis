import 'package:flutter_test/flutter_test.dart';
import 'package:polis/bloc/blocs.dart';

void main() {
  group('ChangePasswordEvent tests', () {
    group('ChangeUserPassword', () {
      test('props', () {
        final ev1 = ChangeUserPassword(
          currentPassword: 'current',
          newPassword: 'new',
        );
        final ev2 = ChangeUserPassword(
          currentPassword: 'current',
          newPassword: 'new',
        );
        final ev3 = ChangeUserPassword(
          currentPassword: 'current3',
          newPassword: 'new3',
        );

        expect(ev1, ev2);
        expect(ev1 == ev3, false);
      });
    });

    test('asserts', () {
      expect(
          () => ChangeUserPassword(
                newPassword: null,
                currentPassword: 'c',
              ),
          throwsAssertionError);
      expect(
          () => ChangeUserPassword(
                newPassword: 'n',
                currentPassword: null,
              ),
          throwsAssertionError);
    });
  });
}
