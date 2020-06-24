part of 'change_password_bloc.dart';

abstract class ChangePasswordState extends Equatable {
  const ChangePasswordState();
}

class InitialChangePasswordState extends ChangePasswordState {
  @override
  List<Object> get props => [];
}

class UserPasswordChanging extends ChangePasswordState {
  @override
  List<Object> get props => [];
}

class UserPasswordChangeSuccess extends ChangePasswordState {
  @override
  List<Object> get props => [];
}

class UserWrongPasswordInformed extends ChangePasswordState {
  @override
  List<Object> get props => [];
}

class UserPasswordChangeFailed extends ChangePasswordState {
  @override
  List<Object> get props => [];
}
