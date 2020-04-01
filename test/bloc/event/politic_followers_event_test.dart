import 'package:flutter_test/flutter_test.dart';
import 'package:polis/bloc/blocs.dart';

void main() {
  group('PoliticFollowersEvent tests', () {
    group('GetPoliticFollowers', () {
      test('props', () {
        final ev1 = GetPoliticFollowers('1');
        final ev2 = GetPoliticFollowers('1');
        final ev3 = GetPoliticFollowers('2');

        expect(ev1, ev2);
        expect(ev1 == ev3, false);
      });
    });
  });
}
