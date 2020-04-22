part of 'signup_bloc.dart';

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

class SignupLoading extends SignupState {
  @override
  List<Object> get props => [];
}

class SignupFailed extends SignupState {
  SignupFailed(this.errorMessage);

  final String errorMessage;

  @override
  List<Object> get props => [errorMessage];
}
