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
  });
}
