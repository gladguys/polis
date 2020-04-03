import 'package:flutter_test/flutter_test.dart';
import 'package:polis/bloc/blocs.dart';

void main() {
  group('TimelineState tests', () {
    test('states', () {
      expect(InitialTimelineState(), InitialTimelineState());
      expect(TimelineUpdated(activities: []), TimelineUpdated(activities: []));
      expect(FetchTimelineFailed(), FetchTimelineFailed());
    });

    test('asserts', () {
      expect(() => TimelineUpdated(activities: null), throwsAssertionError);
    });
  });
}
