import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/bloc/cubits.dart';
import 'package:polis/bloc/timeline/timeline_cubit.dart';
import 'package:polis/core/constants.dart';
import 'package:polis/core/domain/model/despesa_model.dart';
import 'package:tuple/tuple.dart';

import '../mock.dart';

void main() {
  group('TimelineBloc tests', () {
    TimelineCubit timelineCubit;
    MockTimelineRepository mockTimelineRepository;
    var timelineStream = Stream.fromIterable([0, 3, 5]);
    MockDocumentSnapshot mockDocumentSnapshot;

    setUp(() {
      mockTimelineRepository = MockTimelineRepository();
      mockDocumentSnapshot = MockDocumentSnapshot();
      timelineCubit = TimelineCubit(
        repository: mockTimelineRepository,
      );
      timelineStream = Stream.value(0);
    });

    tearDown(() {
      timelineCubit?.close();
    });

    test('asserts', () {
      expect(
          () => TimelineCubit(
                repository: null,
              ),
          throwsAssertionError);
    });

    test('''Expects InitialTimelineState to be the initial state''', () {
      expect(timelineCubit.state, equals(InitialTimelineState()));
    });

    blocTest(
      '''should emit NoPostsAvailable state when no post is found on users timeline ''',
      build: () {
        timelineCubit = TimelineCubit(
          repository: mockTimelineRepository,
        );
        when(mockTimelineRepository.getNewActivitiesCounter('1'))
            .thenAnswer((_) => timelineStream);
        when(mockTimelineRepository.getTimelineFirstPosts(
                '1', kTimelinePageSize))
            .thenAnswer(
          (_) => Future.value(Tuple2([], mockDocumentSnapshot)),
        );
        return timelineCubit;
      },
      act: (timelineCubit) async {
        await timelineCubit.fetchUserTimeline('1');
        await timelineCubit.updateTimelineActivitiesCount(count: 0);
        return;
      },
      verify: (timelineCubit) async {
        verify(mockTimelineRepository.getNewActivitiesCounter('1')).called(1);
        verify(mockTimelineRepository.getTimelineFirstPosts(
                '1', kTimelinePageSize))
            .called(1);
      },
      expect: [
        LoadingTimeline(),
        NoPostsAvailable(),
        TimelineUpdated(activities: [], postsCount: 0, updatesCount: 0),
      ],
    );

    blocTest(
      '''Expects [LoadingTimeline, TimelineUpdated]''',
      build: () {
        timelineCubit = TimelineCubit(
          repository: mockTimelineRepository,
        );
        when(mockTimelineRepository.getNewActivitiesCounter('1'))
            .thenAnswer((_) => timelineStream);
        when(mockTimelineRepository.getTimelineFirstPosts(
                '1', kTimelinePageSize))
            .thenAnswer(
          (_) => Future.value(Tuple2([DespesaModel()], mockDocumentSnapshot)),
        );
        return timelineCubit;
      },
      act: (timelineCubit) async {
        await timelineCubit.fetchUserTimeline('1');
        await timelineCubit.updateTimelineActivitiesCount(count: 0);
        return;
      },
      verify: (timelineCubit) async {
        verify(mockTimelineRepository.getNewActivitiesCounter('1')).called(1);
        verify(mockTimelineRepository.getTimelineFirstPosts(
                '1', kTimelinePageSize))
            .called(1);
      },
      expect: [
        LoadingTimeline(),
        TimelineUpdated(
          activities: [
            DespesaModel(),
          ],
          postsCount: 1,
          updatesCount: 0,
        ),
      ],
    );

    blocTest(
      'set isTimelineFetchedOnce flag to true after the first run',
      build: () {
        timelineCubit = TimelineCubit(
          repository: mockTimelineRepository,
        );
        when(mockTimelineRepository.getNewActivitiesCounter('1'))
            .thenAnswer((_) => timelineStream);
        when(mockTimelineRepository.getTimelineFirstPosts(
                '1', kTimelinePageSize))
            .thenAnswer(
          (_) => Future.value(Tuple2([], mockDocumentSnapshot)),
        );
        return timelineCubit;
      },
      act: (timelineCubit) async {
        await timelineCubit.fetchUserTimeline('1');
        await timelineCubit.updateTimelineActivitiesCount(count: 0);
        await timelineCubit.notifyTimelineFetchedOnce();
        await timelineCubit.fetchUserTimeline('1');
        return;
      },
      verify: (timelineCubit) async {
        verify(mockTimelineRepository.getNewActivitiesCounter('1')).called(2);
        verify(mockTimelineRepository.getTimelineFirstPosts(
                '1', kTimelinePageSize))
            .called(2);
      },
      expect: [
        LoadingTimeline(),
        NoPostsAvailable(),
        TimelineUpdated(activities: [], postsCount: 0, updatesCount: 0),
        LoadingTimeline(),
        NoPostsAvailable(),
      ],
    );

    blocTest(
      'set isTimelineFetchedOnce flag to true before the first run',
      build: () {
        timelineCubit = TimelineCubit(
          repository: mockTimelineRepository,
        );
        when(mockTimelineRepository.getNewActivitiesCounter('1'))
            .thenAnswer((_) => timelineStream);
        when(mockTimelineRepository.getTimelineFirstPosts(
                '1', kTimelinePageSize))
            .thenAnswer(
          (_) => Future.value(Tuple2([], mockDocumentSnapshot)),
        );
        return timelineCubit;
      },
      act: (timelineCubit) async {
        await timelineCubit.notifyTimelineFetchedOnce();
        await timelineCubit.fetchUserTimeline('1');
        await timelineCubit.updateTimelineActivitiesCount(count: 0);
        return;
      },
      verify: (timelineCubit) async {
        verify(mockTimelineRepository.getNewActivitiesCounter('1')).called(1);
        verify(mockTimelineRepository.getTimelineFirstPosts(
                '1', kTimelinePageSize))
            .called(1);
      },
      expect: [
        LoadingTimeline(),
        NoPostsAvailable(),
        TimelineUpdated(activities: [], postsCount: 0, updatesCount: 0),
      ],
    );

    blocTest(
      '''Expects [FetchTimelineFailed] when getUserTimeline failed''',
      build: () {
        timelineCubit = TimelineCubit(
          repository: mockTimelineRepository,
        );
        when(mockTimelineRepository.getNewActivitiesCounter('1'))
            .thenThrow(Exception());
        return timelineCubit;
      },
      act: (timelineCubit) {
        timelineCubit.fetchUserTimeline('1');
        return;
      },
      verify: (timelineCubit) async {
        verify(mockTimelineRepository.getNewActivitiesCounter('1')).called(1);
      },
      expect: [
        LoadingTimeline(),
        FetchTimelineFailed(),
      ],
    );

    blocTest(
      '''Expects [FetchTimelineFailed] when getTimelineFirstPosts failed''',
      build: () {
        timelineCubit = TimelineCubit(
          repository: mockTimelineRepository,
        );
        when(mockTimelineRepository.getNewActivitiesCounter('1'))
            .thenAnswer((_) => timelineStream);
        when(mockTimelineRepository.getTimelineFirstPosts(
                '1', kTimelinePageSize))
            .thenThrow(Exception());
        return timelineCubit;
      },
      act: (timelineCubit) {
        timelineCubit.fetchUserTimeline('1');
        return;
      },
      verify: (timelineCubit) async {
        verify(mockTimelineRepository.getNewActivitiesCounter('1')).called(1);
        verify(mockTimelineRepository.getTimelineFirstPosts(
                '1', kTimelinePageSize))
            .called(1);
      },
      expect: [
        LoadingTimeline(),
        FetchTimelineFailed(),
      ],
    );

    blocTest(
      '''Expects [LoadingTimeline, TimelineUpdated, ReachedEndFetchingMore, UpdateTimeline] when fetch more posts''',
      build: () {
        timelineCubit = TimelineCubit(
          repository: mockTimelineRepository,
        );
        when(mockTimelineRepository.getNewActivitiesCounter('1'))
            .thenAnswer((_) => timelineStream);
        when(mockTimelineRepository.getTimelineFirstPosts(
                '1', kTimelinePageSize))
            .thenAnswer(
          (_) => Future.value(
            Tuple2([DespesaModel(id: '1')], mockDocumentSnapshot),
          ),
        );
        when(mockTimelineRepository.getMorePosts(
                '1', kTimelinePageSize, mockDocumentSnapshot))
            .thenAnswer(
          (_) => Future.value(
            Tuple2([DespesaModel(id: '2'), DespesaModel(id: '3')],
                mockDocumentSnapshot),
          ),
        );
        return timelineCubit;
      },
      act: (timelineCubit) async {
        await timelineCubit.fetchUserTimeline('1');
        await timelineCubit.updateTimelineActivitiesCount(count: 0);
        await timelineCubit.fetchMorePosts('1', 0);
        return;
      },
      verify: (timelineCubit) async {
        verify(mockTimelineRepository.getNewActivitiesCounter('1')).called(1);
        verify(mockTimelineRepository.getTimelineFirstPosts(
                '1', kTimelinePageSize))
            .called(1);
        verify(mockTimelineRepository.getMorePosts(
                '1', kTimelinePageSize, mockDocumentSnapshot))
            .called(1);
      },
      expect: [
        LoadingTimeline(),
        isA<TimelineUpdated>(),
        ReachedEndFetchingMore(
          activities: [
            DespesaModel(id: '1'),
            DespesaModel(id: '2'),
            DespesaModel(id: '3')
          ],
        ),
        TimelineUpdated(
          activities: [
            DespesaModel(id: '1'),
            DespesaModel(id: '2'),
            DespesaModel(id: '3')
          ],
          postsCount: 3,
          updatesCount: 0,
        ),
      ],
    );

    blocTest(
      '''Expects [LoadingTimeline, TimelineUpdated, FetchTimelineFailed] when fetch more posts failed''',
      build: () {
        timelineCubit = TimelineCubit(
          repository: mockTimelineRepository,
        );
        when(mockTimelineRepository.getNewActivitiesCounter('1'))
            .thenAnswer((_) => timelineStream);
        when(mockTimelineRepository.getTimelineFirstPosts(
                '1', kTimelinePageSize))
            .thenAnswer(
          (_) => Future.value(
            Tuple2([DespesaModel(id: '1')], mockDocumentSnapshot),
          ),
        );
        when(mockTimelineRepository.getMorePosts(
                '1', kTimelinePageSize, mockDocumentSnapshot))
            .thenThrow(Exception());
        return timelineCubit;
      },
      act: (timelineCubit) async {
        await timelineCubit.fetchUserTimeline('1');
        await timelineCubit.updateTimelineActivitiesCount(count: 0);
        await timelineCubit.fetchMorePosts('1', 0);
        return;
      },
      verify: (timelineCubit) async {
        verify(mockTimelineRepository.getNewActivitiesCounter('1')).called(1);
        verify(mockTimelineRepository.getTimelineFirstPosts(
                '1', kTimelinePageSize))
            .called(1);
        verify(mockTimelineRepository.getMorePosts(
                '1', kTimelinePageSize, mockDocumentSnapshot))
            .called(1);
      },
      expect: [
        LoadingTimeline(),
        isA<TimelineUpdated>(),
        ReachedEndFetchingMore(
          activities: [
            DespesaModel(id: '1'),
          ],
        ),
        FetchTimelineFailed(),
      ],
    );

    blocTest(
      '''Expects [LoadingTimeline, TimelineUpdated] when reload timeline is added''',
      build: () {
        when(mockTimelineRepository.getTimelineFirstPosts(
                '1', kTimelinePageSize))
            .thenAnswer(
          (_) => Future.value(
            Tuple2([DespesaModel(id: '1')], mockDocumentSnapshot),
          ),
        );
        return timelineCubit;
      },
      act: (timelineCubit) async {
        await timelineCubit.reloadTimeline('1');
        return;
      },
      verify: (timelineCubit) async {
        verify(mockTimelineRepository.getTimelineFirstPosts(
                '1', kTimelinePageSize))
            .called(1);
      },
      expect: [
        LoadingTimeline(),
        TimelineUpdated(
          activities: [
            DespesaModel(id: '1'),
          ],
          postsCount: 1,
          updatesCount: 0,
        ),
      ],
    );

    blocTest(
      '''Expects [LoadingTimeline, FetchTimelineFailed] when reload timeline throws exception''',
      build: () {
        when(mockTimelineRepository.getTimelineFirstPosts(
                '1', kTimelinePageSize))
            .thenThrow(Exception());
        return timelineCubit;
      },
      act: (timelineCubit) {
        timelineCubit.reloadTimeline('1');
        return;
      },
      verify: (timelineCubit) async {
        verify(mockTimelineRepository.getTimelineFirstPosts(
                '1', kTimelinePageSize))
            .called(1);
      },
      expect: [
        LoadingTimeline(),
        FetchTimelineFailed(),
      ],
    );

    blocTest(
      '''Expects [TimelineRefreshed] when RefreshTimeline added''',
      build: () => timelineCubit,
      act: (timelineCubit) {
        timelineCubit.refreshTimeline();
        return;
      },
      expect: [
        TimelineRefreshed(
          activities: [],
        ),
      ],
    );
  });
}
