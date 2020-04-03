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
  });
}
