import 'package:equatable/equatable.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();
}

class Logout extends UserEvent {
  @override
  List<Object> get props => [];
}
