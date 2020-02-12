import 'package:equatable/equatable.dart';
import 'package:polis/model/user_model.dart';

abstract class SigninState extends Equatable {
  const SigninState();
}

class InitialSigninState extends SigninState {
  @override
  List<Object> get props => [];
}

class UserAuthenticatedState extends SigninState {
  UserAuthenticatedState(this.user);

  final UserModel user;

  @override
  List<Object> get props => [user];
}

class UserAuthenticationFailedState extends SigninState {
  UserAuthenticationFailedState(this.statusMessage);

  final String statusMessage;

  @override
  List<Object> get props => [statusMessage];
}

class SigninFailedState extends SigninState {
  SigninFailedState(this.errorMessage);

  final String errorMessage;

  @override
  List<Object> get props => [errorMessage];
}
