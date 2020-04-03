import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/bloc/blocs.dart';

import '../mock.dart';

void main() {
  group('TimelineBloc tests', () {
    TimelineBloc timelineBloc;
    MockTimelineRepository mockTimelineRepository;
    Stream<List<dynamic>> timelineStream;

    setUp(() {
      mockTimelineRepository = MockTimelineRepository();
      timelineBloc = TimelineBloc(
        repository: mockTimelineRepository,
      );
      timelineStream = Stream.value([]);
    });

    test('asserts', () {
      expect(
          () => TimelineBloc(
                repository: null,
              ),
          throwsAssertionError);
    });

    test('''Expects InitialTimelineState to be the initial state''', () {
      expect(timelineBloc.state, equals(InitialTimelineState()));
    });

    blocTest(
      '''Expects [UpdateTimeline]''',
      build: () async {
        when(mockTimelineRepository.getUserTimeline('1')).thenAnswer(
          (_) => timelineStream,
        );
        return timelineBloc;
      },
      act: (timelineBloc) {
        timelineBloc.add(FetchUserTimeline('1'));
        timelineBloc.add(
          UpdateTimeline(activities: []),
        );
        return;
      },
      verify: (timelineBloc) async {
        verify(mockTimelineRepository.getUserTimeline('1')).called(1);
      },
      expect: [
        TimelineUpdated(activities: []),
      ],
    );

    blocTest(
      '''Expects [FetchTimelineFailed]''',
      build: () async {
        when(mockTimelineRepository.getUserTimeline('1'))
            .thenThrow(Exception());
        return timelineBloc;
      },
      act: (timelineBloc) {
        timelineBloc.add(FetchUserTimeline('1'));
        return;
      },
      verify: (timelineBloc) async {
        verify(mockTimelineRepository.getUserTimeline('1')).called(1);
      },
      expect: [
        FetchTimelineFailed(),
      ],
    );
  });
}
