import 'package:equatable/equatable.dart';
import 'package:sealed_class/sealed_class.dart';

part 'change_password_state.g.dart';

@Sealed([
  InitialChangePasswordState,
  UserPasswordChangeSuccess,
  UserPasswordChanging,
  UserWrongPasswordInformed,
  UserPasswordChangeFailed,
])
abstract class ChangePasswordState extends Equatable {
  const ChangePasswordState();
}

class InitialChangePasswordState extends ChangePasswordState {
  @override
  List<Object> get props => [];
}

class UserPasswordChangeSuccess extends ChangePasswordState {
  @override
  List<Object> get props => [];
}

class UserPasswordChanging extends ChangePasswordState {
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
