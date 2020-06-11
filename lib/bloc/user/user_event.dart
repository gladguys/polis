import 'package:equatable/equatable.dart';
import 'package:sealed_class/sealed_class.dart';

import '../../core/domain/model/models.dart';

part 'user_event.g.dart';

@Sealed([
  StoreUser,
  Logout,
  UpdateCurrentUser,
])
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

class UpdateCurrentUser extends UserEvent {
  UpdateCurrentUser(this.user);

  final UserModel user;

  @override
  List<Object> get props => [user];
}
