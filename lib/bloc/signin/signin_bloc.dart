import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../core/domain/model/models.dart';
import '../../core/exception/exceptions.dart';
import '../../core/i18n/i18n.dart';
import '../../core/repository/abstract/repositories.dart';
import '../../core/service/services.dart';
import 'bloc.dart';

enum SigninMethod { emailAndPassword, google }

String _getSigninMethod(SigninMethod signinMethod) {
  switch (signinMethod) {
    case SigninMethod.emailAndPassword:
      return 'EMAIL_AND_PASSWORD';
    case SigninMethod.google:
      return 'GOOGLE';
  }
  return null;
}

class SigninBloc extends Bloc<SigninEvent, SigninState> {
  SigninBloc(
      {@required this.repository,
      @required this.analyticsService,
      @required this.sharedPreferencesService,
      @required this.messageService})
      : assert(repository != null),
        assert(analyticsService != null),
        assert(sharedPreferencesService != null),
        assert(messageService != null);

  final SigninRepository repository;
  final AnalyticsService analyticsService;
  final SharedPreferencesService sharedPreferencesService;
  final MessageService messageService;

  @override
  SigninState get initialState => InitialSignin();

  @override
  Stream<SigninState> mapEventToState(SigninEvent event) async* {
    yield* event.join(
      _mapSigninWithEmailAndPasswordToState,
      _mapSigninWithGoogleToState,
      _mapSendResetPasswordEmailToState,
    );
  }

  Stream<SigninState> _mapSigninWithEmailAndPasswordToState(
      SigninWithEmailAndPassword event) async* {
    yield SigninLoading();
    try {
      final user = await repository.signInWithEmailAndPassword(
          event.email, event.password);

      yield* _tryToAuthUser(user, SigninMethod.emailAndPassword);
    } on InvalidCredentialsException {
      yield SigninFailed(ERROR_INVALID_CREDENTIALS);
    } on ComunicationException {
      yield SigninFailed(ERROR_SIGNIN);
    }
  }

  Stream<SigninState> _mapSigninWithGoogleToState(
      SigninWithGoogle event) async* {
    yield SigninLoading();
    try {
      final user = await repository.signInWithGoogle();

      yield* _tryToAuthUser(user, SigninMethod.google);
    } on InvalidCredentialsException {
      yield SigninFailed(ERROR_INVALID_CREDENTIALS);
    } on Exception {
      yield SigninFailed(ERROR_SIGNIN);
    }
  }

  Stream<SigninState> _mapSendResetPasswordEmailToState(
      SendResetPasswordEmail event) async* {
    try {
      yield SentingResetEmail();
      await repository.sendResetEmail(event.email);
      yield ResetEmailSentSuccess();
    } on Exception {
      yield ResetEmailSentFailed();
    }
  }

  Stream<SigninState> _tryToAuthUser(
      UserModel user, SigninMethod method) async* {
    if (user != null) {
      await analyticsService.setUserProperties(userId: user.userId);
      await analyticsService.logSignin(method: _getSigninMethod(method));
      await sharedPreferencesService.setUser(user);
      final fcmToken = await messageService.saveUserToken(userId: user.userId);
      yield UserAuthenticated(
        user.copyWith(fcmToken: fcmToken),
      );
    } else {
      yield UserAuthenticationFailed(ERROR_AUTENTICATING_USER);
    }
  }
}
