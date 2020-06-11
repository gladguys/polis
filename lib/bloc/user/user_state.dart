import 'package:equatable/equatable.dart';
import 'package:sealed_class/sealed_class.dart';

import '../../core/domain/model/models.dart';

part 'user_state.g.dart';

@Sealed([
  InitialUser,
  SignoutSucceded,
  SignoutLoading,
  SignoutFailed,
  CurrentUserUpdated,
])
abstract class UserState extends Equatable {
  const UserState();
}

class InitialUser extends UserState {
  @override
  List<Object> get props => [];
}

class SignoutSucceded extends UserState {
  @override
  List<Object> get props => [];
}

class SignoutLoading extends UserState {
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

class UserStoredSuccess extends UserState {
  @override
  List<Object> get props => [];
}
