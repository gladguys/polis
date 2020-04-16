import 'package:equatable/equatable.dart';

abstract class ChangePasswordEvent extends Equatable {
  const ChangePasswordEvent();
}

class ChangeUserPassword extends ChangePasswordEvent {
  ChangeUserPassword({this.currentPassword, this.newPassword});

  final String currentPassword;
  final String newPassword;

  @override
  List<Object> get props => [currentPassword, newPassword];
}
