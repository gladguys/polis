import 'package:equatable/equatable.dart';

import '../../model/models.dart';

abstract class SigninState extends Equatable {
  const SigninState();
}

class InitialSignin extends SigninState {
  @override
  List<Object> get props => [];
}

class SigninLoading extends SigninState {
  @override
  List<Object> get props => [];
}

class UserAuthenticated extends SigninState {
  UserAuthenticated(this.user);

  final UserModel user;

  @override
  List<Object> get props => [user];
}

class UserAuthenticationFailed extends SigninState {
  UserAuthenticationFailed(this.statusMessage);

  final String statusMessage;

  @override
  List<Object> get props => [statusMessage];
}

class SigninFailed extends SigninState {
  SigninFailed(this.errorMessage);

  final String errorMessage;

  @override
  List<Object> get props => [errorMessage];
}
