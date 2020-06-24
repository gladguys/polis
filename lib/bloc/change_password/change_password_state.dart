import 'package:freezed_annotation/freezed_annotation.dart';

part 'change_password_state.freezed.dart';

@freezed
abstract class ChangePasswordState with _$ChangePasswordState {
  factory ChangePasswordState.initial() = InitialChangePasswordState;
  factory ChangePasswordState.userPasswordChanging() = UserPasswordChanging;
  factory ChangePasswordState.userPasswordChangeSuccess() =
      UserPasswordChangeSuccess;
  factory ChangePasswordState.userWrongPasswordInformed() =
      UserWrongPasswordInformed;
  factory ChangePasswordState.userPasswordChangeFailed() =
      UserPasswordChangeFailed;
}
