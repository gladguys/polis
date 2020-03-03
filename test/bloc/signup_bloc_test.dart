import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/bloc/blocs.dart';
import 'package:polis/core/exception/exceptions.dart';
import 'package:polis/i18n/message.dart';
import 'package:polis/model/user_model.dart';

import '../mock.dart';

void main() {
  UserModel user;

  group('SignupBloc tests', () {
    SignupBloc signupBloc;
    MockSignupRepository mockSignupRepository;
    MockAnalyticsService mockAnalyticsService;
    user =
        UserModel(name: 'polis', email: 'polis@gmail.com', password: 'random');

    setUp(() {
      mockSignupRepository = MockSignupRepository();
      mockAnalyticsService = MockAnalyticsService();
      signupBloc = SignupBloc(
          repository: mockSignupRepository,
          analyticsService: mockAnalyticsService);
    });

    test('asserts', () {
      expect(
          () => SignupBloc(
              repository: mockSignupRepository, analyticsService: null),
          throwsAssertionError);
      expect(
          () => SignupBloc(
              repository: null, analyticsService: mockAnalyticsService),
          throwsAssertionError);
    });

    test('Expects InitialSignup to be the initial state', () {
      expect(signupBloc.state, equals(InitialSignup()));
    });

    blocTest(
      'Expects [SignupLoading, UserCreated] when '
      'SignupTriedEvent added',
      build: () async {
        when(mockSignupRepository.createUserWithEmailAndPassword(any))
            .thenAnswer((_) => Future.value(user));
        when(mockAnalyticsService.logSignup())
            .thenAnswer((_) => Future.value());
        return signupBloc;
      },
      act: (signupBloc) {
        signupBloc.add(Signup(UserModel()));
        return;
      },
      verify: (signupBloc) async {
        verify(mockSignupRepository.createUserWithEmailAndPassword(any))
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
      build: () async {
        when(mockSignupRepository.createUserWithEmailAndPassword(any))
            .thenThrow(EmailAlreadyInUseException());
        return signupBloc;
      },
      act: (signupBloc) {
        signupBloc.add(Signup(UserModel()));
        return;
      },
      verify: (signupBloc) async {
        verify(mockSignupRepository.createUserWithEmailAndPassword(any))
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
      build: () async {
        when(mockSignupRepository.createUserWithEmailAndPassword(any))
            .thenThrow(WeakPasswordException());
        return signupBloc;
      },
      act: (signupBloc) {
        signupBloc.add(Signup(UserModel()));
        return;
      },
      verify: (signupBloc) async {
        verify(mockSignupRepository.createUserWithEmailAndPassword(any))
            .called(1);
      },
      expect: [
        SignupLoading(),
        UserCreationFailed(PASSWORD_IS_WEAK),
      ],
    );

    blocTest(
      'Expects [SignupLoading, SignupFailed] when signup '
      'failled somehow',
      build: () async {
        when(mockSignupRepository.createUserWithEmailAndPassword(any))
            .thenThrow(Exception());
        return signupBloc;
      },
      act: (signupBloc) {
        signupBloc.add(Signup(UserModel()));
        return;
      },
      verify: (signupBloc) async {
        verify(mockSignupRepository.createUserWithEmailAndPassword(any))
            .called(1);
      },
      expect: [
        SignupLoading(),
        SignupFailed(ERROR_CREATING_USER),
      ],
    );
  });
}
