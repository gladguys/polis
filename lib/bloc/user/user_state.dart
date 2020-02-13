import 'package:equatable/equatable.dart';

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
