import 'package:freezed_annotation/freezed_annotation.dart';

part 'signin_event.freezed.dart';

@freezed
abstract class SigninEvent with _$SigninEvent {
  factory SigninEvent.signinWithEmailAndPassword(
      String email, String password) = SigninWithEmailAndPassword;
  factory SigninEvent.signinWithGoogle() = SigninWithGoogle;
  factory SigninEvent.sendResetPasswordEmail(String email) =
      SendResetPasswordEmail;
}
