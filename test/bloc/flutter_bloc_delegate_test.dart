import 'package:bloc/bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:polis/bloc/blocs.dart';
import 'package:polis/bloc/flutter_bloc_delegate.dart';
import 'package:polis/model/user_model.dart';

void main() {
  group('FlutterBlocDelegate tests', () {
    FlutterBlocDelegate delegate;
    SigninBloc signinBloc;

    setUp(() {
      delegate = FlutterBlocDelegate();
      signinBloc = SigninBloc();
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
    });

    test('onError test', () {
      delegate.onError(signinBloc, 'error', null);
    });
  });
}
