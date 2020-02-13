import 'dart:async';

import 'package:bloc/bloc.dart';

import './bloc.dart';
import '../../core/exception/exceptions.dart';
import '../../i18n/message.dart';
import '../../repository/abstract/signup_repository.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc({this.repository});

  SignupRepository repository;

  @override
  SignupState get initialState => InitialSignup();

  @override
  Stream<SignupState> mapEventToState(SignupEvent event) async* {
    if (event is Signup) {
      yield SignupLoading();
      try {
        await repository.createUserWithEmailAndPassword(event.user);
        yield UserCreated();
      } on EmailAlreadyInUseException {
        yield UserCreationFailed(EMAIL_ALREADY_IN_USE);
      } on WeakPasswordException {
        yield UserCreationFailed(PASSWORD_IS_WEAK);
      } on Exception catch (_) {
        yield SignupFailed(ERROR_CREATING_USER);
      }
    }
  }
}
