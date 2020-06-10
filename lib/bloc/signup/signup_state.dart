import 'package:equatable/equatable.dart';
import 'package:sealed_class/sealed_class.dart';

part 'signup_state.g.dart';

@Sealed([
  InitialSignup,
  UserCreated,
  UserCreationFailed,
  SignupFailed,
  SignupLoading,
])
abstract class SignupState extends Equatable {}

class InitialSignup extends SignupState {
  @override
  List<Object> get props => [];
}

class UserCreated extends SignupState {
  @override
  List<Object> get props => [];
}

class UserCreationFailed extends SignupState {
  UserCreationFailed(this.statusMessage);

  final String statusMessage;

  @override
  List<Object> get props => [statusMessage];
}

class SignupFailed extends SignupState {
  SignupFailed(this.errorMessage);

  final String errorMessage;

  @override
  List<Object> get props => [errorMessage];
}

class SignupLoading extends SignupState {
  @override
  List<Object> get props => [];
}
