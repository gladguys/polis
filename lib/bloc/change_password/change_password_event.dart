part of 'change_password_bloc.dart';

abstract class ChangePasswordEvent extends Equatable {
  const ChangePasswordEvent();
}

class ChangeUserPassword extends ChangePasswordEvent {
  ChangeUserPassword(
      {@required this.currentPassword, @required this.newPassword})
      : assert(currentPassword != null),
        assert(newPassword != null);

  final String currentPassword;
  final String newPassword;

  @override
  List<Object> get props => [currentPassword, newPassword];
}
