import 'package:flutter_test/flutter_test.dart';
import 'package:polis/bloc/blocs.dart';

void main() {
  group('DespesaImageEvent tests', () {
    group('OpenDespesaImage', () {
      test('props', () {
        final ev1 = OpenDespesaImage('1');
        final ev2 = OpenDespesaImage('1');
        final ev3 = OpenDespesaImage('2');

        expect(ev1, ev2);
        expect(ev1 == ev3, false);
      });
    });
  });
}
