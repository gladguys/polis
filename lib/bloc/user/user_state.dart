part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();
}

class InitialUser extends UserState {
  @override
  List<Object> get props => [];
}

class SignoutLoading extends UserState {
  @override
  List<Object> get props => [];
}

class SignoutSucceded extends UserState {
  @override
  List<Object> get props => [];
}

class SignoutFailed extends UserState {
  @override
  List<Object> get props => [];
}

class CurrentUserUpdated extends UserState {
  CurrentUserUpdated(this.user);

  final UserModel user;

  @override
  List<Object> get props => [user];
}

class UpdateCurrentUserFailed extends UserState {
  @override
  List<Object> get props => [];
}

class CurrentUserConfigUpdated extends UserState {
  CurrentUserConfigUpdated({this.user, this.config, this.value});

  final UserModel user;
  final String config;
  final dynamic value;

  @override
  List<Object> get props => [user, config, value];
}

class UpdateUserConfigFailed extends UserState {
  @override
  List<Object> get props => [];
}
