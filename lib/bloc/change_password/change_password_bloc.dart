import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../core/exception/exceptions.dart';
import '../../core/repository/abstract/change_password_repository.dart';
import 'change_password_event.dart';
import 'change_password_state.dart';

class ChangePasswordBloc
    extends Bloc<ChangePasswordEvent, ChangePasswordState> {
  ChangePasswordBloc({@required this.repository}) : assert(repository != null);

  final ChangePasswordRepository repository;

  @override
  ChangePasswordState get initialState => ChangePasswordState.initial();

  @override
  Stream<ChangePasswordState> mapEventToState(
      ChangePasswordEvent event) async* {
    yield* event.map(
      changeUserPassword: _mapChangeUserPasswordToState,
    );
  }

  Stream<ChangePasswordState> _mapChangeUserPasswordToState(
      ChangePasswordEvent event) async* {
    yield ChangePasswordState.userPasswordChanging();

    try {
      await repository.changeUserPassword(
        currentPassword: event.currentPassword,
        newPassword: event.newPassword,
      );
      yield ChangePasswordState.userPasswordChangeSuccess();
    } on WrongPasswordException {
      yield ChangePasswordState.userWrongPasswordInformed();
    } on Exception {
      yield ChangePasswordState.userPasswordChangeFailed();
    }
  }
}
