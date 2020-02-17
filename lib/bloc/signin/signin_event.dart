import 'package:equatable/equatable.dart';

abstract class SigninEvent extends Equatable {}

class Signin extends SigninEvent {
  Signin(this.email, this.password);

  final String email;
  final String password;

  @override
  List<Object> get props => [email, password];
}

class SigninWithGoogle extends SigninEvent {
  @override
  List<Object> get props => [];
}
