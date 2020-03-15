import 'package:equatable/equatable.dart';

import '../../model/user_model.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();
}

class StoreUser extends UserEvent {
  StoreUser(this.user);

  final UserModel user;

  @override
  List<Object> get props => [user];
}

class Logout extends UserEvent {
  @override
  List<Object> get props => [];
}
