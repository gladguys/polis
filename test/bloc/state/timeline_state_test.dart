import 'package:flutter_test/flutter_test.dart';
import 'package:polis/bloc/blocs.dart';

void main() {
  group('TimelineState tests', () {
    test('states', () {
      expect(InitialTimelineState(), InitialTimelineState());
      expect(TimelineUpdated(activities: [], count: 0),
          TimelineUpdated(activities: [], count: 0));
      expect(FetchTimelineFailed(), FetchTimelineFailed());
    });

    test('asserts', () {
      expect(() => TimelineUpdated(activities: null, count: 0),
          throwsAssertionError);
      expect(() => TimelineUpdated(activities: [], count: null),
          throwsAssertionError);
    });
  });
}
