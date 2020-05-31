import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../core/exception/exceptions.dart';
import '../../repository/abstract/change_password_repository.dart';

part 'change_password_event.dart';
part 'change_password_state.dart';

class ChangePasswordBloc
    extends Bloc<ChangePasswordEvent, ChangePasswordState> {
  ChangePasswordBloc({@required this.repository}) : assert(repository != null);

  final ChangePasswordRepository repository;

  @override
  ChangePasswordState get initialState => InitialChangePasswordState();

  @override
  Stream<ChangePasswordState> mapEventToState(
      ChangePasswordEvent event) async* {
    if (event is ChangeUserPassword) {
      yield* _mapChangeUserPasswordToState(event);
    }
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
