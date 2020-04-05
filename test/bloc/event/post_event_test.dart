import 'package:flutter_test/flutter_test.dart';
import 'package:polis/bloc/blocs.dart';

void main() {
  group('PostEvent tests', () {
    group('LikePost', () {
      test('props', () {
        final ev1 = LikePost('1');
        final ev2 = LikePost('1');
        final ev3 = LikePost('2');

        expect(ev1, ev2);
        expect(ev1 == ev3, false);
      });
    });
  });
}
