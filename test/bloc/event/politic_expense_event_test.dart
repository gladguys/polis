import 'package:flutter_test/flutter_test.dart';
import 'package:polis/bloc/blocs.dart';

void main() {
  group('PoliticExpensesEvent tests', () {
    group('GetPoliticExpenses', () {
      test('props', () {
        final ev1 = GetPoliticExpenses('1');
        final ev2 = GetPoliticExpenses('1');
        final ev3 = GetPoliticExpenses('2');

        expect(ev1, ev2);
        expect(ev1 == ev3, false);
      });
    });
  });
}
