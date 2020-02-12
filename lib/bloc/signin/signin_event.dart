import 'package:equatable/equatable.dart';

abstract class SigninEvent extends Equatable {}

class SigninTriedEvent extends SigninEvent {
  SigninTriedEvent(this.email, this.password);

  final String email;
  final String password;

  @override
  List<Object> get props => [email, password];
}
