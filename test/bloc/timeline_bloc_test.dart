import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/bloc/blocs.dart';
import 'package:polis/model/despesa_model.dart';
import 'package:tuple/tuple.dart';

import '../mock.dart';

void main() {
  group('TimelineBloc tests', () {
    TimelineBloc timelineBloc;
    MockTimelineRepository mockTimelineRepository;
    Stream<List<dynamic>> timelineStream;
    MockDocumentSnapshot mockDocumentSnapshot;

    setUp(() {
      mockTimelineRepository = MockTimelineRepository();
      mockDocumentSnapshot = MockDocumentSnapshot();
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
      '''Expects [LoadingTimeline, UpdateTimeline]''',
      build: () async {
        when(mockTimelineRepository.getUserTimeline('1'))
            .thenAnswer((_) => timelineStream);
        when(mockTimelineRepository.getTimelineFirstPosts('1', 5)).thenAnswer(
          (_) => Future.value(Tuple2([], mockDocumentSnapshot)),
        );
        return timelineBloc;
      },
      act: (timelineBloc) {
        timelineBloc.add(FetchUserTimeline('1'));
        timelineBloc.add(
          UpdateTimelineActivitiesCount(count: 0),
        );
        return;
      },
      verify: (timelineBloc) async {
        verify(mockTimelineRepository.getUserTimeline('1')).called(1);
        verify(mockTimelineRepository.getTimelineFirstPosts('1', 5)).called(1);
      },
      expect: [
        LoadingTimeline(),
        TimelineUpdated(activities: [], count: 0),
      ],
    );

    blocTest(
      '''Expects [FetchTimelineFailed] when getUserTimeline failed''',
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
        LoadingTimeline(),
        FetchTimelineFailed(),
      ],
    );

    blocTest(
      '''Expects [FetchTimelineFailed] when getTimelineFirstPosts failed''',
      build: () async {
        when(mockTimelineRepository.getUserTimeline('1'))
            .thenAnswer((_) => timelineStream);
        when(mockTimelineRepository.getTimelineFirstPosts('1', 5))
            .thenThrow(Exception());
        return timelineBloc;
      },
      act: (timelineBloc) {
        timelineBloc.add(FetchUserTimeline('1'));
        return;
      },
      verify: (timelineBloc) async {
        verify(mockTimelineRepository.getUserTimeline('1')).called(1);
        verify(mockTimelineRepository.getTimelineFirstPosts('1', 5)).called(1);
      },
      expect: [
        LoadingTimeline(),
        FetchTimelineFailed(),
      ],
    );

    blocTest(
      '''Expects [LoadingTimeline, UpdateTimeline, UpdateTimeline] when fetch more posts''',
      build: () async {
        when(mockTimelineRepository.getUserTimeline('1'))
            .thenAnswer((_) => timelineStream);
        when(mockTimelineRepository.getTimelineFirstPosts('1', 5)).thenAnswer(
          (_) => Future.value(
            Tuple2([DespesaModel(id: '1')], mockDocumentSnapshot),
          ),
        );
        when(mockTimelineRepository.getMorePosts('1', 5, mockDocumentSnapshot))
            .thenAnswer(
          (_) => Future.value(
            Tuple2([DespesaModel(id: '2'), DespesaModel(id: '3')],
                mockDocumentSnapshot),
          ),
        );
        return timelineBloc;
      },
      act: (timelineBloc) {
        timelineBloc.add(FetchUserTimeline('1'));
        timelineBloc.add(UpdateTimelineActivitiesCount(count: 0));
        timelineBloc.add(FetchMorePosts('1'));
        return;
      },
      verify: (timelineBloc) async {
        verify(mockTimelineRepository.getUserTimeline('1')).called(1);
        verify(mockTimelineRepository.getTimelineFirstPosts('1', 5)).called(1);
        verify(mockTimelineRepository.getMorePosts(
                '1', 5, mockDocumentSnapshot))
            .called(1);
      },
      expect: [
        LoadingTimeline(),
        isA<TimelineUpdated>(),
        TimelineUpdated(activities: [
          DespesaModel(id: '1'),
          DespesaModel(id: '2'),
          DespesaModel(id: '3')
        ], count: 3),
      ],
    );

    blocTest(
      '''Expects [LoadingTimeline, UpdateTimeline, FetchTimelineFailed] when fetch more posts failed''',
      build: () async {
        when(mockTimelineRepository.getUserTimeline('1'))
            .thenAnswer((_) => timelineStream);
        when(mockTimelineRepository.getTimelineFirstPosts('1', 5)).thenAnswer(
          (_) => Future.value(
            Tuple2([DespesaModel(id: '1')], mockDocumentSnapshot),
          ),
        );
        when(mockTimelineRepository.getMorePosts('1', 5, mockDocumentSnapshot))
            .thenThrow(Exception());
        return timelineBloc;
      },
      act: (timelineBloc) {
        timelineBloc.add(FetchUserTimeline('1'));
        timelineBloc.add(UpdateTimelineActivitiesCount(count: 0));
        timelineBloc.add(FetchMorePosts('1'));
        return;
      },
      verify: (timelineBloc) async {
        verify(mockTimelineRepository.getUserTimeline('1')).called(1);
        verify(mockTimelineRepository.getTimelineFirstPosts('1', 5)).called(1);
        verify(mockTimelineRepository.getMorePosts(
                '1', 5, mockDocumentSnapshot))
            .called(1);
      },
      expect: [
        LoadingTimeline(),
        isA<TimelineUpdated>(),
        FetchTimelineFailed(),
      ],
    );
  });
}
