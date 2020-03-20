import 'package:flutter_test/flutter_test.dart';
import 'package:polis/bloc/blocs.dart';

void main() {
  group('UserProfileEvent tests', () {
    group('FetchUserRelatedInfo tests', () {
      test('props', () {
        final ev1 = FetchUserRelatedInfo('1');
        final ev2 = FetchUserRelatedInfo('1');
        final ev3 = FetchUserRelatedInfo('2');

        expect(ev1, ev2);
        expect(ev1 == ev3, false);
      });
    });
  });
}
