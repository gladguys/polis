part of 'signin_bloc.dart';

abstract class SigninEvent extends Equatable {}

class SigninWithEmailAndPassword extends SigninEvent {
  SigninWithEmailAndPassword(this.email, this.password);

  final String email;
  final String password;

  @override
  List<Object> get props => [email, password];
}

class SigninWithGoogle extends SigninEvent {
  @override
  List<Object> get props => [];
}

class SendResetPasswordEmail extends SigninEvent {
  SendResetPasswordEmail(this.email);

  final String email;

  @override
  List<Object> get props => [email];
}
