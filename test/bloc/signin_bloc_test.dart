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
    user =
        UserModel(name: 'polis', email: 'polis@gmail.com', password: 'random');

    setUp(() {
      mockSigninRepository = MockSigninRepository();
      signinBloc = SigninBloc(repository: mockSigninRepository);
    });

    blocTest(
      'Expects InitialSignin to be the initial state',
      build: () => signinBloc,
      expect: [
        InitialSignin(),
      ],
    );

    blocTest(
      'Expects [InitialSignin, SigninLoading, UserAuthenticated]'
      ' when SigninWithEmailAndPassword added',
      build: () {
        when(mockSigninRepository.signInWithEmailAndPassword(any, any))
            .thenAnswer((_) => Future.value(user));
        return signinBloc;
      },
      act: (signinBloc) {
        signinBloc.add(SigninWithEmailAndPassword('', ''));
        return;
      },
      verify: () async {
        verify(mockSigninRepository.signInWithEmailAndPassword(any, any))
            .called(1);
      },
      expect: [
        InitialSignin(),
        SigninLoading(),
        UserAuthenticated(user),
      ],
    );

    blocTest(
      'Expects [InitialSignin, SigninLoading, UserAuthenticated]'
      ' when SigninWithGoogle added',
      build: () {
        when(mockSigninRepository.signInWithGoogle())
            .thenAnswer((_) => Future.value(user));
        return signinBloc;
      },
      act: (signinBloc) {
        signinBloc.add(SigninWithGoogle());
        return;
      },
      verify: () async {
        verify(mockSigninRepository.signInWithGoogle()).called(1);
      },
      expect: [
        InitialSignin(),
        SigninLoading(),
        UserAuthenticated(user),
      ],
    );

    blocTest(
      '''Expects [InitialSignin, SigninLoading, SigninFailed] with 
      ERROR_INVALID_CREDENTIALS when SigninWithEmailAndPassword added and theres an error with 
      credentials''',
      build: () {
        when(mockSigninRepository.signInWithEmailAndPassword(any, any))
            .thenThrow(InvalidCredentialsException());
        return signinBloc;
      },
      act: (signinBloc) {
        signinBloc.add(SigninWithEmailAndPassword('', ''));
        return;
      },
      verify: () async {
        verify(mockSigninRepository.signInWithEmailAndPassword('', ''))
            .called(1);
      },
      expect: [
        InitialSignin(),
        SigninLoading(),
        SigninFailed(ERROR_INVALID_CREDENTIALS),
      ],
    );

    blocTest(
      'Expects [InitialSignin, SigninLoading, SigninFailed] with '
      'ERROR_SIGNIN when SigninWithEmailAndPassword added and theres an error',
      build: () {
        when(mockSigninRepository.signInWithEmailAndPassword(any, any))
            .thenThrow(Exception(ERROR_SIGNIN));
        return signinBloc;
      },
      act: (signinBloc) {
        signinBloc.add(SigninWithEmailAndPassword('', ''));
        return;
      },
      verify: () async {
        verify(mockSigninRepository.signInWithEmailAndPassword('', ''))
            .called(1);
      },
      expect: [
        InitialSignin(),
        SigninLoading(),
        SigninFailed(ERROR_SIGNIN),
      ],
    );

    blocTest(
      '''Expects [InitialSignin, SigninLoading, SigninFailed] with 
      ERROR_INVALID_CREDENTIALS when SigninWithGoogle added and theres an error with 
      credentials''',
      build: () {
        when(mockSigninRepository.signInWithGoogle())
            .thenThrow(InvalidCredentialsException());
        return signinBloc;
      },
      act: (signinBloc) {
        signinBloc.add(SigninWithGoogle());
        return;
      },
      verify: () async {
        verify(mockSigninRepository.signInWithGoogle()).called(1);
      },
      expect: [
        InitialSignin(),
        SigninLoading(),
        SigninFailed(ERROR_INVALID_CREDENTIALS),
      ],
    );

    blocTest(
      '''Expects [InitialSignin, SigninLoading, UserAuthenticationFailed] with 
      ERROR_AUTENTICATING_USER when SigninWithEmailAndPassword added and theres an error''',
      build: () {
        when(mockSigninRepository.signInWithEmailAndPassword(any, any))
            .thenAnswer((_) => Future.value(null));
        return signinBloc;
      },
      act: (signinBloc) {
        signinBloc.add(SigninWithEmailAndPassword('', ''));
        return;
      },
      verify: () async {
        verify(mockSigninRepository.signInWithEmailAndPassword(any, any))
            .called(1);
      },
      expect: [
        InitialSignin(),
        SigninLoading(),
        UserAuthenticationFailed(ERROR_AUTENTICATING_USER),
      ],
    );

    blocTest(
      '''Expects [InitialSignin, SigninLoading, UserAuthenticationFailed] with 
      ERROR_AUTENTICATING_USER when SigninWithGoogle added and theres an error''',
      build: () {
        when(mockSigninRepository.signInWithGoogle())
            .thenAnswer((_) => Future.value(null));
        return signinBloc;
      },
      act: (signinBloc) {
        signinBloc.add(SigninWithGoogle());
        return;
      },
      verify: () async {
        verify(mockSigninRepository.signInWithGoogle()).called(1);
      },
      expect: [
        InitialSignin(),
        SigninLoading(),
        UserAuthenticationFailed(ERROR_AUTENTICATING_USER),
      ],
    );

    blocTest(
      '''Expects [InitialSignin, SigninLoading, SigninFailed] with 
      ERROR_SIGNIN when SigninWithGoogle added and theres an error''',
      build: () {
        when(mockSigninRepository.signInWithGoogle()).thenThrow(Exception());
        return signinBloc;
      },
      act: (signinBloc) {
        signinBloc.add(SigninWithGoogle());
        return;
      },
      verify: () async {
        verify(mockSigninRepository.signInWithGoogle()).called(1);
      },
      expect: [
        InitialSignin(),
        SigninLoading(),
        SigninFailed(ERROR_SIGNIN),
      ],
    );
  });
}
