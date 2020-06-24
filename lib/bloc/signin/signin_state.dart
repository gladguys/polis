import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core/domain/model/models.dart';

part 'signin_state.freezed.dart';

@freezed
abstract class SigninState with _$SigninState {
  factory SigninState.initial() = InitialSignin;
  factory SigninState.signinLoading() = SigninLoading;
  factory SigninState.sentingResetEmail() = SentingResetEmail;
  factory SigninState.userAuthenticated(UserModel user) = UserAuthenticated;
  factory SigninState.userAuthenticationFailed(String statusMessage) =
      UserAuthenticationFailed;
  factory SigninState.signinFailed(String errorMessage) = SigninFailed;
  factory SigninState.resetEmailSentSuccess() = ResetEmailSentSuccess;
  factory SigninState.resetEmailSentFailed() = ResetEmailSentFailed;
}
