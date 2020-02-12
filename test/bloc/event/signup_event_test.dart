import 'package:flutter_test/flutter_test.dart';
import 'package:polis/bloc/blocs.dart';

void main() {
  group('SignupEvent tests', () {
    test('test props', () {
      final ev1 = SignupTried('email', 'password');
      final ev2 = SignupTried('email', 'password');
      final ev3 = SignupTried('email2', 'password2');

      expect(ev1 == ev2, true);
      expect(ev1 == ev3, false);
    });
  });
}
