import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:polis/core/exception/exceptions.dart';
import 'package:polis/message/message.dart';
import 'package:polis/repository/abstract/signup_repository.dart';

import './bloc.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc({this.repository});

  SignupRepository repository;

  @override
  SignupState get initialState => InitialSignupState();

  @override
  Stream<SignupState> mapEventToState(SignupEvent event) async* {
    if (event is SignupTriedEvent) {
      yield SignupLoadingState();
      try {
        final user = await repository.createUserWithEmailAndPassword(
            event.email, event.password);
        yield UserCreatedState(user);
      } on EmailAlreadyInUseException {
        yield UserCreationFailedState(EMAIL_ALREADY_IN_USE);
      } on WeakPasswordException {
        yield UserCreationFailedState(PASSWORD_IS_WEAK);
      } catch (e) {
        yield SignupFailedState(ERRO_CADASTRO_USUARIO);
      }
    }
  }
}
