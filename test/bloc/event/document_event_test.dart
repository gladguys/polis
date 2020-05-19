import 'package:flutter_test/flutter_test.dart';
import 'package:polis/bloc/blocs.dart';

void main() {
  group('DocumentEvent tests', () {
    group('OpenDespesaImage', () {
      test('props', () {
        final ev1 = OpenDocumentImage('1');
        final ev2 = OpenDocumentImage('1');
        final ev3 = OpenDocumentImage('2');

        expect(ev1, ev2);
        expect(ev1 == ev3, false);
      });
    });
  });
}
