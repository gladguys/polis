import 'package:equatable/equatable.dart';

abstract class SignupEvent extends Equatable {}

class SignupTried extends SignupEvent {
  SignupTried(this.email, this.password);

  final String email;
  final String password;

  @override
  List<Object> get props => [email, password];
}
