import 'package:equatable/equatable.dart';
import 'package:sealed_class/sealed_class.dart';

part 'signin_event.g.dart';

@Sealed([
  SigninWithEmailAndPassword,
  SigninWithGoogle,
  SendResetPasswordEmail,
])
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
