import 'package:equatable/equatable.dart';

abstract class SignupEvent extends Equatable {}

class SignupTriedEvent extends SignupEvent {
  SignupTriedEvent(this.email, this.password);

  final String email;
  final String password;

  @override
  List<Object> get props => [email, password];
}
