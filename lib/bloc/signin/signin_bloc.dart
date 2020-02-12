import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:polis/repository/abstract/signin_repository.dart';

import 'bloc.dart';

class SigninBloc extends Bloc<SigninEvent, SigninState> {
  SigninBloc({this.repository});

  final SigninRepository repository;

  @override
  SigninState get initialState => InitialSigninState();

  @override
  Stream<SigninState> mapEventToState(SigninEvent event) async* {
    if (event is SigninTriedEvent) {
      try {
        final user = await repository.signInWithEmailAndPassword(
            event.email, event.password);

        if (user != null) {
          yield UserAuthenticatedState(user);
        } else {
          yield UserAuthenticationFailedState('Error validating user');
        }
      } catch (e) {
        yield SigninFailedState(e.toString());
      }
    }
  }
}
