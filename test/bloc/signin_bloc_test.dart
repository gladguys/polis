import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/bloc/cubits.dart';
import 'package:polis/core/domain/model/models.dart';
import 'package:polis/core/exception/exceptions.dart';
import 'package:polis/core/i18n/i18n.dart';

import '../mock.dart';

void main() {
  UserModel user;

  group('SigninBloc tests', () {
    SigninCubit signinCubit;
    MockSigninRepository mockSigninRepository;
    MockAnalyticsService mockAnalyticsService;
    MockSharedPreferencesService mockSharedPreferencesService;
    MockMessageService mockMessageService;
    user = UserModel(
      userId: '1',
      name: 'polis',
      email: 'polis@gmail.com',
      password: 'random',
    );

    setUp(() {
      mockSigninRepository = MockSigninRepository();
      mockAnalyticsService = MockAnalyticsService();
      mockSharedPreferencesService = MockSharedPreferencesService();
      mockMessageService = MockMessageService();
      signinCubit = SigninCubit(
        repository: mockSigninRepository,
        analyticsService: mockAnalyticsService,
        sharedPreferencesService: mockSharedPreferencesService,
        messageService: mockMessageService,
      );
    });

    tearDown(() {
      signinCubit?.close();
    });

    test('asserts', () {
      expect(
          () => SigninCubit(
                repository: mockSigninRepository,
                analyticsService: null,
                sharedPreferencesService: null,
                messageService: null,
              ),
          throwsAssertionError);
      expect(
          () => SigninCubit(
                repository: null,
                analyticsService: mockAnalyticsService,
                sharedPreferencesService: null,
                messageService: null,
              ),
          throwsAssertionError);
      expect(
          () => SigninCubit(
                repository: mockSigninRepository,
                analyticsService: mockAnalyticsService,
                sharedPreferencesService: null,
                messageService: mockMessageService,
              ),
          throwsAssertionError);
      expect(
          () => SigninCubit(
                repository: mockSigninRepository,
                analyticsService: mockAnalyticsService,
                sharedPreferencesService: mockSharedPreferencesService,
                messageService: null,
              ),
          throwsAssertionError);
    });

    test('Expects InitialSignin to be the initial state', () {
      expect(signinCubit.state, equals(InitialSignin()));
    });

    blocTest(
      'Expects [SigninLoading, UserAuthenticated]'
      ' when SigninWithEmailAndPassword added',
      build: () {
        when(mockSigninRepository.signInWithEmailAndPassword(any, any))
            .thenAnswer((_) => Future.value(user));
        when(mockAnalyticsService.logSignin(method: anyNamed('method')))
            .thenAnswer((_) => Future.value());
        return signinCubit;
      },
      act: (signinCubit) {
        signinCubit.signinWithEmailAndPassword('', '');
        return;
      },
      verify: (signinCubit) async {
        verify(mockSigninRepository.signInWithEmailAndPassword(any, any))
            .called(1);
        verify(mockAnalyticsService.logSignin(method: 'EMAIL_AND_PASSWORD'))
            .called(1);
        verify(mockSharedPreferencesService.setUser(user)).called(1);
        verify(mockMessageService.saveUserToken(userId: '1')).called(1);
      },
      expect: [
        SigninLoading(),
        UserAuthenticated(user),
      ],
    );

    blocTest(
      'Expects [SentingResetEmail, ResetEmailSentSuccess]'
      ' when SendResetPasswordEmail added',
      build: () {
        when(mockSigninRepository.sendResetEmail('email@email.com'))
            .thenAnswer((_) => Future.value());
        return signinCubit;
      },
      act: (signinCubit) {
        signinCubit.sendResetPasswordEmail('email@email.com');
        return;
      },
      verify: (signinCubit) async {
        verify(mockSigninRepository.sendResetEmail('email@email.com'))
            .called(1);
      },
      expect: [
        SentingResetEmail(),
        ResetEmailSentSuccess(),
      ],
    );

    blocTest(
      'Expects [SentingResetEmail, ResetEmailSentFailed] when email send fails',
      build: () {
        when(mockSigninRepository.sendResetEmail('email@email.com'))
            .thenThrow(Exception());
        return signinCubit;
      },
      act: (signinCubit) {
        signinCubit.sendResetPasswordEmail('email@email.com');
        return;
      },
      verify: (signinBloc) async {
        verify(mockSigninRepository.sendResetEmail('email@email.com'))
            .called(1);
      },
      expect: [
        SentingResetEmail(),
        ResetEmailSentFailed(),
      ],
    );

    blocTest(
      'Expects [SigninLoading, UserAuthenticated]'
      ' when SigninWithGoogle added',
      build: () {
        when(mockSigninRepository.signInWithGoogle())
            .thenAnswer((_) => Future.value(user));
        when(mockAnalyticsService.logSignin(method: anyNamed('method')))
            .thenAnswer((_) => Future.value());
        return signinCubit;
      },
      act: (signinCubit) {
        signinCubit.signinWithGoogle();
        return;
      },
      verify: (signinCubit) async {
        verify(mockSigninRepository.signInWithGoogle()).called(1);
        verify(mockAnalyticsService.logSignin(method: 'GOOGLE')).called(1);
        verify(mockSharedPreferencesService.setUser(user)).called(1);
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
      build: () {
        when(mockSigninRepository.signInWithEmailAndPassword(any, any))
            .thenThrow(InvalidCredentialsException());
        return signinCubit;
      },
      act: (signinCubit) {
        signinCubit.signinWithEmailAndPassword('', '');
        return;
      },
      verify: (signinCubit) async {
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
      build: () {
        when(mockSigninRepository.signInWithEmailAndPassword(any, any))
            .thenThrow(ComunicationException());
        return signinCubit;
      },
      act: (signinCubit) {
        signinCubit.signinWithEmailAndPassword('', '');
        return;
      },
      verify: (signinCubit) async {
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
      build: () {
        when(mockSigninRepository.signInWithGoogle())
            .thenThrow(InvalidCredentialsException());
        return signinCubit;
      },
      act: (signinCubit) {
        signinCubit.signinWithGoogle();
        return;
      },
      verify: (signinCubit) async {
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
      build: () {
        when(mockSigninRepository.signInWithEmailAndPassword(any, any))
            .thenAnswer((_) => Future.value(null));
        return signinCubit;
      },
      act: (signinCubit) {
        signinCubit.signinWithEmailAndPassword('', '');
        return;
      },
      verify: (signinCubit) async {
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
      build: () {
        when(mockSigninRepository.signInWithGoogle())
            .thenAnswer((_) => Future.value(null));
        return signinCubit;
      },
      act: (signinCubit) {
        signinCubit.signinWithGoogle();
        return;
      },
      verify: (signinCubit) async {
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
      build: () {
        when(mockSigninRepository.signInWithGoogle()).thenThrow(Exception());
        return signinCubit;
      },
      act: (signinCubit) {
        signinCubit.signinWithGoogle();
        return;
      },
      verify: (signinCubit) async {
        verify(mockSigninRepository.signInWithGoogle()).called(1);
      },
      expect: [
        SigninLoading(),
        SigninFailed(ERROR_SIGNIN),
      ],
    );
  });
}
