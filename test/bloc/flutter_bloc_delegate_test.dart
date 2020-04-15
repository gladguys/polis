import 'package:bloc/bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/bloc/blocs.dart';
import 'package:polis/bloc/flutter_bloc_delegate.dart';
import 'package:polis/model/models.dart';

import '../mock.dart';

void main() {
  group('FlutterBlocDelegate tests', () {
    FlutterBlocDelegate delegate;
    SigninBloc signinBloc;
    TimelineBloc timelineBloc;
    MockSigninRepository mockSigninRepository;
    MockAnalyticsService mockAnalyticsService;
    MockPerformanceService mockPerformanceService;
    MockSharedPreferencesService mockSharedPreferencesService;

    setUp(() {
      mockAnalyticsService = MockAnalyticsService();
      mockPerformanceService = MockPerformanceService();
      delegate = FlutterBlocDelegate(
        analyticsService: mockAnalyticsService,
        performanceService: mockPerformanceService,
      );
      mockSigninRepository = MockSigninRepository();
      mockSharedPreferencesService = MockSharedPreferencesService();
      signinBloc = SigninBloc(
        repository: mockSigninRepository,
        analyticsService: mockAnalyticsService,
        sharedPreferencesService: mockSharedPreferencesService,
      );
      timelineBloc = TimelineBloc(
        repository: MockTimelineRepository(),
      );
    });

    test('assert', () {
      expect(
          () => FlutterBlocDelegate(
                analyticsService: null,
                performanceService: mockPerformanceService,
              ),
          throwsAssertionError);
      expect(
          () => FlutterBlocDelegate(
                analyticsService: mockAnalyticsService,
                performanceService: null,
              ),
          throwsAssertionError);
    });

    group('onEvent test', () {
      test('simple call to onEvent', () {
        delegate.onEvent(
            signinBloc, SigninWithEmailAndPassword('email', 'pass'));
      });

      test('should not send performance on untracked event', () {
        delegate.onEvent(
            signinBloc, SigninWithEmailAndPassword('email', 'pass'));
        verifyNever(mockPerformanceService.getTrace(trace: anyNamed('trace')));
      });

      test('should send FetchUserTimeline performance', () {
        when(mockPerformanceService.getTrace(trace: anyNamed('trace')))
            .thenAnswer((_) => Future.value(MockTrace()));
        delegate.onEvent(timelineBloc, FetchUserTimeline('1'));
        verify(mockPerformanceService.getTrace(trace: anyNamed('trace')))
            .called(1);
      });

      test('should send FetchMorePosts performance', () {
        when(mockPerformanceService.getTrace(trace: anyNamed('trace')))
            .thenAnswer((_) => Future.value(MockTrace()));
        delegate.onEvent(timelineBloc, FetchMorePosts('1'));
        verify(mockPerformanceService.getTrace(trace: anyNamed('trace')))
            .called(1);
      });

      test('should send ReloadTimeline performance', () {
        when(mockPerformanceService.getTrace(trace: anyNamed('trace')))
            .thenAnswer((_) => Future.value(MockTrace()));
        delegate.onEvent(timelineBloc, ReloadTimeline('1'));
        verify(mockPerformanceService.getTrace(trace: anyNamed('trace')))
            .called(1);
      });

      test('should call super.event when event when timeline event not tracked',
          () {
        when(mockPerformanceService.getTrace(trace: anyNamed('trace')))
            .thenAnswer((_) => Future.value(MockTrace()));
        delegate.onEvent(timelineBloc, NotifyTimelineFetchedOnce());
        verifyNever(mockPerformanceService.getTrace(trace: anyNamed('trace')));
      });
    });

    test('onTransition test', () {
      delegate.onTransition(
        signinBloc,
        Transition(
          currentState: InitialSignin(),
          event: SigninWithEmailAndPassword('email', 'pass'),
          nextState: UserAuthenticated(UserModel()),
        ),
      );
      verify(
        mockAnalyticsService.logBloc(
          event: 'SigninWithEmailAndPassword',
          currentState: 'InitialSignin',
          nextState: 'UserAuthenticated',
        ),
      );
    });

    test('onError test', () {
      delegate.onError(signinBloc, 'error', null);
    });
  });
}
