import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../core/exception/exceptions.dart';
import '../../core/repository/abstract/change_password_repository.dart';
import 'bloc.dart';

class ChangePasswordBloc
    extends Bloc<ChangePasswordEvent, ChangePasswordState> {
  ChangePasswordBloc({@required this.repository}) : assert(repository != null);

  final ChangePasswordRepository repository;

  @override
  ChangePasswordState get initialState => InitialChangePasswordState();

  @override
  Stream<ChangePasswordState> mapEventToState(
      ChangePasswordEvent event) async* {
    yield* _mapChangeUserPasswordToState(event);
  }

  Stream<ChangePasswordState> _mapChangeUserPasswordToState(
      ChangeUserPassword event) async* {
    yield UserPasswordChanging();

    try {
      await repository.changeUserPassword(
        currentPassword: event.currentPassword,
        newPassword: event.newPassword,
      );
      yield UserPasswordChangeSuccess();
    } on WrongPasswordException {
      yield UserWrongPasswordInformed();
    } on Exception {
      yield UserPasswordChangeFailed();
    }
  }
}
