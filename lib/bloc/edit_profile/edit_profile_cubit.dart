import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../core/domain/model/models.dart';
import '../../core/repository/abstract/edit_profile_repository.dart';
import '../cubits.dart';

part 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit({@required this.repository, @required this.userCubit})
      : assert(repository != null),
        assert(userCubit != null),
        super(InitialEditProfileState());

  final EditProfileRepository repository;
  final UserCubit userCubit;

  void updateUserInfo({
    UserModel currentUser,
    String name,
    String email,
    File pickedPhoto,
  }) async {
    emit(UpdatingUser());
    try {
      final userUpdated = await repository.updateUserInfo(
        currentUser: currentUser,
        name: name,
        email: email,
        pickedPhoto: pickedPhoto,
      );
      userCubit.updateCurrentUser(userUpdated);
      emit(UserUpdateSuccess());
    } on Exception {
      emit(UserUpdateFailed());
    }
  }
}
