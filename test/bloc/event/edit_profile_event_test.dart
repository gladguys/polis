import 'package:flutter_test/flutter_test.dart';
import 'package:polis/bloc/blocs.dart';
import 'package:polis/model/models.dart';

void main() {
  group('EditProfileEvent tests', () {
    group('UpdateUserInfo', () {
      test('props', () {
        final ev1 = UpdateUserInfo(
          name: 'a',
          email: 'email',
          currentUser: UserModel(),
          pickedPhoto: null,
        );
        final ev2 = UpdateUserInfo(
          name: 'a',
          email: 'email',
          currentUser: UserModel(),
          pickedPhoto: null,
        );
        final ev3 = UpdateUserInfo(
          name: 'ab',
          email: 'email2',
          currentUser: UserModel(),
          pickedPhoto: null,
        );

        expect(ev1, ev2);
        expect(ev1 == ev3, false);
      });
    });
  });
}
