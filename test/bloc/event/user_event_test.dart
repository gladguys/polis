import 'package:flutter_test/flutter_test.dart';
import 'package:polis/bloc/blocs.dart';

void main() {
  group('UserEvent tests', () {
    test('test props', () {
      final ev1 = Logout();
      final ev2 = Logout();

      expect(ev1 == ev2, true);
    });
  });
}
