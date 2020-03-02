import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import './bloc.dart';
import '../../core/exception/exceptions.dart';
import '../../core/service/analytics_service.dart';
import '../../i18n/message.dart';
import '../../repository/abstract/signup_repository.dart';

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
      yield SignupLoading();
      try {
        await repository.createUserWithEmailAndPassword(event.user);
        await analyticsService.logSignup();
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
