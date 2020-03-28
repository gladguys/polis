import 'package:flutter_test/flutter_test.dart';
import 'package:polis/bloc/blocs.dart';
import 'package:polis/model/despesa_model.dart';

void main() {
  group('TimelineEvent tests', () {
    group('FetchUserTimeline', () {
      test('props', () {
        final ev1 = FetchUserTimeline('1');
        final ev2 = FetchUserTimeline('1');
        final ev3 = FetchUserTimeline('2');

        expect(ev1, ev2);
        expect(ev1 == ev3, false);
      });
    });

    group('UpdateTimeline', () {
      test('props', () {
        final ev1 = UpdateTimeline(despesas: [], propostas: []);
        final ev2 = UpdateTimeline(despesas: [], propostas: []);
        final ev3 = UpdateTimeline(despesas: [
          DespesaModel(),
        ], propostas: []);

        expect(ev1, ev2);
        expect(ev1 == ev3, false);
      });
    });
  });
}
