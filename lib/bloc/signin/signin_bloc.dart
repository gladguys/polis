import 'dart:async';

import 'package:bloc/bloc.dart';

import '../../core/exception/invalid_credentials_exception.dart';
import '../../core/service/analytics_service.dart';
import '../../i18n/message.dart';
import '../../model/user_model.dart';
import '../../repository/abstract/signin_repository.dart';
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
  SigninBloc({this.repository, this.analyticsService});

  final SigninRepository repository;
  final AnalyticsService analyticsService;

  @override
  SigninState get initialState => InitialSignin();

  @override
  Stream<SigninState> mapEventToState(SigninEvent event) async* {
    if (event is SigninWithEmailAndPassword) {
      yield SigninLoading();
      try {
        final user = await repository.signInWithEmailAndPassword(
            event.email, event.password);

        yield* _tryToAuthUser(user, SigninMethod.emailAndPassword);
      } on InvalidCredentialsException {
        yield SigninFailed(ERROR_INVALID_CREDENTIALS);
      } on Exception {
        yield SigninFailed(ERROR_SIGNIN);
      }
    }
    if (event is SigninWithGoogle) {
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
  }

  Stream<SigninState> _tryToAuthUser(
      UserModel user, SigninMethod method) async* {
    if (user != null) {
      await analyticsService.setUserProperties(userId: user.userId);
      await analyticsService.logSignin(method: _getSigninMethod(method));
      yield UserAuthenticated(user);
    } else {
      yield UserAuthenticationFailed(ERROR_AUTENTICATING_USER);
    }
  }
}
