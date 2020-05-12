import 'package:flutter_test/flutter_test.dart';
import 'package:polis/bloc/blocs.dart';

void main() {
  group('TimelineState tests', () {
    test('states', () {
      expect(InitialTimelineState(), InitialTimelineState());
      expect(TimelineUpdated(activities: [], postsCount: 0, updatesCount: 0),
          TimelineUpdated(activities: [], postsCount: 0, updatesCount: 0));
      expect(FetchTimelineFailed(), FetchTimelineFailed());
      expect(
          TimelineRefreshed(activities: []), TimelineRefreshed(activities: []));
    });

    test('asserts', () {
      expect(
          () =>
              TimelineUpdated(activities: null, postsCount: 0, updatesCount: 0),
          throwsAssertionError);
      expect(
          () => TimelineUpdated(
              activities: [], postsCount: null, updatesCount: 0),
          throwsAssertionError);
      expect(
          () => TimelineUpdated(
              activities: [], postsCount: 0, updatesCount: null),
          throwsAssertionError);
      expect(
          () => ReachedEndFetchingMore(activities: null), throwsAssertionError);
      expect(() => TimelineRefreshed(activities: null), throwsAssertionError);
    });
  });
}
