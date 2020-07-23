import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../core/exception/exceptions.dart';
import '../../core/repository/abstract/change_password_repository.dart';

part 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit({@required this.repository})
      : assert(repository != null),
        super(InitialChangePasswordState());

  final ChangePasswordRepository repository;

  void changeUserPassword({String currentPassword, String newPassword}) async {
    emit(UserPasswordChanging());

    try {
      await repository.changeUserPassword(
        currentPassword: currentPassword,
        newPassword: newPassword,
      );
      emit(UserPasswordChangeSuccess());
    } on WrongPasswordException {
      emit(UserWrongPasswordInformed());
    } on Exception {
      emit(UserPasswordChangeFailed());
    }
  }
}
