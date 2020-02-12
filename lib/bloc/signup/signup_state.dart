import 'package:equatable/equatable.dart';
import 'package:polis/model/user_model.dart';

abstract class SignupState extends Equatable {}

class InitialSignupState extends SignupState {
  @override
  List<Object> get props => [];
}

class UserCreatedState extends SignupState {
  UserCreatedState(this.user);

  final UserModel user;

  @override
  List<Object> get props => [user];
}

class UserCreationFailedState extends SignupState {
  UserCreationFailedState(this.statusMessage);

  final String statusMessage;

  @override
  List<Object> get props => [statusMessage];
}

class SignupLoadingState extends SignupState {
  @override
  List<Object> get props => [];
}

class SignupFailedState extends SignupState {
  SignupFailedState(this.errorMessage);

  final String errorMessage;

  @override
  List<Object> get props => [errorMessage];
}
