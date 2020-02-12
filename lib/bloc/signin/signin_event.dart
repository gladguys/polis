import 'package:equatable/equatable.dart';

abstract class SigninEvent extends Equatable {}

class SigninTried extends SigninEvent {
  SigninTried(this.email, this.password);

  final String email;
  final String password;

  @override
  List<Object> get props => [email, password];
}
