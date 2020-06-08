import 'package:flutter_test/flutter_test.dart';
import 'package:polis/bloc/blocs.dart';

void main() {
  group('PoliticProposalsEvent tests', () {
    group('GetPoliticProposals', () {
      test('props', () {
        final ev1 = GetPoliticProposals('1');
        final ev2 = GetPoliticProposals('1');
        final ev3 = GetPoliticProposals('2');

        expect(ev1, ev2);
        expect(ev1 == ev3, false);
      });
    });
  });
}
