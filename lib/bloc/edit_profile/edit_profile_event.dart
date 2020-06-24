import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core/domain/model/models.dart';

part 'edit_profile_event.freezed.dart';

@freezed
abstract class EditProfileEvent with _$EditProfileEvent {
  const factory EditProfileEvent.updateUserInfo({
    UserModel currentUser,
    String name,
    String email,
    File pickedPhoto,
  }) = UpdateUserInfo;
}
