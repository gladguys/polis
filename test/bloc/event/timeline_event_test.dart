import 'package:flutter_test/flutter_test.dart';
import 'package:polis/bloc/blocs.dart';

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
        final ev1 = UpdateTimelineActivitiesCount(count: 0);
        final ev2 = UpdateTimelineActivitiesCount(count: 0);
        final ev3 = UpdateTimelineActivitiesCount(count: 1);

        expect(ev1, ev2);
        expect(ev1 == ev3, false);
      });
    });

    group('FetchMorePosts', () {
      test('props', () {
        final ev1 = FetchMorePosts('1', 0);
        final ev2 = FetchMorePosts('1', 0);
        final ev3 = FetchMorePosts('2', 0);

        expect(ev1, ev2);
        expect(ev1 == ev3, false);
      });
    });

    group('ReloadTimeline', () {
      test('props', () {
        final ev1 = ReloadTimeline('1');
        final ev2 = ReloadTimeline('1');
        final ev3 = ReloadTimeline('2');

        expect(ev1, ev2);
        expect(ev1 == ev3, false);
      });
    });

    group('RefreshTimeline', () {
      test('props', () {
        final ev1 = RefreshTimeline();
        final ev2 = RefreshTimeline();

        expect(ev1, ev2);
      });
    });

    group('NotifyTimelineFetchedOnce', () {
      test('props', () {
        final ev1 = NotifyTimelineFetchedOnce();
        final ev2 = NotifyTimelineFetchedOnce();

        expect(ev1, ev2);
      });
    });
  });
}
