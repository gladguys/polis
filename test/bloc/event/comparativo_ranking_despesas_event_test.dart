import 'package:flutter_test/flutter_test.dart';
import 'package:polis/bloc/blocs.dart';

void main() {
  group('ComparativoRankingDespesasEvent tests', () {
    group('GetRankingResultados', () {
      test('props', () {
        final ev1 = GetRankingResultados();
        final ev2 = GetRankingResultados();

        expect(ev1, ev2);
      });
    });
  });
}
