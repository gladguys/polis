import 'package:flutter_test/flutter_test.dart';
import 'package:polis/bloc/blocs.dart';

void main() {
  group('TimelineState tests', () {
    test('states', () {
      expect(InitialTimelineState(), InitialTimelineState());
      expect(TimelineUpdated(despesas: [], propostas: []),
          TimelineUpdated(despesas: [], propostas: []));
      expect(FetchTimelineFailed(), FetchTimelineFailed());
    });

    test('asserts', () {
      expect(
          () => TimelineUpdated(
                despesas: null,
                propostas: [],
              ),
          throwsAssertionError);
      expect(
          () => TimelineUpdated(
                despesas: [],
                propostas: null,
              ),
          throwsAssertionError);
    });
  });
}
