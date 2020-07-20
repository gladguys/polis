import 'package:flutter_test/flutter_test.dart';
import 'package:polis/bloc/blocs.dart';

void main() {
  group('PoliticExpensesEvent tests', () {
    group('GetPoliticExpenses', () {
      test('props', () {
        final ev1 = GetInitialInfo(2019);
        final ev2 = GetInitialInfo(2019);
        final ev3 = GetInitialInfo(2020);

        expect(ev1, ev2);
        expect(ev1 == ev3, false);
      });
    });

    group('GetPoliticExpensesDataForYear', () {
      test('props', () {
        final ev1 = GetPoliticExpensesDataForYear(2019);
        final ev2 = GetPoliticExpensesDataForYear(2019);
        final ev3 = GetPoliticExpensesDataForYear(2020);

        expect(ev1, ev2);
        expect(ev1 == ev3, false);
      });
    });
  });
}
