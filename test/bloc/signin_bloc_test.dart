import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/bloc/blocs.dart';
import 'package:polis/message/message.dart';
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
      ' when SigninTried added',
      build: () {
        when(mockSigninRepository.signInWithEmailAndPassword(any, any))
            .thenAnswer((_) => Future.value(user));
        return signinBloc;
      },
      act: (signinBloc) {
        signinBloc.add(SigninTried('', ''));
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
      'Expects [InitialSignin, SigninLoading, SigninFailed] with '
      'ERROR_FIREBASE_SIGNIN when SigninWithGoogle added and theres an error',
      build: () {
        when(mockSigninRepository.signInWithEmailAndPassword(any, any))
            .thenThrow(Exception(ERROR_SIGNIN));
        return signinBloc;
      },
      act: (signinBloc) {
        signinBloc.add(SigninTried('', ''));
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
      'Expects [InitialSignin, SigninLoading, UserAuthenticated] when '
      'SigninTriedEvent added',
      build: () {
        when(mockSigninRepository.signInWithEmailAndPassword(any, any))
            .thenAnswer((_) => Future.value(null));
        return signinBloc;
      },
      act: (signinBloc) {
        signinBloc.add(SigninTried('', ''));
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
      'Expects [InitialSignin, SigninLoading, UserAuthenticated] when '
      'SigninWithGoogle added',
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
      'Expects [InitialSignin, SigninLoading, UserAuthenticationFailed]'
      'when SigninWithGoogle added and theres no user',
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
        UserAuthenticationFailed(ERROR_INVALID_CREDENTIALS),
      ],
    );

    blocTest(
      'Expects [InitialSignin, SigninLoading, SigninFailed] with '
      'ERROR_GOOGLE_SIGNIN when SigninWithGoogle added and theres an error',
      build: () {
        when(mockSigninRepository.signInWithGoogle())
            .thenThrow(Exception(ERROR_GOOGLE_SIGNIN));
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
        SigninFailed(ERROR_GOOGLE_SIGNIN),
      ],
    );
  });
}
