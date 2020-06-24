import 'package:freezed_annotation/freezed_annotation.dart';

part 'change_password_event.freezed.dart';

@freezed
abstract class ChangePasswordEvent with _$ChangePasswordEvent {
  factory ChangePasswordEvent.changeUserPassword({
    @required String currentPassword,
    @required String newPassword,
  }) = ChangeUserPassword;
}
