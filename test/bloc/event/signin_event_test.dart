import 'package:flutter_test/flutter_test.dart';
import 'package:polis/bloc/blocs.dart';

void main() {
  group('SigninEvent tests', () {
    test('Signin props', () {
      final ev1 = SigninWithEmailAndPassword('email', 'password');
      final ev2 = SigninWithEmailAndPassword('email', 'password');
      final ev3 = SigninWithEmailAndPassword('email2', 'password2');

      expect(ev1 == ev2, true);
      expect(ev1 == ev3, false);
    });
  });
}
