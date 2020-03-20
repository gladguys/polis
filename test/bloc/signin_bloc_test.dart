import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/bloc/blocs.dart';
import 'package:polis/core/exception/invalid_credentials_exception.dart';
import 'package:polis/i18n/message.dart';
import 'package:polis/model/user_model.dart';

import '../mock.dart';

void main() {
  UserModel user;

  group('SigninBloc tests', () {
    SigninBloc signinBloc;
    MockSigninRepository mockSigninRepository;
    MockAnalyticsService mockAnalyticsService;
    MockSharedPreferencesService mockSharedPreferencesService;
    user =
        UserModel(name: 'polis', email: 'polis@gmail.com', password: 'random');

    setUp(() {
      mockSigninRepository = MockSigninRepository();
      mockAnalyticsService = MockAnalyticsService();
      mockSharedPreferencesService = MockSharedPreferencesService();
      signinBloc = SigninBloc(
        repository: mockSigninRepository,
        analyticsService: mockAnalyticsService,
        sharedPreferencesService: mockSharedPreferencesService,
      );
    });

    test('asserts', () {
      expect(
          () => SigninBloc(
                repository: mockSigninRepository,
                analyticsService: null,
                sharedPreferencesService: null,
              ),
          throwsAssertionError);
      expect(
          () => SigninBloc(
                repository: null,
                analyticsService: mockAnalyticsService,
                sharedPreferencesService: null,
              ),
          throwsAssertionError);
      expect(
          () => SigninBloc(
                repository: mockSigninRepository,
                analyticsService: mockAnalyticsService,
                sharedPreferencesService: null,
              ),
          throwsAssertionError);
    });

    test('Expects InitialSignin to be the initial state', () {
      expect(signinBloc.state, equals(InitialSignin()));
    });

    blocTest(
      'Expects [SigninLoading, UserAuthenticated]'
      ' when SigninWithEmailAndPassword added',
      build: () async {
        when(mockSigninRepository.signInWithEmailAndPassword(any, any))
            .thenAnswer((_) => Future.value(user));
        when(mockAnalyticsService.logSignin(method: anyNamed('method')))
            .thenAnswer((_) => Future.value());
        return signinBloc;
      },
      act: (signinBloc) {
        signinBloc.add(SigninWithEmailAndPassword('', ''));
        return;
      },
      verify: (signinBloc) async {
        verify(mockSigninRepository.signInWithEmailAndPassword(any, any))
            .called(1);
        verify(mockAnalyticsService.logSignin(method: 'EMAIL_AND_PASSWORD'))
            .called(1);
      },
      expect: [
        SigninLoading(),
        UserAuthenticated(user),
      ],
    );

    blocTest(
      'Expects [SigninLoading, UserAuthenticated]'
      ' when SigninWithGoogle added',
      build: () async {
        when(mockSigninRepository.signInWithGoogle())
            .thenAnswer((_) => Future.value(user));
        when(mockAnalyticsService.logSignin(method: anyNamed('method')))
            .thenAnswer((_) => Future.value());
        return signinBloc;
      },
      act: (signinBloc) {
        signinBloc.add(SigninWithGoogle());
        return;
      },
      verify: (signinBloc) async {
        verify(mockSigninRepository.signInWithGoogle()).called(1);
        verify(mockAnalyticsService.logSignin(method: 'GOOGLE')).called(1);
      },
      expect: [
        SigninLoading(),
        UserAuthenticated(user),
      ],
    );

    blocTest(
      '''Expects [SigninLoading, SigninFailed] with 
      ERROR_INVALID_CREDENTIALS when SigninWithEmailAndPassword added and theres an error with 
      credentials''',
      build: () async {
        when(mockSigninRepository.signInWithEmailAndPassword(any, any))
            .thenThrow(InvalidCredentialsException());
        return signinBloc;
      },
      act: (signinBloc) {
        signinBloc.add(SigninWithEmailAndPassword('', ''));
        return;
      },
      verify: (signinBloc) async {
        verify(mockSigninRepository.signInWithEmailAndPassword('', ''))
            .called(1);
      },
      expect: [
        SigninLoading(),
        SigninFailed(ERROR_INVALID_CREDENTIALS),
      ],
    );

    blocTest(
      'Expects [SigninLoading, SigninFailed] with '
      'ERROR_SIGNIN when SigninWithEmailAndPassword added and theres an error',
      build: () async {
        when(mockSigninRepository.signInWithEmailAndPassword(any, any))
            .thenThrow(Exception(ERROR_SIGNIN));
        return signinBloc;
      },
      act: (signinBloc) {
        signinBloc.add(SigninWithEmailAndPassword('', ''));
        return;
      },
      verify: (signinBloc) async {
        verify(mockSigninRepository.signInWithEmailAndPassword('', ''))
            .called(1);
      },
      expect: [
        SigninLoading(),
        SigninFailed(ERROR_SIGNIN),
      ],
    );

    blocTest(
      '''Expects [SigninLoading, SigninFailed] with 
      ERROR_INVALID_CREDENTIALS when SigninWithGoogle added and theres an error with 
      credentials''',
      build: () async {
        when(mockSigninRepository.signInWithGoogle())
            .thenThrow(InvalidCredentialsException());
        return signinBloc;
      },
      act: (signinBloc) {
        signinBloc.add(SigninWithGoogle());
        return;
      },
      verify: (signinBloc) async {
        verify(mockSigninRepository.signInWithGoogle()).called(1);
      },
      expect: [
        SigninLoading(),
        SigninFailed(ERROR_INVALID_CREDENTIALS),
      ],
    );

    blocTest(
      '''Expects [SigninLoading, UserAuthenticationFailed] with 
      ERROR_AUTENTICATING_USER when SigninWithEmailAndPassword added and theres an error''',
      build: () async {
        when(mockSigninRepository.signInWithEmailAndPassword(any, any))
            .thenAnswer((_) => Future.value(null));
        return signinBloc;
      },
      act: (signinBloc) {
        signinBloc.add(SigninWithEmailAndPassword('', ''));
        return;
      },
      verify: (signinBloc) async {
        verify(mockSigninRepository.signInWithEmailAndPassword(any, any))
            .called(1);
      },
      expect: [
        SigninLoading(),
        UserAuthenticationFailed(ERROR_AUTENTICATING_USER),
      ],
    );

    blocTest(
      '''Expects [SigninLoading, UserAuthenticationFailed] with 
      ERROR_AUTENTICATING_USER when SigninWithGoogle added and theres an error''',
      build: () async {
        when(mockSigninRepository.signInWithGoogle())
            .thenAnswer((_) => Future.value(null));
        return signinBloc;
      },
      act: (signinBloc) {
        signinBloc.add(SigninWithGoogle());
        return;
      },
      verify: (signinBloc) async {
        verify(mockSigninRepository.signInWithGoogle()).called(1);
      },
      expect: [
        SigninLoading(),
        UserAuthenticationFailed(ERROR_AUTENTICATING_USER),
      ],
    );

    blocTest(
      '''Expects [SigninLoading, SigninFailed] with 
      ERROR_SIGNIN when SigninWithGoogle added and theres an error''',
      build: () async {
        when(mockSigninRepository.signInWithGoogle()).thenThrow(Exception());
        return signinBloc;
      },
      act: (signinBloc) {
        signinBloc.add(SigninWithGoogle());
        return;
      },
      verify: (signinBloc) async {
        verify(mockSigninRepository.signInWithGoogle()).called(1);
      },
      expect: [
        SigninLoading(),
        SigninFailed(ERROR_SIGNIN),
      ],
    );
  });
}
