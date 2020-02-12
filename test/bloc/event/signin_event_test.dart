import 'package:flutter_test/flutter_test.dart';
import 'package:polis/bloc/blocs.dart';

void main() {
  group('SigninEvent tests', () {
    test('test props', () {
      final ev1 = SigninTried('email', 'password');
      final ev2 = SigninTried('email', 'password');
      final ev3 = SigninTried('email2', 'password2');

      expect(ev1 == ev2, true);
      expect(ev1 == ev3, false);
    });
  });
}
