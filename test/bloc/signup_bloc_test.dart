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

  group('SignupBloc tests', () {
    SignupCubit signupCubit;
    MockSignupRepository mockSignupRepository;
    MockAnalyticsService mockAnalyticsService;
    user =
        UserModel(name: 'polis', email: 'polis@gmail.com', password: 'random');

    setUp(() {
      mockSignupRepository = MockSignupRepository();
      mockAnalyticsService = MockAnalyticsService();
      signupCubit = SignupCubit(
          repository: mockSignupRepository,
          analyticsService: mockAnalyticsService);
    });

    tearDown(() {
      signupCubit?.close();
    });

    test('asserts', () {
      expect(
          () => SignupCubit(
              repository: mockSignupRepository, analyticsService: null),
          throwsAssertionError);
      expect(
          () => SignupCubit(
              repository: null, analyticsService: mockAnalyticsService),
          throwsAssertionError);
    });

    test('Expects InitialSignup to be the initial state', () {
      expect(signupCubit.state, equals(InitialSignup()));
    });

    blocTest(
      'Expects [SignupLoading, UserCreated] when '
      'SignupTriedEvent added',
      build: () {
        when(mockSignupRepository.createUserWithEmailAndPassword(any, any))
            .thenAnswer((_) => Future.value(user));
        when(mockAnalyticsService.logSignup())
            .thenAnswer((_) => Future.value());
        return signupCubit;
      },
      act: (signupCubit) {
        signupCubit.signup(user: UserModel(), profilePhoto: null);
        return;
      },
      verify: (signupCubit) async {
        verify(mockSignupRepository.createUserWithEmailAndPassword(any, any))
            .called(1);
        verify(mockAnalyticsService.logSignup()).called(1);
      },
      expect: [
        SignupLoading(),
        UserCreated(),
      ],
    );

    blocTest(
      '''Expects [SignupLoading, UserCreationFailed] with 
      EMAIL_ALREADY_IN_USE message when SignupTried added and email already token''',
      build: () {
        when(mockSignupRepository.createUserWithEmailAndPassword(any, any))
            .thenThrow(EmailAlreadyInUseException());
        return signupCubit;
      },
      act: (signupCubit) {
        signupCubit.signup(user: UserModel(), profilePhoto: null);
        return;
      },
      verify: (signupCubit) async {
        verify(mockSignupRepository.createUserWithEmailAndPassword(any, any))
            .called(1);
      },
      expect: [
        SignupLoading(),
        UserCreationFailed(EMAIL_ALREADY_IN_USE),
      ],
    );

    blocTest(
      '''Expects [SignupLoading, UserCreationFailed] with 
      PASSWORD_IS_WEAK message when SignupTried added and email already token''',
      build: () {
        when(mockSignupRepository.createUserWithEmailAndPassword(any, any))
            .thenThrow(WeakPasswordException());
        return signupCubit;
      },
      act: (signupCubit) {
        signupCubit.signup(user: UserModel(), profilePhoto: null);
        return;
      },
      verify: (signupCubit) async {
        verify(mockSignupRepository.createUserWithEmailAndPassword(any, any))
            .called(1);
      },
      expect: [
        SignupLoading(),
        UserCreationFailed(PASSWORD_IS_WEAK),
      ],
    );

    blocTest(
      '''Expects [SignupLoading, UserCreationFailed] with 
      EMAIL_IS_INVALID message when SignupTried added and email with invalid format''',
      build: () {
        when(mockSignupRepository.createUserWithEmailAndPassword(any, any))
            .thenThrow(InvalidEmailException());
        return signupCubit;
      },
      act: (signupCubit) {
        signupCubit.signup(user: UserModel(), profilePhoto: null);
        return;
      },
      verify: (signupCubit) async {
        verify(mockSignupRepository.createUserWithEmailAndPassword(any, any))
            .called(1);
      },
      expect: [
        SignupLoading(),
        UserCreationFailed(EMAIL_IS_INVALID),
      ],
    );

    blocTest(
      'Expects [SignupLoading, SignupFailed] when signup '
      'failled somehow',
      build: () {
        when(mockSignupRepository.createUserWithEmailAndPassword(any, any))
            .thenThrow(Exception());
        return signupCubit;
      },
      act: (signupCubit) {
        signupCubit.signup(user: UserModel(), profilePhoto: null);
        return;
      },
      verify: (signupCubit) async {
        verify(mockSignupRepository.createUserWithEmailAndPassword(any, any))
            .called(1);
      },
      expect: [
        SignupLoading(),
        SignupFailed(ERROR_CREATING_USER),
      ],
    );
  });
}
