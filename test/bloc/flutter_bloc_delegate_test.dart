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
    MockSigninRepository mockSigninRepository;
    MockAnalyticsService mockAnalyticsService;
    MockSharedPreferencesService mockSharedPreferencesService;

    setUp(() {
      mockAnalyticsService = MockAnalyticsService();
      delegate = FlutterBlocDelegate(
        analyticsService: mockAnalyticsService,
      );
      mockSigninRepository = MockSigninRepository();
      mockSharedPreferencesService = MockSharedPreferencesService();
      signinBloc = SigninBloc(
        repository: mockSigninRepository,
        analyticsService: mockAnalyticsService,
        sharedPreferencesService: mockSharedPreferencesService,
      );
    });

    test('assert', () {
      expect(() => FlutterBlocDelegate(analyticsService: null),
          throwsAssertionError);
    });

    test('onEvent test', () {
      delegate.onEvent(signinBloc, SigninWithEmailAndPassword('email', 'pass'));
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
