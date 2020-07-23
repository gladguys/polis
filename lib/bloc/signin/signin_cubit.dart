import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../core/domain/model/models.dart';
import '../../core/exception/exceptions.dart';
import '../../core/i18n/i18n.dart';
import '../../core/repository/abstract/repositories.dart';
import '../../core/service/services.dart';

part 'signin_state.dart';

enum SigninMethod { emailAndPassword, google }

class SigninCubit extends Cubit<SigninState> {
  SigninCubit({
    @required this.repository,
    @required this.analyticsService,
    @required this.sharedPreferencesService,
    @required this.messageService,
  })  : assert(repository != null),
        assert(analyticsService != null),
        assert(sharedPreferencesService != null),
        assert(messageService != null),
        super(InitialSignin());

  final SigninRepository repository;
  final AnalyticsService analyticsService;
  final SharedPreferencesService sharedPreferencesService;
  final MessageService messageService;

  void signinWithEmailAndPassword(String email, String password) async {
    emit(SigninLoading());
    try {
      final user = await repository.signInWithEmailAndPassword(email, password);
      _tryToAuthUser(user, SigninMethod.emailAndPassword);
    } on InvalidCredentialsException {
      emit(SigninFailed(ERROR_INVALID_CREDENTIALS));
    } on ComunicationException {
      emit(SigninFailed(ERROR_SIGNIN));
    }
  }

  void signinWithGoogle() async {
    emit(SigninLoading());
    try {
      final user = await repository.signInWithGoogle();
      _tryToAuthUser(user, SigninMethod.google);
    } on InvalidCredentialsException {
      emit(SigninFailed(ERROR_INVALID_CREDENTIALS));
    } on Exception {
      emit(SigninFailed(ERROR_SIGNIN));
    }
  }

  void sendResetPasswordEmail(String email) async {
    try {
      emit(SentingResetEmail());
      await repository.sendResetEmail(email);
      emit(ResetEmailSentSuccess());
    } on Exception {
      emit(ResetEmailSentFailed());
    }
  }

  void _tryToAuthUser(UserModel user, SigninMethod method) async {
    if (user != null) {
      await analyticsService.setUserProperties(userId: user.userId);
      await analyticsService.logSignin(method: _getSigninMethod(method));
      await sharedPreferencesService.setUser(user);
      final fcmToken = await messageService.saveUserToken(userId: user.userId);
      emit(
        UserAuthenticated(
          user.copyWith(fcmToken: fcmToken),
        ),
      );
    } else {
      emit(UserAuthenticationFailed(ERROR_AUTENTICATING_USER));
    }
  }
}

String _getSigninMethod(SigninMethod signinMethod) {
  switch (signinMethod) {
    case SigninMethod.emailAndPassword:
      return 'EMAIL_AND_PASSWORD';
    case SigninMethod.google:
      return 'GOOGLE';
  }
  return null;
}
