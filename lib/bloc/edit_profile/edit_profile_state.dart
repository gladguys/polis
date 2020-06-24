import 'package:freezed_annotation/freezed_annotation.dart';

part 'edit_profile_state.freezed.dart';

@freezed
abstract class EditProfileState with _$EditProfileState {
  factory EditProfileState.initial() = InitialEditProfileState;
  factory EditProfileState.updatingUser() = UpdatingUser;
  factory EditProfileState.userUpdateSuccess() = UserUpdateSuccess;
  factory EditProfileState.userUpdateFailed() = UserUpdateFailed;
}
