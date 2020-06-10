import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../core/exception/exceptions.dart';
import '../../core/i18n/i18n.dart';
import '../../core/repository/abstract/repositories.dart';
import '../../core/service/services.dart';
import 'bloc.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc({@required this.repository, @required this.analyticsService})
      : assert(repository != null),
        assert(analyticsService != null);

  final SignupRepository repository;
  final AnalyticsService analyticsService;

  @override
  SignupState get initialState => InitialSignup();

  @override
  Stream<SignupState> mapEventToState(SignupEvent event) async* {
    if (event is Signup) {
      yield* _mapSignupToState(event);
    }
  }

  Stream<SignupState> _mapSignupToState(Signup event) async* {
    yield SignupLoading();
    try {
      await repository.createUserWithEmailAndPassword(
          event.user, event.profilePhoto);
      await analyticsService.logSignup();
      yield UserCreated();
    } on EmailAlreadyInUseException {
      yield UserCreationFailed(EMAIL_ALREADY_IN_USE);
    } on WeakPasswordException {
      yield UserCreationFailed(PASSWORD_IS_WEAK);
    } on InvalidEmailException {
      yield UserCreationFailed(EMAIL_IS_INVALID);
    } on Exception catch (_) {
      yield SignupFailed(ERROR_CREATING_USER);
    }
  }
}
