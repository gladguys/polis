import 'dart:io';

import 'package:equatable/equatable.dart';

import '../../core/domain/model/models.dart';

abstract class EditProfileEvent extends Equatable {
  const EditProfileEvent();
}

class UpdateUserInfo extends EditProfileEvent {
  UpdateUserInfo({this.currentUser, this.name, this.email, this.pickedPhoto});

  final UserModel currentUser;
  final String name;
  final String email;
  final File pickedPhoto;

  @override
  List<Object> get props => [currentUser, name, email, pickedPhoto];
}
