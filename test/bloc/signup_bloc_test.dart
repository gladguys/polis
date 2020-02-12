import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/bloc/blocs.dart';
import 'package:polis/core/exception/exceptions.dart';
import 'package:polis/message/message.dart';
import 'package:polis/model/user_model.dart';

import '../mock.dart';

void main() {
  UserModel user;

  group('SignupBloc tests', () {
    SignupBloc signupBloc;
    MockSignupRepository mockSignupRepository;
    user =
        UserModel(name: 'polis', email: 'polis@gmail.com', password: 'random');

    setUp(() {
      mockSignupRepository = MockSignupRepository();
      signupBloc = SignupBloc(repository: mockSignupRepository);
    });

    blocTest(
      'Expects InitialSignin to be the initial state',
      build: () => signupBloc,
      expect: [
        InitialSignup(),
      ],
    );

    blocTest(
      'Expects [InitialSignup, SignupLoading, UserCreated] when '
      'SignupTriedEvent added',
      build: () {
        when(mockSignupRepository.createUserWithEmailAndPassword(any, any))
            .thenAnswer((_) => Future.value(user));
        return signupBloc;
      },
      act: (signupBloc) {
        signupBloc.add(SignupTried('', ''));
        return;
      },
      verify: () async {
        verify(mockSignupRepository.createUserWithEmailAndPassword(any, any))
            .called(1);
      },
      expect: [
        InitialSignup(),
        SignupLoading(),
        UserCreated(user),
      ],
    );

    blocTest(
      '''Expects [InitialSignup, SignupLoading, UserCreationFailed] with 
      EMAIL_ALREADY_IN_USE message when SignupTried added and email already token''',
      build: () {
        when(mockSignupRepository.createUserWithEmailAndPassword(any, any))
            .thenThrow(EmailAlreadyInUseException());
        return signupBloc;
      },
      act: (signupBloc) {
        signupBloc.add(SignupTried('', ''));
        return;
      },
      verify: () async {
        verify(mockSignupRepository.createUserWithEmailAndPassword(any, any))
            .called(1);
      },
      expect: [
        InitialSignup(),
        SignupLoading(),
        UserCreationFailed(EMAIL_ALREADY_IN_USE),
      ],
    );

    blocTest(
      '''Expects [InitialSignup, SignupLoading, UserCreationFailed] with 
      PASSWORD_IS_WEAK message when SignupTried added and email already token''',
      build: () {
        when(mockSignupRepository.createUserWithEmailAndPassword(any, any))
            .thenThrow(WeakPasswordException());
        return signupBloc;
      },
      act: (signupBloc) {
        signupBloc.add(SignupTried('', ''));
        return;
      },
      verify: () async {
        verify(mockSignupRepository.createUserWithEmailAndPassword(any, any))
            .called(1);
      },
      expect: [
        InitialSignup(),
        SignupLoading(),
        UserCreationFailed(PASSWORD_IS_WEAK),
      ],
    );

    blocTest(
      'Expects [InitialSignup, SignupLoading, SignupFailed] when signup '
      'failled somehow',
      build: () {
        when(mockSignupRepository.createUserWithEmailAndPassword(any, any))
            .thenThrow(Exception());
        return signupBloc;
      },
      act: (signupBloc) {
        signupBloc.add(SignupTried('', ''));
        return;
      },
      verify: () async {
        verify(mockSignupRepository.createUserWithEmailAndPassword(any, any))
            .called(1);
      },
      expect: [
        InitialSignup(),
        SignupLoading(),
        SignupFailed(ERROR_CREATING_USER),
      ],
    );
  });
}
